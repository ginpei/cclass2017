//
//  Dice.h
//  Apr25-assignment-6-Threelow
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Dice : NSObject

@property int number;
@property BOOL held;

+ (NSString *) surfaceOf: (int) number;

- (NSString *) surface;
- (void) roll;
- (void) tsuyoiRoll;
- (void) hold: (BOOL) held;
- (void) toggleHeld;

@end
