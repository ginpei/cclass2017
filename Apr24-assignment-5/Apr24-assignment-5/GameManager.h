//
//  GameManager.h
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameManager : NSObject

@property int numQuestions;
@property NSMutableArray *questions;
@property int numRight;
@property int numWrong;

+ (instancetype) newGameFor: (int) numQuestions;
- (void) start;
- (BOOL) iterate;
- (void) printResult;
- (void) printWrongQuestins;
- (float) calcCorrectRate;
- (NSTimeInterval) totalAnswerTime;
- (NSTimeInterval) averageAnswerTime;

@end
