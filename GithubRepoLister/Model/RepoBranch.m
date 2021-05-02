//
//  RepoBranch.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "RepoBranch.h"
#import "Utils.h"
@implementation RepoBranch
+ (instancetype)initWithDictionary:(NSDictionary*)dictionary{
    RepoBranch * branch = [RepoBranch new];
    branch.name = Stringfy(dictionary[@"name"]);
    branch.commit = [RepoCommit initWithDictionary:dictionary[@"commit"]];
    return  branch;
}

@end
