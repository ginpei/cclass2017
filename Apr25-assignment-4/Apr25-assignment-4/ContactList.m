//
//  ContactList.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "ContactList.h"

@implementation ContactList

- (instancetype) init {
    _contacts = [NSMutableArray array];
    return self;
}

- (void) addContact: (Contact *) newContact {
    [_contacts addObject:newContact];
}

- (void) printAll {
    for (int i = 0; i < _contacts.count; i++) {
        Contact *c = _contacts[i];
        printf("%d: %s <%s>\n", i, [c.name UTF8String], [c.email UTF8String]);
    }
}

- (Contact *) find: (int) index{
    if (index >= _contacts.count) {
        return NULL;
    }
    
    return _contacts[index];
}

- (Contact *) findByIdString: (NSString *) idString{
    return [self find:[idString intValue]];
}

@end
