//
//  Owner.m
//  RobustaTask
//
//  Created by Ahmed on 11/17/20.
//  Copyright © 2020 Ahmed. All rights reserved.
//

#import "Owner.h"
@implementation Owner

- (instancetype)initWithDictionary:(NSDictionary*)dictionary
{
    if (self = [super init])
    {
        self.ownerAvatar = dictionary [@"avatar_url"];
        self.ownerName = dictionary [@"login"];
        self.type = dictionary [@"type"];

    }
    return self;
}
@end
