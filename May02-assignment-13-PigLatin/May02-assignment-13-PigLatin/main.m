//
//  main.m
//  May02-assignment-13-PigLatin
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSString+stringByPigLatinization.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            printf("Input a phrase:\n> \n");
            
            char buf[1023];
            if (fgets(buf, 1023, stdin) == NULL) {
                break;
            }
            NSString *line = [NSString stringWithUTF8String:buf];
            NSString *pigLatinized = [line stringByPigLatinization];
            printf("-> %s\n", pigLatinized.UTF8String);
        }
    }
    return 0;
}
