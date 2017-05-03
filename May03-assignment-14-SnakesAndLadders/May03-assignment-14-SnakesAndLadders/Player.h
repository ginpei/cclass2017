//
//  Player.h
//  May03-assignment-14-SnakesAndLadders
//
//  Created by Ginpei on 2017-05-03.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Player : NSObject

@property (readonly) NSString *name;
@property (readonly) NSInteger currentSquare;

+(instancetype)playerWithName:(NSString*)name;
-(NSInteger)roll;

@end
