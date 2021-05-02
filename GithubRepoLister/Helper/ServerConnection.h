//
//  ServerConnection.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <Foundation/Foundation.h>
#import "Repo.h"
#import "RepoCommit.h"
#include "Constants.h"

NS_ASSUME_NONNULL_BEGIN

@interface ServerConnection : NSObject
+(void)getReposForUserOnCompletedBlock:(void(^)(NSArray<Repo*>* _Nullable  repos,NSError *error))completedBlock;
+(void)getCommitsForRepo:(Repo*)repo onComplete:(void(^)(NSArray<RepoCommit*>* _Nullable  commits,NSError *error))completedBlock;
@end

NS_ASSUME_NONNULL_END
