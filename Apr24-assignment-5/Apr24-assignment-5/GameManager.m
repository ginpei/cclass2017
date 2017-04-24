//
//  GameManager.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameManager.h"
#import "AdditionQuestion.h"
#import "InputHandler.h"

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
    
    NSString *line = [InputHandler getLine];
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
    [self printResult];
    printf("total time: %gs, average time: %gs\n", [self totalAnswerTime], [self averageAnswerTime]);

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
    return ((float) _numRight) / (_numRight + _numWrong);
}

- (NSTimeInterval) totalAnswerTime {
    float total = 0;
    for (AdditionQuestion *question in _questions) {
        total += [question answerTime];
    }
    return total;
}

- (NSTimeInterval) averageAnswerTime {
    return [self totalAnswerTime] / (_numRight + _numWrong);
}

@end
