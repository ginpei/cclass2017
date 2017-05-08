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
#import "PhoneNumber.h"

ContactList *contacts;
InputCollector *inputCollector;
NSMutableArray *history;

Contact *createNewContact() {
    Contact *newContact = [Contact new];
    
    newContact.email = [inputCollector inputForPrompt:@"Enter your email"];
    if ([contacts hasEmail:newContact.email]) {
        printf("This email has been used.\n");
        return NULL;
    }
    
    newContact.name = [inputCollector inputForPrompt:@"Enter your username"];
    
    while (YES) {
        NSString *label = [inputCollector inputForPrompt:@"Enter phone label (empty to finish)"];
        if (label.length < 1) {
            break;
        }
        NSString *number = [inputCollector inputForPrompt:@"Enter phone number"];
        [newContact addPhone:label withNumber:number];
    }
    
    [contacts addContact:newContact];
    return newContact;
}

void printContactDetail(Contact *contact) {
    printf("Name: %s\n", [contact.name UTF8String]);
    printf("Email: %s\n", [contact.email UTF8String]);
    for (PhoneNumber *p in contact.phones) {
        printf("Phone (%s): %s\n", [p.label UTF8String], [p.number UTF8String]);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        contacts = [ContactList new];
        inputCollector = [InputCollector new];
        history = [NSMutableArray array];
        
        // dummy data
        Contact *c1 = [Contact new];
        c1.name = @"Alice";
        c1.email = @"alice@example.com";
        [c1 addPhone:@"Mobile" withNumber:@"1-778-000-000"];
        [c1 addPhone:@"Home" withNumber:@"1-999-000-000"];
        [contacts addContact:c1];
        Contact *c2 = [Contact new];
        c2.name = @"Bob";
        c2.email = @"bob@example.com";
        [contacts addContact:c2];
        Contact *c3 = [Contact new];
        c3.name = @"Charlie";
        c3.email = @"charchar@example.com";
        [contacts addContact:c3];
        
        while (YES) {
            printf("\n");
            printf("What would you like to do next?\n");
            printf("\tnew - Create a new contact\n");
            printf("\tlist - List all contacts\n");
            printf("\tshow - Show specified contacts\n");
            printf("\tfind - Find contacts\n");
            printf("\thistory - Show input history\n");
            printf("\tquit - Exit Application");
            NSString *line = [inputCollector inputForPrompt:@""];
            
            if (line == NULL || [line isEqualToString:@"quit"]) {
                break;
            }
            else if ([line isEqualToString:@"new"]) {
                createNewContact();
            }
            else if ([line isEqualToString:@"list"]) {
                [contacts printAll];
            }
            else if ([line isEqualToString:@"show"]) {
                NSString *line = [inputCollector inputForPrompt:@"Input the ID"];
                Contact *result = [contacts findByIdString:line];
                if (result != NULL) {
                    printContactDetail(result);
                }
                else {
                    printf("Not found\n");
                }
            }
            else if ([line isEqualToString:@"history"]) {
                const int max = 3;
                for (int i = 0; i < history.count && i < max; i++) {
                    printf("\t- %s\n", [history[history.count -1 -i] UTF8String]);
                }
            }
            else if ([line isEqualToString:@"find"]) {
                NSString *line = [inputCollector inputForPrompt:@"Input keyword"];
                NSMutableArray *result = [contacts search:line];
                printf("%lu contact(s) found:\n", (unsigned long)result.count);
                
                for (int i = 0; i < result.count; i++) {
                    Contact *c = result[i];
                    printf("%d: %s <%s>\n", i, [c.name UTF8String], [c.email UTF8String]);
                }
            }
            else {
                printf("?\n");
                line = NULL;  // avoid to add to history
            }
            
            if (line != NULL) {
                [history addObject:line];
            }
        }
        
        printf("Bye.\n");
    }
    return 0;
}
