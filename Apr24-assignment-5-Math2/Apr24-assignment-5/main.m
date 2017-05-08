//
//  main.m
//  Apr24-assignment-5
//
//  Created by Ginpei on 2017-04-24.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameManager *gameManager = [GameManager newGameFor:10];
        [gameManager start];
        [gameManager printResult];
        [gameManager printTime];
        if (gameManager.numWrong > 0) {
            [gameManager printWrongQuestins];
        }
        printf("Bye.\n");
    }
    return 0;
}
