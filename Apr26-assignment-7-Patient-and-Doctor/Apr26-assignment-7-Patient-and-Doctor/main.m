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
        
        // make them sick
        Symptom *cough = [Symptom newWithTitle:@"Cough"];
        [cough.medicines addObject:@"Benylin"];
        [patient.symptoms addObject:cough];
        
        Symptom *fever = [Symptom newWithTitle:@"Fever"];
        [fever.medicines addObject:@"Advil"];
        [fever.medicines addObject:@"Ice"];
        [patient.symptoms addObject:fever];
        
        // see doctor without health card
        [patient visitDoctor:doctor];
        
        // see doctor with health card
        [patient getValidHealthCard];
        [patient visitDoctor:doctor];
        
        printf("- Few days later... -\n");
        
        // fever has gone but still conghing
        [patient.symptoms removeObject:fever];
        [patient visitDoctor:doctor];
    }
    return 0;
}
