//
//  main.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            GameController *controller = [GameController new];
            
            NSString *numPlayersStr = [controller ask:@"How many players?"];
            [controller createPlayers:numPlayersStr.integerValue];
            
            while (!controller.finished) {
                NSString *input = [controller ask:@"Hit return to roll, enter \"help\" for help."];
                if (input == NULL || [input isEqualToString:@"quit"]) {
                    [controller finish];
                    continue;
                }
                else if ([input isEqualToString:@"help"]) {
                    [controller printHelp];
                }
                else if ([input isEqualToString:@""] || [input isEqualToString:@"r"] || [input isEqualToString:@"roll"]) {
                    [controller roll];
                }
                else {
                    // do nothing
                }
                
                [controller outputEmptyLine];
            }
            
            if ([[controller ask:@"Play again? (y/n)"] isEqualToString:@"y"]) {
                [controller init];  // no need to use the result
            }
            else {
                break;
            }
        }
    }
    return 0;
}
