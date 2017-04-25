//
//  main.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputCollector.h"

NSString *menuMessage = @"\n\
What would you like to do next?\n\
\tnew - Create a new contact\n\
\tlist - List all contacts\n\
\tquit - Exit Application";

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            InputCollector *inputCollector = [InputCollector new];
            NSString *line = [inputCollector inputForPrompt:menuMessage];
            if ([line isEqualToString:@"quit"]) {
                break;
            }
            else if ([line isEqualToString:@"new"]) {
                printf("-new-\n");
            }
            else if ([line isEqualToString:@"list"]) {
                printf("-list-\n");
            }
            else {
                printf("?\n");
            }
        }
        
        printf("Bye.\n");
    }
    return 0;
}
