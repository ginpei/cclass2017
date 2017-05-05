//
//  UiController.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "UiController.h"

@interface UiController() {
@private BOOL finished;
@private NSInteger indentLv;
}

@end

@implementation UiController

-(instancetype)init {
    self = [super init];
    finished = false;
    indentLv = 0;
    _lineMax = 1024;
    return self;
}

-(BOOL)finished {
    return finished;
}

-(void)finish {
    finished = YES;
}

-(NSString *)ask: (NSString *)question {
    [self output:question];
    [self outputWithoutNewLine:@"> "];
    
    NSString *result = NULL;
    
    char line[_lineMax];
    const char *userInput = fgets(line, _lineMax, stdin);
    if (userInput != NULL) {
        NSString *strLine = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
        NSCharacterSet *blanks = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmedLine = [strLine stringByTrimmingCharactersInSet:blanks];
        NSString *lowercasedLine = [trimmedLine lowercaseString];
        result = lowercasedLine;
        
    }

    
    return result;
}

-(NSString *)askWithFormat: (NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    return [self ask:message];
}

-(void)output: (NSString *)message {
    NSMutableString *indent = [NSMutableString string];
    for (int i = 0; i < indentLv; i++) {
        [indent appendString:@"\t"];
    }
    
    NSString *line = [indent stringByAppendingString:message];
    
    printf("%s\n", line.UTF8String);
}

-(void)outputWithFormat: (NSString *)format, ... {
    va_list args;
    va_start(args, format);
    NSString *message = [[NSString alloc] initWithFormat:format arguments:args];
    va_end(args);
    [self output:message];
}

-(void)outputWithoutNewLine: (NSString *)message {
    printf("%s", message.UTF8String);
}

-(void)outputEmptyLine {
    [self output:@""];
}

-(NSInteger)increaseIndent {
    indentLv += 1;
    return indentLv;
}

-(NSInteger)decreaseIndent {
    indentLv -= 1;
    return indentLv;
}

-(void)printHelp {
    NSString *text = [@[
                       @"---Help---",
                       @"\t- roll, r, (empty) - Roll your die.",
                       @"\t- quit - Quit the game.",
                       ] componentsJoinedByString:@"\n"];
    [self output:text];
}

@end
