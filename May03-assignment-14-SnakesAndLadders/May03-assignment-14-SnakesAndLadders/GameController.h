//
//  GameController.h
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UiController.h"

@interface GameController : UiController

@property (readonly) NSMutableArray *players;

-(void)createPlayers: (NSInteger) amount;
-(void)roll;

@end
