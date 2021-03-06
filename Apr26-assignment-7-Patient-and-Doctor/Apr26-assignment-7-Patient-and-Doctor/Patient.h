//
//  Patient.h
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Symptom.h"

@class Doctor;

@interface Patient : Person

@property HealthCard *healthCard;
@property NSMutableArray *symptoms;

- (void) addSympom: (Symptom *) symptom;
- (void) removeSympom: (Symptom *) symptom;
- (BOOL) visitDoctor: (Doctor *) doctor;
- (BOOL) hasValidHealthCard;
- (void) getValidHealthCard;
- (NSString *) id;

@end
