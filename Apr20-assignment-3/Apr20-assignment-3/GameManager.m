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
    GameManager *instance = [[GameManager alloc] initWithCount:numQuestions];
    return instance;
}

- (instancetype) initWithCount: (int) numQuestions {
    _numQuestions = numQuestions;
    _questions = [NSMutableArray array];
    return self;
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
    [_questions addObject:question];
    
    printf("%s ?\n", [[question getQuestion] UTF8String]);
    
    NSString *line = getLine();
    if (line == NULL) {
        return false;
    }
    
    if ([question answerInString:line]) {
        _numRight += 1;
        printf("Correct.\n");
    }
    else {
        _numWrong += 1;
        printf("Wrong.\n");
    }

    return true;
}

- (void) printResult {
    int rate = [self calcCorrectRate] * 100;
    printf("Score: %d right, %d wrong ---- %d %%\n", _numRight, _numWrong, rate);
}

- (void) printWrongQuestins {
    printf("Here are questions you answered wrong:\n");
    for (AdditionQuestion *question in _questions) {
        if (![question isCorrect]) {
            printf("- %s\n", [[question getQuestion] UTF8String]);
        }
    }
}

- (float) calcCorrectRate {
    return ((float) _numRight) / [_questions count];
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
