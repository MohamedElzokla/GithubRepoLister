//
//  RepoListVC.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "RepoListVC.h"
#import "ServerConnection.h"
#import "Repo.h"
#import "RepoViewModel.h"
#import "RepoTVC.h"
#import "RepoDetailsVC.h"
#import "Animator.h"
@interface RepoListVC ()<UITableViewDataSource , UITableViewDelegate , RepoTVCDelegate,UIViewControllerTransitioningDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, strong) RepoViewModel * viewModel;
@property (weak)  RepoTVC *lastTappedCell;
@property Animator * transtion ;

@end

@implementation RepoListVC

- (void)viewDidLoad {
    [super viewDidLoad];

    self.viewModel = [RepoViewModel new];
    __weak RepoListVC * weakSelf = self;
    [self.viewModel getReposFromAPIOnCompletedBlock:^(Boolean finished) {
            [weakSelf.tableView reloadData];
    }];
    
}
 
//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.viewModel.numberOfSections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfItems:section];
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    RepoTVC* cell = [tableView dequeueReusableCellWithIdentifier:@"repoCell"];
    [cell configure:[self.viewModel itemAtIndexPath:section]];
    cell.delegate = self;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  102;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoTVC * cell = [tableView dequeueReusableCellWithIdentifier:@"commitCell"];
    
    if (!cell) {
        assert(false);
    }
    
    [cell configureCommit:[self.viewModel commitAtIndexPath:indexPath]];
    cell.delegate = self;
    return cell;
}

//MARK: - RepoTVCDelegate
- (void)didTapOnRepo:(Repo *)item{
    if (item.commits.count > 0){ // if it was already retrieved then open details of repo, and since there will be at least on commit , hence the condition count
        RepoDetailsVC* vc =   [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"RepoDetailsVC"];
        
        vc.repo = item;
        vc.transitioningDelegate = self;
        [self presentViewController:vc animated:true completion:nil];
        
    }else{//otherwise get repo commits
        __weak UITableView *tv = self.tableView;

        [self.viewModel getCommitsForRepo:item onFinish:^(Boolean finished) {
                [tv reloadData];
        }];
    }
   
}
- (void)didSelectCell:(RepoTVC*)cell{
    self.lastTappedCell = cell;;
}


-(id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source{
    _transtion = [Animator new];
    _transtion.duration = 0.7;
    _transtion.originFrame =  [[_lastTappedCell superview] convertRect:_lastTappedCell.frame toView:nil];
   
    
    _transtion.originFrame = CGRectMake(_transtion.originFrame.origin.x + 20,
                                       _transtion.originFrame.origin.y + 20,
                                        _transtion.originFrame.size.width - 40,
                                        _transtion.originFrame.size.height - 40 );
     
    
    _transtion.presenting = true;

    
    return _transtion;


}
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    _transtion.presenting = false;
    return _transtion;
}
@end
