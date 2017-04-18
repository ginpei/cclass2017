//
//  main.m
//  Apr18-exercise1-stringManipulator
//
//  Created by Ginpei on 2017-04-18.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

NSString *getLine(int maxLength) {
    if (maxLength < 1) {
        maxLength = 255;
    }
    
    char inputChars[maxLength];
    fgets(inputChars, maxLength, stdin);
    
    NSString *inputString = [NSString stringWithUTF8String:inputChars];
    return inputString;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("Input a string: \n");
        NSString *inputString = getLine(255);
        
        // print NSString object
        NSLog(@"Input was: %@", inputString);
    }
    return 0;
}
