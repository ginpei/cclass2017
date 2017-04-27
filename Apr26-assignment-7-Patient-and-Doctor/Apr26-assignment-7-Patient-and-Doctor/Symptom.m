//
//  Symptom.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Symptom.h"

@implementation Symptom

+ (instancetype) newWithTitle: (NSString *) title {
    Symptom *instance = [Symptom new];
    instance.title = title;
    return instance;
}

- (instancetype) init {
    self.medicines = [NSMutableSet set];
    return self;
}

@end
