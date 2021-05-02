//
//  RepoViewModel.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <UIKit/UIKit.h>
#import "Repo.h"
NS_ASSUME_NONNULL_BEGIN

@interface RepoViewModel : NSObject

+ (instancetype)initWithRepos:(NSArray<Repo*>*)repos;
- (NSUInteger)numberOfItems:(NSInteger)section;
- (NSUInteger)numberOfSections;
- (nullable Repo *)itemAtIndexPath:(NSInteger)section;
- (nullable RepoCommit *)commitAtIndexPath:(NSIndexPath *)indexPath;

- (void)getReposFromAPIOnCompletedBlock:(void(^)(Boolean finished))completedBlock;
- (void)getCommitsForRepo:(Repo*)repo onFinish:(void(^)(Boolean finished))completedBlock;
@end

NS_ASSUME_NONNULL_END
