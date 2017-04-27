//
//  HealthCard.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "HealthCard.h"

@implementation HealthCard

+ (instancetype) newValid{
    HealthCard *instance = [HealthCard new];
    instance.valid = YES;
    return instance;
}

+ (instancetype) newInvalid{
    HealthCard *instance = [HealthCard new];
    instance.valid = NO;
    return instance;
}

- (instancetype) init {
    return self;
}

@end
