//
//  Network.h
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//


#import "GithubRepo.h"
NS_ASSUME_NONNULL_BEGIN

@interface Network : NSObject
+(Network*) shared;
@property(nonatomic)NSString* urlHost;

-(void) sendRequest: (NSString*) urlPath : (nullable void (^)( NSDictionary* _Nullable dataDic))successCompletion :(nullable void (^)( NSError* _Nullable error))failureCompletion;

@end

NS_ASSUME_NONNULL_END

