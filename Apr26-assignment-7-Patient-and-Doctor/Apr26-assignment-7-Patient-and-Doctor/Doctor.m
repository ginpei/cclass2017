//
//  Doctor.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"

@implementation Doctor

- (instancetype) init {
    self = [super init];
    return self;
}

- (void) acceptPaticent: (Patient *) patient {
    [self say:[NSString stringWithFormat:@"Hello %s.\n", patient.name.UTF8String]];
}

@end
