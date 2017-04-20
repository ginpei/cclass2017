//
//  Box.m
//  Apr19-box
//
//  Created by Ginpei on 2017-04-19.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "Box.h"

@implementation Box

- (instancetype) initWithDimentions: (float) width with: (float) height with: (float) length {
    _width = width;
    _height = height;
    _length = length;
    return self;
}

- (float) volume {
    return _width * _height * _length;
}

- (int) howManyTimesFitIn: (Box *) otherBox {
    return (int) ([otherBox volume] / [self volume]);
}

@end
