//
//  main.m
//  Apr18-objc
//
//  Created by Ginpei on 2017-04-18.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int i = 128;
        NSString *message = @"Hello, World!";
        NSString *upper = [message uppercaseString];
        NSLog(@"message=[%@] -> [%@], i=[%d]", message, upper, i);
        
        NSString *appended = [message stringByAppendingString:@"--added!"];
        NSLog(@"original [%@], appending string [%@]", message, appended);
        
        NSString *dynamicString = [[NSString alloc] init];
        NSLog(@"new string: %@", dynamicString);
        
        NSDate *today = [[NSDate alloc] init];
        today = [NSDate date];
        NSLog(@"today=%@", today);
        
        NSDate *now = [NSDate date];
        NSLog(@"now=%@", now);
        
        bool b1 = YES;
        Boolean b2 = YES;
        BOOL b3 = YES;
        NSLog(@"b1 %d, b2 %d, b3 %d", b1, b2, b3);
        
//        NSMutableString *mutableString = @"ABC";
//        [mutableString appendString:@"XYZ"];
        
        NSString *str1 = @"Galaxy Hichhiker";
        NSString *str2 = [@"Galaxy" stringByAppendingString:@" Hichhiker"];
        if ([str1 isEqualToString:str2]) {
            NSLog(@"str1 and str2 are same!");
        }
    }
    return 0;
}
