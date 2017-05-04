//
//  Player.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Player.h"

@interface Player() {
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
        _currentSquare = 0;
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
    return dieNumber;
}

-(void)moveTo:(NSInteger)destination
{
    _currentSquare = destination;
}

@end
