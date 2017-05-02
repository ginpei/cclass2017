//
//  AntiAnchoviManager.m
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "AntiAnchoviManager.h"
#import "DeleveryService.h"

@implementation AntiAnchoviManager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings
{
    return ![toppings containsObject:@"anchovi"];
}

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen
{
    return NO;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza
{
    [self.deleveryService deliverPizza:pizza];
}

@end
