//
//  main.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        GameManager *gameManager = [GameManager newGameFor:10];
        [gameManager start];
        
        printf("Bye.\n");
    }
    return 0;
}
