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
        if (die.held) {
            printf("#%d:[%s](%d), ", i, [die.surface UTF8String], die.number);
        }
        else {
            printf("#%d: %s (%d), ", i, [die.surface UTF8String], die.number);
        }
    }
    printf("\n");
    
    NSString *command = [InputHandler ask:@"Input indexes or command. (\"help\" for help)\n"];
    if (command == NULL || [command isEqualToString:@"quit"]) {
        _finished = true;
        return;
    }
    else if ([command isEqualToString:@"help"]) {
        [self printHelp];
    }
    else {
        NSMutableArray *strIndexes = [self breakIndexes:command];
        if (strIndexes.count > 0) {
            for (NSString *strIndex in strIndexes) {
                int index = strIndex.intValue;
                Dice *die = _dice[index];
                [die toggleHeld];
            }
        }
        else {
            printf("?\n");
        }
    }
    
    printf("\n");
}

- (void) printHelp {
    printf("\tYou can input multiple indexes deliminating by comma(,).\n");
    printf("\t- roll … Roll all of not-held dice.\n");
    printf("\t- quit … Quit the game.\n");
}

- (NSMutableArray *) breakIndexes: (NSString *) line {
    NSMutableArray *indexes = [NSMutableArray array];
    
    // split
    NSArray *strIndexes = [line componentsSeparatedByString:@","];
    
    // pick up only availables
    // TODO avoid duplications
    for (int i = 0; i < strIndexes.count; i++) {
        NSString *strIndex = strIndexes[i];
        int index = strIndex.intValue;
        if (1 <= index && index <= 6) {
            [indexes addObject:strIndex];
        }
    }
    
    return indexes;
}

@end
