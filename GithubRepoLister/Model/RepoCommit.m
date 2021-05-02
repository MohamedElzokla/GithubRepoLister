//
//  RepoCommit.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "RepoCommit.h"
#include "Utils.h"

@implementation RepoCommit
+(instancetype)initWithDictionary:(NSDictionary *)dictionary{
    RepoCommit * commit = [RepoCommit new];
    
    commit.message = Stringfy([dictionary[@"commit"] objectForKey:@"message"]);
    return  commit;
}
+ (NSMutableArray<RepoCommit*> *)initWithArray:(NSArray *)array{
    NSMutableArray *mapped = [NSMutableArray arrayWithCapacity:[array count]];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        RepoCommit* commit = [RepoCommit initWithDictionary:obj];
        [mapped addObject:commit];
    }];
    
    return mapped;

}

@end
