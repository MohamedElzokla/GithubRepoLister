//
//  Repo.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <Foundation/Foundation.h>
#import "RepoOwner.h"
#import "RepoCommit.h"
NS_ASSUME_NONNULL_BEGIN

@interface Repo : NSObject

@property NSString * default_branch;
@property NSString * commits_url;
@property NSString * branches_url;
@property NSString * name;

@property RepoOwner * owner;
@property NSArray<RepoCommit*> * commits;


+ (instancetype)initWithDictionary:(NSDictionary*)dictionary;
+ (NSMutableArray<Repo*> *)initWithArray:(NSArray*)array;
@end

NS_ASSUME_NONNULL_END
