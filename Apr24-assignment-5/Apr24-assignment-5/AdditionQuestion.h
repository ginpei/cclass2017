//
//  AdditionQuestion.h
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface AdditionQuestion : Question

- (NSString *) getQuestion;
- (void) generateRandomQuestion;
- (BOOL) isCorrect;

@end
