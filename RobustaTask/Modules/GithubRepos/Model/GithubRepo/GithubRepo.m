//
//  GithubRepo.m
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import "GithubRepo.h"

@implementation GithubRepo
- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    if (self = [super init])
    {
        self.owner = [[Owner alloc]initWithDictionary:dictionary[@"owner"]];
        self.repoName = dictionary[@"name"];
        self.repoDescription = dictionary[@"description"];
    }
    return self;
}
@end
