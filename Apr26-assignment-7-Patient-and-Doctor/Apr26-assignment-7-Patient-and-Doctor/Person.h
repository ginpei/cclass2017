//
//  Person.h
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;

+ (instancetype) newWithName: (NSString *) name;
- (void) say: (NSString *) message;

@end
