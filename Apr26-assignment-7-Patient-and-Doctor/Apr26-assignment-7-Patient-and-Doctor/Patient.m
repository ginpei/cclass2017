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
    self.symptoms = [NSMutableArray array];
    return self;
}

- (void) addSympom: (Symptom *) symptom {
    [self say:[NSString stringWithFormat:@"Hmmm I think I got %@...", symptom.title]];
    [self.symptoms addObject:symptom];
}

- (void) removeSympom: (Symptom *) symptom {
    [self say:[NSString stringWithFormat:@"Yeah I feel better than before. %@ might be gone.", symptom.title]];
    [self.symptoms removeObject:symptom];
}

- (BOOL) visitDoctor: (Doctor *) doctor {
    [self say:@"I'm going to see a docter..."];
    NSMutableSet *prescription = [doctor acceptPaticent:self];
    if (prescription == NULL) {
        return false;
    }
    
    [self say:@"Hi. I think I need medicines. Here is my prescription."];
    [doctor requestMedication:prescription];
    return true;
}

- (BOOL) hasValidHealthCard {
    BOOL b = self.healthCard != NULL && self.healthCard.valid;
    if (b) {
        [self say:@"Here you go."];
    }
    else {
        [self say:@"Uh oh."];
    }
    return b;
}

- (void) getValidHealthCard {
    [self say:@"Yeah, I don't forget my health card."];
    self.healthCard = [HealthCard newValid];
}

- (NSString *) id {
    // create actual ID when something go wrong
    return self.name;
}

@end
