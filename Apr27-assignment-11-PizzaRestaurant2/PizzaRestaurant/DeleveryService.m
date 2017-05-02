//
//  DeleveryService.m
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "DeleveryService.h"

@implementation DeleveryService

- (instancetype)init
{
    self = [super init];
    if (self) {
        _log = [NSMutableArray array];
    }
    return self;
}

-(void)deliverPizza:(Pizza *)pizza
{
    [self.log addObject:pizza];
}

@end
