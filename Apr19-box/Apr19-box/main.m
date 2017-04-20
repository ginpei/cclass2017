//
//  main.m
//  Apr19-box
//
//  Created by Ginpei on 2017-04-19.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Box.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Box *box = [[Box alloc] initWithDimentions:2 with:3 with:4];
        NSLog(@"Box (%g, %g, %g) is %g.", box.width, box.height, box.length, [box volume]);
        
        Box *box2 = [[Box alloc] initWithDimentions:5 with:1 with:1];
        NSLog(@"Volume is %g so %d times in %g", [box2 volume], [box2 howManyTimesFitIn:box], [box volume]);
    }
    return 0;
}
