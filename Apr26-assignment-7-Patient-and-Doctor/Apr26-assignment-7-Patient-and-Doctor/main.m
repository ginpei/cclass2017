//
//  main.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Doctor.h"
#import "Patient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [Doctor newWithName:@"Alice"];
        Patient *patient = [Patient newWithName:@"Bob"];
        
        [patient visitDoctor:doctor];
    }
    return 0;
}
