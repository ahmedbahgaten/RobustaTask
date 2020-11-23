//
//  GithubRepo.h
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Owner.h"
NS_ASSUME_NONNULL_BEGIN

@interface GithubRepo : NSObject
@property(nonatomic,nullable)Owner* owner;
@property(nonatomic,nullable)NSString* repoName;
@property(nonatomic,nullable)NSString* repoDescription;
- (id)initWithDictionary:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
