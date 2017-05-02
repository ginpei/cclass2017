//
//  AntiAnchoviManager.h
//  PizzaRestaurant
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KitchenDelegate.h"

@interface AntiAnchoviManager : NSObject <KitchenDelegate>

@property (nonatomic, weak) DeleveryService *deleveryService;

@end
