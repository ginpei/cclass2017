//
//  Box.h
//  Apr19-box
//
//  Created by Ginpei on 2017-04-19.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Box : NSObject

@property float width;
@property float height;
@property float length;

- (instancetype) initWithDimentions: (float) width with: (float) height with: (float) length;
- (float) volume;
- (int) howManyTimesFitIn: (Box *) otherBox;

@end
