//
//  CheeryManager.m
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "CheeryManager.h"
#import "DeleveryService.h"

@implementation CheeryManager

-(BOOL)kitchen:(Kitchen *)kitchen shouldMakePizzaOfSize:(PizzaSize)size andToppings:(NSArray *)toppings
{
    return YES;
}

-(BOOL)kitchenShouldUpgradeOrder:(Kitchen *)kitchen
{
    return YES;
}

-(void)kitchenDidMakePizza:(Pizza *)pizza
{
    NSLog(@"Hi-ho! Here is your %@", pizza);
    [self.deleveryService deliverPizza:pizza];
}

@end
