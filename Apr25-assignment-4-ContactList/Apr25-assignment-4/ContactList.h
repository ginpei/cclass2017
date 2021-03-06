//
//  ContactList.h
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ContactList : NSObject

@property NSMutableArray *contacts;

- (void) addContact: (Contact *) newContact;
- (void) printAll;
- (Contact *) find: (int) id;
- (Contact *) findByIdString: (NSString *) idString;
- (NSMutableArray *) search: (NSString *) keyword;
- (BOOL) hasEmail: (NSString *) email;

@end
