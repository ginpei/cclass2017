//
//  UiController.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "UiController.h"

@implementation UiController

BOOL finished = false;

-(instancetype)init {
    self = [super init];
    finished = false;
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

//-(NSArray *)ask: (NSString *)question {
//    printf("%s\n", question.UTF8String);
//    printf("> ");
//    
//    NSArray *result;
//    
//    char line[_lineMax];
//    const char *userInput = fgets(line, _lineMax, stdin);
//    if (userInput != NULL) {
//        NSString *strLine = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
//        NSCharacterSet *blanks = [NSCharacterSet whitespaceAndNewlineCharacterSet];
//        NSString *trimmedLine = [strLine stringByTrimmingCharactersInSet:blanks];
//        result = [trimmedLine componentsSeparatedByCharactersInSet:blanks];
//        
//    }
//    else {
//        result = @[];
//    }
//    
//    
//    return result;
//}

-(void)output: (NSString *)message {
    printf("%s\n", message.UTF8String);
}

-(void)output: (NSString *)message withIndentLv:(NSInteger)lv {
    NSMutableString *indent = [NSMutableString string];
    for (int i = 0; i < lv; i++) {
        [indent appendString:@"\t"];
    }
    
    [self output:[indent stringByAppendingString:message]];
}

-(void)outputWithoutNewLine: (NSString *)message {
    printf("%s", message.UTF8String);
}

-(void)outputEmptyLine {
    [self output:@""];
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
