//
//  Patient.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Patient.h"
#import "Doctor.h"

@implementation Patient

- (instancetype) init {
    self = [super init];
    return self;
}

- (void) visitDoctor: (Doctor *) doctor {
    [self say:@"I'm going to see a docter..."];
    [doctor acceptPaticent: self];
}

@end
