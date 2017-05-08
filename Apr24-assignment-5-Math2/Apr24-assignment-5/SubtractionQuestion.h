//
//  SubtractionQuestion.h
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-24.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface SubtractionQuestion : Question

- (NSString *) getQuestion;
- (void) generateRandomQuestion;
- (BOOL) isCorrect;

@end
