//
//  QuestionFactory.m
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "QuestionFactory.h"
#import "AdditionQuestion.h"
#import "SubtractionQuestion.h"
#import "MultiplicationQuestion.h"
#import "DivisionQuestion.h"

@implementation QuestionFactory

- (Question *) generateRandomQuestion {
    Question *question;
    int rand = arc4random_uniform(4);
    if (rand == 0) {
        question = [AdditionQuestion newQuestion];
    }
    else if (rand == 1) {
        question = [SubtractionQuestion newQuestion];
    }
    else if (rand == 2) {
        question = [MultiplicationQuestion newQuestion];
    }
    else if (rand == 3) {
        question = [DivisionQuestion newQuestion];
    }
    else {
        @throw @"WTF";
    }
    return question;
}

@end
