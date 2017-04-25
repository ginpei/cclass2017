//
//  main.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "InputHandler.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("What would you like to do next?\n");
        printf("\tnew - Create a new contact\n");
        printf("\tlist - List all contacts\n");
        printf("\tquit - Exit Application\n");
        printf("> ");
        NSString *line = [InputHandler getLine];
        NSLog(@">[%@]", line);
    }
    return 0;
}
