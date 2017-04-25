//
//  GameManager.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameManager.h"
#import "AdditionQuestion.h"
#import "SubtractionQuestion.h"
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
    Question *question = [self createRandomQuestion];
    [_questions addObject:question];
    
    printf("%s ?\n", [[question getQuestion] UTF8String]);
    
    NSString *line = [InputHandler getLine];
    if (line == NULL || [line isEqualToString:@"quit"]) {
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
    [self printTime];

    return true;
}

- (Question *) createRandomQuestion {
    Question *question;
    int rand = arc4random_uniform(2);
    if (rand == 0) {
        question = [AdditionQuestion newQuestion];
    }
    else if (rand == 1) {
        question = [SubtractionQuestion newQuestion];
    }
    else {
        @throw @"WTF";
    }
    return question;
}

- (void) printResult {
    int rate = [self calcCorrectRate] * 100;
    printf("Score: %d right, %d wrong ---- %d %%\n", _numRight, _numWrong, rate);
}

- (void) printTime {
    printf("total time: %.1fs, average time: %.1fs\n", [self totalAnswerTime], [self averageAnswerTime]);
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
    int total = (_numRight + _numWrong);
    float rate;
    if (total > 0) {
        rate = ((float) _numRight) / total;
    }
    else {
        rate = 0;
    }
    return rate;
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
