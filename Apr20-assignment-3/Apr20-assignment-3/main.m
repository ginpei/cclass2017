//
//  main.m
//  Apr20-assignment-3
//
//  Created by Ginpei on 2017-04-20.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AdditionQuestion.h"

NSString *getLine() {
    NSString *result = NULL;
    
    const int lineMax = 1024;
    char line[lineMax];
    const char *userInput = fgets(line, lineMax, stdin);
    if (userInput != NULL) {
        result = [NSString stringWithCString:userInput encoding:NSUTF8StringEncoding];
    }
    return result;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        while (YES) {
            AdditionQuestion *question = [AdditionQuestion newQuestion];
            
            printf("%s ?\n", [[question getQuestion] UTF8String]);
            
            NSString *line = getLine();
            if (line == NULL) {
                break;
            }
            
            if ([question answerInString:line]) {
                printf("Correct.\n");
            }
            else {
                printf("Wrong.\n");
            }
        }
        
        printf("Bye.\n");
    }
    return 0;
}
