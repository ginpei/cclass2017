//
//  Person.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype) newWithName: (NSString *) name {
    Person *instance = [self new];
    instance.name = name;
    return instance;
}

- (void) say: (NSString *) message {
    printf("%s: %s\n", self.name.UTF8String, message.UTF8String);
}

@end
