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
        inputCollector = [InputCollector new];
        
        while (YES) {
            printf("\n");
            printf("What would you like to do next?\n");
            printf("\tnew - Create a new contact\n");
            printf("\tlist - List all contacts\n");
            printf("\tquit - Exit Application");
            NSString *line = [inputCollector inputForPrompt:@""];
            
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
