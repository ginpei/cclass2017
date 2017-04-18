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

NSString *trim(NSString *original) {
    return [original stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" \n"]];
}

NSString *uppercase(NSString *original) {
    return [original uppercaseString];
}

NSString *lowercase(NSString *original) {
    return [original lowercaseString];
}

float numberize(NSString *original) {
    return [original floatValue];
}

NSString *canadianize(NSString *original) {
    return [original stringByAppendingString:@", eh?"];
}

NSString *respond(NSString *original) {
    NSString *trimmed = trim(original);
    if ([trimmed hasSuffix:@"?"]) {
        return @"I don't know.";
    }
    else if ([trimmed hasSuffix:@"!"]) {
        return @"Whoa, calm down!";
    }
    else {
        return @"Yeah.";
    }
}

NSString *deSpaceIt(NSString *original) {
    return [original stringByReplacingOccurrencesOfString:@" " withString:@"-"];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (1) {
            printf("Input a string: \n");  // line break for Xcode v8.3.1
            NSString *inputString = trim(getLine(255));
            if (inputString == NULL || [inputString length] < 1) {
                break;
            }
            
            printf("\n");  // empty line
            
            printf("1. Uppercase\n");
            printf("2. Lowercase\n");
            printf("3. numberize\n");
            printf("4. Canadianize\n");
            printf("5. Respond\n");
            printf("6. De-Space-It\n");
            printf("9. Quit\n");
            printf("What you want to do?: \n");  // line break for Xcode v8.3.1
            NSString *commandLine = getLine(255);
            int commandId = (int) numberize(commandLine);
            
            if (commandId == 1) {
                printf("%s\n", [uppercase(inputString) UTF8String]);
            }
            else if (commandId == 2) {
                printf("%s\n", [lowercase(inputString) UTF8String]);
            }
            else if (commandId == 3) {
                printf("%g\n", numberize(inputString));
            }
            else if (commandId == 4) {
                printf("%s\n", [canadianize(inputString) UTF8String]);
            }
            else if (commandId == 5) {
                printf("\"%s\"\n\"%s\"\n", [inputString UTF8String], [respond(inputString) UTF8String]);
            }
            else if (commandId == 6) {
                printf("%s\n", [deSpaceIt(inputString) UTF8String]);
            }
            else if (commandLine == NULL || commandId == 9) {
                break;
            }
            else {
                printf("Pardon me?\n");
            }
            
            printf("\n");  // empty line
        }
        
        NSLog(@"Bye!");
    }
    return 0;
}
