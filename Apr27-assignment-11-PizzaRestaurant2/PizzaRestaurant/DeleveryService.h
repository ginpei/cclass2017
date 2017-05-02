//
//  DeleveryService.h
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DeliveryCar.h"

@interface DeleveryService : NSObject

@property (weak) DeliveryCar *car;

-(void)run;

@end
