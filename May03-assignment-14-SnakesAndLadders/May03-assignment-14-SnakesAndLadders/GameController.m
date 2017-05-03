//
//  GameController.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameController.h"
#import "Player.h"

@implementation GameController

-(void)createPlayers: (NSInteger) amount
{
    _players = [NSMutableArray array];
    for (int i = 0; i < amount; i++) {
        NSString *name = [NSString stringWithFormat:@"Player %d", i + 1];  // "Player 1"
        Player *player = [Player playerWithName:name];
        [_players addObject:player];
    }
}

-(void)roll {
    for (Player *player in _players) {
        NSInteger dieNumber = [player roll];
        NSLog(@"[%@]: Die[%ld], Square[%ld]", player.name, dieNumber, (long)player.currentSquare);
    }
}

@end
