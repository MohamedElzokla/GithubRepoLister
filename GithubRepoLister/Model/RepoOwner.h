//
//  RepoOwner.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RepoOwner : NSObject
@property NSString * avatar_url;

+ (instancetype)initWithDictionary:(NSDictionary*)dictionary;

@end

NS_ASSUME_NONNULL_END
