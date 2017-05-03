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
            NSString *input = [controller ask:@"Hello!"];
            if (input == NULL || [input isEqualToString:@"quit"]) {
                [controller finish];
                continue;
            }
            else {
                [controller output:input];
            }
        }
    }
    return 0;
}
