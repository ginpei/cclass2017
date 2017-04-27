//
//  Doctor.m
//  Apr26-assignment-7-Patient-and-Doctor
//
//  Created by Ginpei on 2017-04-26.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Doctor.h"
#import "Patient.h"
#import "Symptom.h"

@implementation Doctor

- (instancetype) init {
    self = [super init];
    self.patients = [NSMutableSet set];
    self.prescriptionLog = [NSMutableDictionary dictionary];
    return self;
}

- (NSMutableSet *) acceptPaticent: (Patient *) patient {
    [self say:[NSString stringWithFormat:@"Hello %s. Do you have a health card?", patient.name.UTF8String]];
    
    if (!patient.hasValidHealthCard) {
        [self say:@"Ah, sorry, but you need to have a valid health card to get a service. Get out!"];
        return NULL;
    }
    
    if (![self.patients containsObject:patient]) {
        [self say:@"It seems to be the first time you come here, doesn't it?"];
        [self rememberPatient:patient];
    }
    
    NSMutableSet *prescription = [self diagnose:patient];
    [self keepPrescription:prescription forPatient:patient];
    
    [self say:@"Here's your prescription."];
    return prescription;
}

- (void) rememberPatient: (Patient *) patient {
    [self say:@"I'm creating a document for you..."];
    [self.patients addObject:patient];
}

- (NSMutableSet *) diagnose: (Patient *) patient {
    [self say:@"Well, let me see how you are..."];
    
    NSMutableSet *medicines = [NSMutableSet set];
    for (Symptom *s in patient.symptoms) {
        [self say:[NSString stringWithFormat:@"You have %s...", s.title.UTF8String]];
        for (NSString *medicine in s.medicines) {
            [medicines addObject:medicine];
        }
    }
    return medicines;
}

- (void) keepPrescription: (NSMutableSet *) prescription forPatient: (Patient *) patient {
    NSMutableArray *log = [self.prescriptionLog valueForKey:patient.id];
    if (log == NULL) {
        log = [self createNewPrescriptionLogForPatient:patient];
    }
    
    [log addObject:prescription];
    [self say:[NSString stringWithFormat:@"I gonna keep this prescription for the patient... There're %lu prescriptions so far.", (unsigned long)log.count]];
}

- (NSMutableArray *) createNewPrescriptionLogForPatient: (Patient *) patient {
    [self.prescriptionLog setObject:[NSMutableArray array] forKey:patient.id];
    return [self.prescriptionLog valueForKey:patient.id];
}

- (BOOL) requestMedication: (NSMutableSet *) prescription {
    NSMutableString *message = [NSMutableString stringWithFormat:@"Medicines for you."];
    for (NSString *medicine in prescription) {
        [message appendString:@"\n\t- "];
        [message appendString:medicine];
    }
    [self say:message];
    [self say:@"Take care, bye!"];
    return YES;
}

@end
