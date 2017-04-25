//
//  main.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"
#import "Contact.h"
#import "ContactList.h"

NSString *menuMessage = @"\n\
What would you like to do next?\n\
\tnew - Create a new contact\n\
\tlist - List all contacts\n\
\tquit - Exit Application";

ContactList *contacts;
InputCollector *inputCollector;

void createNewContact() {
    Contact *newContact = [Contact new];
    newContact.name = [inputCollector inputForPrompt:@"Enter your username"];
    newContact.email = [inputCollector inputForPrompt:@"Enter your email"];
    [contacts addContact:newContact];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        contacts = [ContactList new];
        
        while (YES) {
            inputCollector = [InputCollector new];
            NSString *line = [inputCollector inputForPrompt:menuMessage];
            if ([line isEqualToString:@"quit"]) {
                break;
            }
            else if ([line isEqualToString:@"new"]) {
                createNewContact();
                printf("%lu contacs\n", (unsigned long)[contacts.contacts count]);
                
            }
            else if ([line isEqualToString:@"list"]) {
                [contacts printAll];
            }
            else {
                printf("?\n");
            }
        }
        
        printf("Bye.\n");
    }
    return 0;
}
