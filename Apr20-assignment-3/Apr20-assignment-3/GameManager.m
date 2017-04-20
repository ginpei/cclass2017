//
//  GameManager.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameManager.h"
#import "AdditionQuestion.h"

@implementation GameManager

+ (instancetype) newGameFor: (int) numQuestions {
    GameManager *instance = [GameManager new];
    instance.numQuestions = numQuestions;
    return instance;
}

- (void) start {
    for (int i = 0; i < _numQuestions; i++) {
        BOOL finished = ![self iterate];
        if (finished) {
            break;
        }
    }
}

- (BOOL) iterate {
    AdditionQuestion *question = [AdditionQuestion newQuestion];
    
    printf("%s ?\n", [[question getQuestion] UTF8String]);
    
    NSString *line = getLine();
    if (line == NULL) {
        return false;
    }
    
    if ([question answerInString:line]) {
        printf("Correct.\n");
    }
    else {
        printf("Wrong.\n");
    }

    return true;
}

NSString *getLine() {
    NSString *result = NULL;
    
    const int lineMax = 1024;
    char line[lineMax];
    const char *userInput = fgets(line, lineMax, stdin);
    if (userInput != NULL) {
        result = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
    }
    return result;
}

@end
