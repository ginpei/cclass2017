//
//  Player.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Player.h"

@interface Player() {
@private NSInteger goal;
}

@end

@implementation Player

+ (instancetype)playerWithName: (NSString *) name
{
    Player *instance = [[Player alloc] initWithName:name];
    return instance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        goal = 100;
        _currentSquare = 1;
        _gameOver = NO;
    }
    return self;
}

- (instancetype)initWithName: (NSString *) name
{
    self = [self init];
    if (self) {
        _name = name;
    }
    return self;
}

-(NSInteger)roll {
    int dieNumber = arc4random_uniform(6) + 1;
    _currentSquare += dieNumber;
    
    if (_currentSquare >= goal) {
        _currentSquare = goal;
        _gameOver = YES;
    }
    else if (_currentSquare < 1) {
        _currentSquare = 1;
    }
    
    return dieNumber;
}

-(void)moveTo:(NSInteger)destination
{
    _currentSquare = destination;
}

@end
