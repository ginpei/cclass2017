//
//  main.m
//  Apr25-assignment-6-Threelow
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameController *game = [GameController new];
        while (!game.finished) {
            [game printHeldDice];
            [game printDice];
            NSString *command = [game receiveCommand];
            [game runCommand:command];
        }
        [game printScore];
    }
    return 0;
}
