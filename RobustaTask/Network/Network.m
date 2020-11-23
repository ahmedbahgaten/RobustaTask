//
//  Network.m
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import "Network.h"
#import "GithubRepo.h"
@import AFNetworking;
@implementation Network


static Network *shared ;
+ (Network *)shared{
    return shared = shared == nil ? [[Network alloc] init] : shared;
}
- (instancetype)init
{
    self = [super init];
    self.urlHost = @"https://api.github.com/";
    return self;
}

- (void)sendRequest:(NSString *)urlPath :(void (^)(NSDictionary * _Nullable))successCompletion :(void (^)(NSError * _Nullable))failureCompletion
{
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
    NSString *fullURL = [NSString stringWithFormat:@"%@%@", self.urlHost, urlPath];
    NSURL *URL = [NSURL URLWithString:fullURL];
    if (URL == nil){failureCompletion([NSError errorWithDomain:@"invalid URL" code:500 userInfo:nil]);}
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request uploadProgress:nil
        downloadProgress:nil
        completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
        if (error) {
            NSLog(@"Error: %@", error);
            failureCompletion(error);
        } else {
            NSDictionary* dataDic = responseObject;
            successCompletion(dataDic);
        }
    }];
    [dataTask resume];
}
@end
