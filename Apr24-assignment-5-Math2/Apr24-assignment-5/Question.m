//
//  Question.m
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-24.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Question.h"

@implementation Question

+ (instancetype) newQuestion {
    Question *instance = [self new];
    [instance generateRandomQuestion];
    return instance;
}

- (instancetype) init {
    self = [super init];
    _startTime = [NSDate date];
    return self;
}

- (void) userAnswer: (int) answer {
    _userAnswer = answer;
    _endTime = [NSDate date];
}

- (NSString *) getQuestion {
    return [NSString stringWithFormat:@"%d + %d", _num1, _num2];
}

- (void) generateRandomQuestion {
    // numbers should be between 1 and 99
    _num1 = arc4random_uniform(98) + 1;
    _num2 = arc4random_uniform(98) + 1;
}

- (BOOL) isCorrect {
    int correctAnswer = _num1 + _num2;
    return _userAnswer == correctAnswer;
}

- (NSTimeInterval) answerTime {
    return [_endTime timeIntervalSinceDate: _startTime];
}

- (BOOL) answer: (int) userAnswer {
    [self userAnswer:userAnswer];
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
