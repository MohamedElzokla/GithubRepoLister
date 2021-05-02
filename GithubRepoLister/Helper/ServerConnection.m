//
//  ServerConnection.m
//  GithubRepoLister
//
//  Created by mohamed ahmed on 30/04/2021.
//

#import "ServerConnection.h"
#import "RepoBranch.h"

@implementation ServerConnection

+(void)getReposForUserOnCompletedBlock:(void(^)(NSArray<Repo*>* _Nullable  repos,NSError *error))completedBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString * url = [NSString stringWithFormat:REPO_URL,REPO_USERNAME];
        NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil){
                NSError * rr;
                NSArray * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&rr];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completedBlock([Repo initWithArray:result],nil);
                });
                
            }else {
                completedBlock(nil,nil);
                NSLog(@"error in request = %@",[error description]);
            }
            
        }]resume];
    });
}

+(void)getCommitsForRepo:(Repo*)repo onComplete:(void(^)(NSArray<RepoCommit*>* _Nullable  commits,NSError *error))completedBlock
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSString * url = [NSString stringWithFormat:COMMIT_URL,REPO_USERNAME,repo.name];
        NSMutableURLRequest * req = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url]];
        [[[NSURLSession sharedSession] dataTaskWithRequest:req completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            if (error == nil){
                NSError * rr;
                NSArray * result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&rr];
                dispatch_async(dispatch_get_main_queue(), ^{
                    completedBlock([RepoCommit initWithArray:result],nil);
                });
                
            }else {
                completedBlock(nil,nil);
                NSLog(@"error in request = %@",[error description]);
            }
            
        }]resume];
    });
}

@end
