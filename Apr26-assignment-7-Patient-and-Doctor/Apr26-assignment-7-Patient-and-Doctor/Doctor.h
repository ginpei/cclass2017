//
//  Doctor.h
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@class Patient;

@interface Doctor : Person

@property NSMutableSet *patients;
@property NSMutableDictionary *prescriptionLog;

- (NSMutableSet *) acceptPaticent: (Patient *) patient;
- (BOOL) requestMedication: (Patient *) patient;

@end
