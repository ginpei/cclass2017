//
//  Contact.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Contact.h"
#import "PhoneNumber.h"

@implementation Contact

- (instancetype) init {
    _phones = [NSMutableArray array];
    return self;
}

- (void) addPhone: (NSString *) label withNumber: (NSString *) number {
    PhoneNumber *phone = [PhoneNumber new];
    phone.label = label;
    phone.number = number;
    [_phones addObject:phone];
}

@end
