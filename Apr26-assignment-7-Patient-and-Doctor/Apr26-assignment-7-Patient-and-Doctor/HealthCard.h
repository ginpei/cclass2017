//
//  HealthCard.h
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HealthCard : NSObject

@property BOOL valid;

+ (instancetype) newValid;
+ (instancetype) newInvalid;

@end
