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
    char *result = fgets(inputChars, maxLength, stdin);
    
    if (result != NULL) {
        NSString *inputString = [NSString stringWithUTF8String:inputChars];
        return inputString;
    }
    else {
        return NULL;
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (1) {
            NSLog(@"Input a string: \n");
            NSString *inputString = getLine(255);
            if (inputString == NULL) {
                break;
            }
            
            // print NSString object
            NSLog(@"Input was: %@", inputString);
        }
        
        NSLog(@"Bye!");
    }
    return 0;
}
