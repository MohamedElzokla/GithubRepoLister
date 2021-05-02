//
//  RepoOwner.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "RepoOwner.h"
#include "Utils.h"

@implementation RepoOwner

+ (instancetype)initWithDictionary:(NSDictionary *)dictionary{
    RepoOwner *owner = [RepoOwner new];
    owner.avatar_url = Stringfy(dictionary[@"avatar_url"]);
    return  owner;
}
@end
