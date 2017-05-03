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
    NSArray *questionClassNames = @[
                                    @"AdditionQuestion",
                                    @"SubtractionQuestion",
                                    @"MultiplicationQuestion",
                                    @"DivisionQuestion",
                                    ];
    NSString *className = questionClassNames[arc4random_uniform((int) questionClassNames.count)];
    Question *question = [NSClassFromString(className) newQuestion];
    return question;
}

@end
