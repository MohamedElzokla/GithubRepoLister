//
//  RepoCommit.h
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RepoCommit : NSObject
@property NSString * message;

+ (instancetype)initWithDictionary:(NSDictionary*)dictionary;
+ (NSMutableArray<RepoCommit*> *)initWithArray:(NSArray*)array;

@end

NS_ASSUME_NONNULL_END
