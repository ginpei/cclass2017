//
//  AdditionQuestion.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

+ (instancetype) newQuestion {
    AdditionQuestion *instance = [self new];
    [instance generateRandomQuestion];
    return instance;
}

- (NSString *) getQuestion {
    return [NSString stringWithFormat:@"%d + %d", _num1, _num2];
}

- (void) generateRandomQuestion {
    // numbers should be between 1 and 99
    _num1 = arc4random_uniform(98) + 1;
    _num2 = arc4random_uniform(98) + 1;
}

- (void) setAnswer: (int) answer {
    _userAnswer = answer;
}

- (BOOL) isCorrect {
    int correctAnswer = _num1 + _num2;
    return _userAnswer == correctAnswer;
}

- (BOOL) answer: (int) userAnswer {
    [self setAnswer:userAnswer];
    return [self isCorrect];
}

- (BOOL) answerInString: (NSString *) answerString {
    int answer = numberize(answerString);
    return [self answer:answer];
}

int numberize(NSString *original) {
    return [original intValue];
}

@end
