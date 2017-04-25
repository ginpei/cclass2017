//
//  InputCollector.m
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "InputCollector.h"
#import "InputHandler.h"

@implementation InputCollector

- (NSString *) inputForPrompt: (const NSString *) promptString {
    printf("%s\n", [promptString UTF8String]);
    printf("> ");
    NSString *line = [InputHandler getLine];
    return line;
}

@end
