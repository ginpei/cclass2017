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

const int numDice = 5;

@implementation GameController

- (instancetype) init {
    _finished = false;
    _dice = [NSMutableArray array];
    for (int i = 0; i < numDice; i++) {
        [_dice addObject:[Dice new]];
    }
    _heldDice = [NSMutableArray array];
    return self;
}

- (void) iterate {
    [self printHeldDice];
    [self printDice];
    [self printScore];
    
    NSString *command = [InputHandler ask:@"Input indexes or command. (\"help\" for help)\n"];
    if (command == NULL || [command isEqualToString:@"quit"]) {
        _finished = true;
        return;
    }
    else if ([command isEqualToString:@"help"]) {
        [self printHelp];
    }
    else if ([command isEqualToString:@""] || [command isEqualToString:@"roll"]) {
        if (self.hasNewHeldDice) {
            [self rollDice];
        }
        else {
            printf("You have to choose at least one.\n");
        }
    }
    else {
        [self toggleHeld:command];
    }
    
    printf("\n");
}

- (void) printHeldDice {
    if (_heldDice.count > 0) {
        printf("Held Dice: ");
        for (Dice *die in _heldDice) {
            printf("%s ", [die.surface UTF8String]);
        }
        printf("\n");
    }
}

- (void) printDice {
    for (int i = 0; i < _dice.count; i++) {
        Dice *die = _dice[i];
        if (die.held) {
            printf(" [%s] ", [die.surface UTF8String]);
        }
        else {
            printf("  %s ", [die.surface UTF8String]);
        }
    }
    printf("\n");
    
    for (int i = 0; i < _dice.count; i++) {
        printf(" #%d ", i);
    }
    printf("\n");
}

- (void) printScore {
    printf("Score: %d\n", self.score);
}

- (int) score {
    int score = 0;
    for (Dice *die in _heldDice) {
        score += die.number;
    }
    return score;
}

- (void) printHelp {
    printf("\tYou can input multiple indexes deliminating by comma(,).\n");
    printf("\t- roll … Roll all of not-held dice.\n");
    printf("\t- quit … Quit the game.\n");
}

- (BOOL) hasNewHeldDice {
    for (Dice *die in _dice) {
        if (die.held) {
            return true;
        }
    }
    return false;
}

- (void) rollDice {
    printf("Rolling...\n");
    [self updateDice];
}

- (void) updateDice {
    NSMutableArray *newDice = [NSMutableArray array];
    for (Dice *die in _dice) {
        if (die.held) {
            [_heldDice addObject:die];
        }
        else {
            [newDice addObject:die];
        }
    }
    _dice = newDice;
}

- (void) toggleHeld: (NSString *) command {
    NSMutableArray *strIndexes = [self breakIndexes:command];
    for (NSString *strIndex in strIndexes) {
        int index = strIndex.intValue;
        Dice *die = _dice[index];
        [die toggleHeld];
        
    }
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
        if (0 <= index && index < _dice.count) {
            [indexes addObject:strIndex];
        }
    }
    
    return indexes;
}

@end
