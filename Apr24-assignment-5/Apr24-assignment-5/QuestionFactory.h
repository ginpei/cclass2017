//
//  QuestionFactory.h
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Question.h"

@interface QuestionFactory : NSObject

- (Question *) generateRandomQuestion;

@end
