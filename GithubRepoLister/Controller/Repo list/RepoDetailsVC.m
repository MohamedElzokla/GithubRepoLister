//
//  RepoDetailsVC.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 01/05/2021.
//
#import <SDWebImage/SDWebImage.h>
#import "RepoDetailsVC.h"
#import "RepoViewModel.h"
#import "RepoTVC.h"
@interface RepoDetailsVC ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, weak) IBOutlet UIImageView * repoOwnerImageView;
@property (weak, nonatomic) IBOutlet UILabel * repoNameLabel;

@property (nonatomic, strong) RepoViewModel * viewModel;

@end

@implementation RepoDetailsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDataSource];
}

- (void)loadDataSource{
    [self.repoNameLabel setText:self.repo.name];
    NSURL * url = [NSURL URLWithString:self.repo.owner.avatar_url];
    [self.repoOwnerImageView sd_setImageWithURL:url ];

    self.viewModel = [RepoViewModel initWithRepos:@[self.repo]];
    
}
- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

//MARK: - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.viewModel numberOfItems:0];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return  0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RepoTVC * cell = [tableView dequeueReusableCellWithIdentifier:@"commitCell"];
    
    if (!cell) {
        assert(false);
    }
    [cell configureCommit:[self.viewModel commitAtIndexPath:indexPath]];
    return cell;
}

@end
