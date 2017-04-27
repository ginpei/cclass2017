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
#import "Symptom.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Doctor *doctor = [Doctor newWithName:@"Dr. Alice"];
        Patient *patient = [Patient newWithName:@"Bob"];
        
        // sicka
        Symptom *cough = [Symptom newWithTitle:@"Cough"];
        [cough.medicines addObject:@"Benylin"];
        Symptom *fever = [Symptom newWithTitle:@"Fever"];
        [fever.medicines addObject:@"Advil"];
        [fever.medicines addObject:@"Ice"];
        
        // make them sick
        [patient addSympom:cough];
        [patient addSympom:fever];
        
        // see doctor without health card
        if (![patient visitDoctor:doctor]) {
            [patient say:@"Oh my."];
        }
        
        // see doctor with health card
        [patient getValidHealthCard];
        if ([patient visitDoctor:doctor]) {
            [patient say:@"OK. I need rest."];
        }
        
        printf("- Few days later... -\n");
        
        // fever has gone but still conghing
        [patient removeSympom:fever];
        
        // see doctor again
        [patient visitDoctor:doctor];
    }
    return 0;
}
