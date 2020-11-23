//
//  GithubRepoServices.h
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GithubRepo.h"
NS_ASSUME_NONNULL_BEGIN

@interface GithubRepoServices : NSObject
@property(nonatomic)NSString* urlPath;
-(void) getUserRepos:(nullable void (^)(NSArray<GithubRepo*>* _Nullable repositires ))successCompletion :(nullable void (^)(NSError* _Nullable error))failureCompletion;
@end

NS_ASSUME_NONNULL_END

