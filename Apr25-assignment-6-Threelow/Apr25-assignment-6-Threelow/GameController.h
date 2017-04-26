//
//  GameController.h
//  Apr25-assignment-6-Threelow
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameController : NSObject

@property BOOL finished;
@property NSMutableArray *dice;
@property NSMutableArray *heldDice;

- (void) iterate;

@end
