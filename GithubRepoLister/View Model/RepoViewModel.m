//
//  RepoViewModel.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "RepoViewModel.h"
#import "ServerConnection.h"
@interface RepoViewModel()

@property (nonatomic, strong) NSArray<Repo *> *items;

@end
@implementation RepoViewModel
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.items = @[];

    }
    return self;
}
+ (instancetype)initWithRepos:(NSArray<Repo*>*)repos{
    RepoViewModel * vm = [RepoViewModel new];
    vm.items = repos;
    return vm;
}
- (void)getReposFromAPIOnCompletedBlock:(void(^)(Boolean finished))completedBlock{
    __weak RepoViewModel *weakSelf = self;

    [ServerConnection getReposForUserOnCompletedBlock:^(NSArray<Repo *> * _Nullable repos, NSError * _Nonnull error) {
        weakSelf.items = repos;
        completedBlock(true);
    }];
}
- (void)getCommitsForRepo:(Repo*)repo onFinish:(void(^)(Boolean finished))completedBlock{
    
//    Repo * repo = [self  itemAtIndexPath:indexPath.section];
    __weak RepoViewModel *weakSelf = self;
    [ServerConnection getCommitsForRepo:repo onComplete:^(NSArray<RepoCommit *> * _Nullable commits, NSError * _Nonnull error) {
        [weakSelf.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            if (obj == repo) {
                Repo * repo = obj;
                repo.commits = commits;
                *stop = YES;
            }
        }];
        completedBlock(true);
    }];
}

- (NSUInteger)numberOfItems:(NSInteger)section {
    return [self.items objectAtIndex:section].commits.count;
}

- (NSUInteger)numberOfSections {
    return self.items.count;
}

- (nullable Repo *)itemAtIndexPath:(NSInteger)section {
    if (section >= self.items.count) {
        return nil;
    }
    return self.items[section];
}
- (RepoCommit *)commitAtIndexPath:(NSIndexPath *)indexPath {
    
    return [self.items[indexPath.section].commits objectAtIndex:indexPath.item];
}
@end
