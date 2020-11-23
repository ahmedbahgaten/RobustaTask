//
//  GithubRepoServices.m
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GithubRepoServices.h"
#import "Network.h"

@implementation GithubRepoServices

- (instancetype)init
{
    self = [super init];
    self.urlPath = @"repositories";
    return self;
}
- (void)getUserRepos:(void (^)(NSArray<GithubRepo *> * _Nullable))successCompletion :(void (^)(NSError * _Nullable))failureCompletion
{
    Network* network = [Network shared];
    [network sendRequest:self.urlPath: ^(NSDictionary* data) {
        NSMutableArray<GithubRepo*>* repositries = [[NSMutableArray alloc]init];
        if (data == nil)
        {
            NSError* error = [NSError errorWithDomain:@"no data" code:400 userInfo:nil];
            failureCompletion(error);
        }
        else
        {
            for(NSDictionary *dic in data)
            {
                GithubRepo *repositry = [[GithubRepo alloc] initWithDictionary:dic];
                [repositries addObject:repositry];
            }
            successCompletion(repositries);
        }
    }:^(NSError* error){
        failureCompletion(error);
    }];
}
@end
