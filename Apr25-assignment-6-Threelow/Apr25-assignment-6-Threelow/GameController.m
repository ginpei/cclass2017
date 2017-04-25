//
//  GameController.m
//  Apr25-assignment-6-Threelow
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "GameController.h"
#import "Dice.h"
#import "InputHandler.h"

const int numDice = 6;

@implementation GameController

- (instancetype) init {
    _finished = false;
    _dice = [NSMutableArray array];
    for (int i = 0; i < numDice; i++) {
        [_dice addObject:[Dice new]];
    }
    return self;
}

- (void) iterate {
    for (int i = 0; i < numDice; i++) {
        Dice *die = _dice[i];
        printf("#%d: %s (%d), ", i, [die.surface UTF8String], die.number);
    }
    printf("\n");
    
    printf("Do you want do something?\n");
    NSString *line = [InputHandler getLine];
    if (line == NULL || [line isEqualToString:@"quit"]) {
        _finished = true;
        return;
    }
}

@end
