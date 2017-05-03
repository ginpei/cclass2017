//
//  main.m
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UiController.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        UiController *controller = [UiController new];
        
        while (!controller.finished) {
            NSString *input = [controller ask:@"Hit return to roll, enter help for help."];
            if (input == NULL || [input isEqualToString:@"quit"]) {
                [controller finish];
                continue;
            }
            else if ([input isEqualToString:@"help"]) {
                [controller printHelp];
            }
            else if ([input isEqualToString:@""]) {
                // TODO
                [controller output:@"roll!"];
            }
            else {
                [controller output:input];
            }
            
            [controller outputEmptyLine];
        }
    }
    return 0;
}
