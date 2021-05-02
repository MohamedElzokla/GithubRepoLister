//
//  RepoBranch.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <Foundation/Foundation.h>
#import "RepoCommit.h"
NS_ASSUME_NONNULL_BEGIN

@interface RepoBranch : NSObject
@property NSString * name;
@property RepoCommit * commit;
+ (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
