//
//  Pizza.h
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-04-27.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    small,
    medium,
    large,
} PizzaSize;

@interface Pizza : NSObject

@property PizzaSize size;
@property NSArray *toppings;

+ (instancetype) pizzaWithSize: (PizzaSize) size toppings: (NSArray *) toppings;
+ (Pizza *) largePepperoni;
+ (Pizza *) meatLoversWithSize:(PizzaSize)size;
+ (PizzaSize) sizeFromString: (NSString *) str;
- (instancetype) initWithSize: (PizzaSize) size toppings: (NSArray *) toppings;
- (PizzaSize) size;
- (NSArray *) toppings;

@end
