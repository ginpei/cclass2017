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
    printf("%s\n", question.UTF8String);
    printf("> ");
    
    NSString *result = NULL;
    
    char line[_lineMax];
    const char *userInput = fgets(line, _lineMax, stdin);
    if (userInput != NULL) {
        NSString *strLine = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
        NSCharacterSet *blanks = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        NSString *trimmedLine = [strLine stringByTrimmingCharactersInSet:blanks];
        result = trimmedLine;
        
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

@end
