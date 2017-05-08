//
//  AdditionQuestion.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "AdditionQuestion.h"

@implementation AdditionQuestion

- (NSString *) getQuestion {
    return [NSString stringWithFormat:@"%d + %d", self.num1, self.num2];
}

- (void) generateRandomQuestion {
    // numbers should be between 1 and 99
    self.num1 = arc4random_uniform(98) + 1;
    self.num2 = arc4random_uniform(98) + 1;
}

- (BOOL) isCorrect {
    int correctAnswer = self.num1 + self.num2;
    return self.userAnswer == correctAnswer;
}

@end
