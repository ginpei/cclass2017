//
//  InputHandler.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "InputHandler.h"

@implementation InputHandler

+ (NSString *) getLine {
    InputHandler *instance = [InputHandler new];
    instance.lineMax = 1024;
    NSString *result = [instance getLine];
    return result;
}

+ (NSString *) ask: (NSString *) message {
    printf("%s\n", message.UTF8String);
    printf("> ");
    return [self getLine];
}

- (NSString *) getLine {
    NSString *result = NULL;
    
    char line[_lineMax];
    const char *userInput = fgets(line, _lineMax, stdin);
    if (userInput != NULL) {
        result = [[NSString stringWithCString:userInput encoding:NSUTF8StringEncoding] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    }
    
    return result;
}

@end
