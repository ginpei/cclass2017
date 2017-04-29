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
    _completed = false;
    _tsuyoi = false;
    _dice = [NSMutableArray array];
    for (int i = 0; i < numDice; i++) {
        [_dice addObject:[Dice new]];
    }
    _heldDice = [NSMutableArray array];
    return self;
}

- (NSString *) receiveCommand {
    return [InputHandler ask:@"Just hit return to roll, input indexes to hold, or input command. (\"help\" for help)\n"];
}

- (void) runCommand: (NSString *) command {
    if (command == NULL || [command isEqualToString:@"quit"]) {
        _finished = true;
        return;
    }
    else if ([command isEqualToString:@"help"]) {
        [self printHelp];
    }
    else if ([command isEqualToString:@"reset"]) {
        [self resetHolding];
    }
    else if ([command isEqualToString:@"score"]) {
        [self printScore];
    }
    else if ([command isEqualToString:@"newgame"]) {
        [self newGame];
    }
    else if ([command isEqualToString:@"rolll"]) {
        [self turnTsuyoiOn];
    }
    else if ([command isEqualToString:@""] || [command isEqualToString:@"roll"]) {
        if (self.hasNewHeldDice) {
            [self updateDice];
            if (self.hasLeftDice) {
                [self rollDice];
            }
            else {
                self.finished = true;
                self.completed = true;
            }
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

- (void) printScore {
    if (_completed) {
        printf("Score: %d\n", self.score);
    }
    else {
        printf("Current Score: %d\n", self.score);
    }
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

- (void) printHelp {
    printf("\tYou can input multiple indexes deliminating by comma(,).\n");
    printf("\t- roll … Roll all of not-held dice.\n");
    printf("\t- reset … Un-hold all dice.\n");
    printf("\t- score … Print current score.\n");
    printf("\t- quit … Quit the game.\n");
    printf("\t- newgame … Start new game again.\n");
    printf("\t- help … Show this help.\n");
}

- (void) resetHolding {
    for (Dice *die in _dice) {
        [die hold:NO];
    }
}

- (BOOL) hasNewHeldDice {
    for (Dice *die in _dice) {
        if (die.held) {
            return true;
        }
    }
    return false;
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

- (BOOL) hasLeftDice {
    return _dice.count > 0;
}

- (void) rollDice {
    printf("Rolling...\n");
    for (Dice *die in _dice) {
        if (_tsuyoi) {
            [die tsuyoiRoll];
        }
        else {
            [die roll];
        }
    }
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

- (int) score {
    int score = 0;
    for (Dice *die in _heldDice) {
        if (die.number == 3) {
            score += 0;  // it's a special number!
        }
        else {
            score += die.number;
        }
    }
    return score;
}

- (void) newGame {
    while (YES) {
        NSString *line = [InputHandler ask:@"Are you sure you want to kill everything and restart whole things? (y/n)"];
        if ([line isEqualToString:@"n"]) {
            // canceled
            return;
        }
        else if ([line isEqualToString:@"y"]) {
            // progress
            break;
        }
    }
    
    [self init];
}

- (void) turnTsuyoiOn {
    printf("!\n");
    _tsuyoi = true;
    [self rollDice];
}

@end
