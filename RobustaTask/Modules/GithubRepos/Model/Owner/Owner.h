//
//  Owner.h
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Owner : NSObject
@property(nonatomic,nullable)NSString* ownerName;
@property(nonatomic,nullable)NSString* ownerAvatar;
@property(nonatomic,nullable)NSString* type;
- (id)initWithDictionary:(NSDictionary*)dictionary;
@end

NS_ASSUME_NONNULL_END
