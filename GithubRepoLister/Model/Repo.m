//
//  Repo.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "Repo.h"
#include "Utils.h"
@implementation Repo

+ (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    Repo * repo = [Repo new];
    
    
    repo.branches_url = Stringfy(dictionary[@"branches_url"]);
    repo.default_branch = Stringfy(dictionary[@"default_branch"])  ;
    repo.commits_url = Stringfy(dictionary[@"commits_url"]);
    repo.name = Stringfy(dictionary[@"name"]);
    repo.owner = [RepoOwner initWithDictionary:dictionary[@"owner"]];
    return repo;
 
}
+ (NSMutableArray<Repo*> *)initWithArray:(NSArray *)array{
    NSMutableArray *mapped = [NSMutableArray arrayWithCapacity:[array count]];
    [array enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        Repo* repo = [Repo initWithDictionary:obj];
        [mapped addObject:repo];
    }];
    
    return mapped;

}
@end
