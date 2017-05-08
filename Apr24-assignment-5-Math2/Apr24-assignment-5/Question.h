//
//  Question.h
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-24.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Question : NSObject

@property int num1;
@property int num2;
@property int userAnswer;
@property NSDate *startTime;
@property NSDate *endTime;

+ (instancetype) newQuestion;
- (NSString *) getQuestion;
- (void) generateRandomQuestion;
- (BOOL) isCorrect;
- (NSTimeInterval) answerTime;
- (BOOL) answer: (int) answer;
- (BOOL) answerInString: (NSString *) answerString;

@end
