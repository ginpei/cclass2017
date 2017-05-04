//
//  GameController.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameController.h"
#import "Player.h"

@interface GameController()
{
@private NSMutableDictionary *gameLogic;
}

@end

@implementation GameController

- (instancetype)init
{
    self = [super init];
    if (self) {
        gameLogic = [NSMutableDictionary dictionary];
        [self defineGameLogics];
    }
    return self;
}

-(void)defineGameLogics
{
    [gameLogic setValue:@14 forKey:@"4"];
    [gameLogic setValue:@31 forKey:@"9"];
    [gameLogic setValue:@7 forKey:@"17"];
    [gameLogic setValue:@38 forKey:@"20"];
    [gameLogic setValue:@84 forKey:@"28"];
    [gameLogic setValue:@59 forKey:@"40"];
    [gameLogic setValue:@67 forKey:@"51"];
    [gameLogic setValue:@81 forKey:@"63"];
    [gameLogic setValue:@60 forKey:@"64"];
    [gameLogic setValue:@26 forKey:@"89"];
    [gameLogic setValue:@73 forKey:@"95"];
    [gameLogic setValue:@78 forKey:@"99"];
}

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
