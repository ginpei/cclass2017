//
//  Dice.m
//  Apr25-assignment-6-Threelow
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Dice.h"

@implementation Dice

+ (NSString *) surfaceOf: (int) number {
    if (number == 1) {
        return @"⚀";
    }
    else if (number == 2) {
        return @"⚁";
    }
    else if (number == 3) {
        return @"⚂";
    }
    else if (number == 4) {
        return @"⚃";
    }
    else if (number == 5) {
        return @"⚄";
    }
    else if (number == 6) {
        return @"⚅";
    }
    else {
        return @"";
    }
}

- (instancetype) init {
    [self roll];
    return self;
}

- (NSString *) surface{
    return [Dice surfaceOf:_number];
}

- (void) roll {
    _number = arc4random_uniform(6) + 1;  // 1-6
}

- (void) tsuyoiRoll {
    _number = 3;
}

- (void) hold: (BOOL) held {
    self.held = held;
}

- (void) toggleHeld{
    [self hold: !_held];
}

@end
