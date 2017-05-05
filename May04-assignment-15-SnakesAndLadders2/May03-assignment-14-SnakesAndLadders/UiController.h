//
//  UiController.h
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UiController : NSObject

@property int lineMax;

-(BOOL)finished;
-(void)finish;
-(NSString *)ask: (NSString *)question;
-(NSString *)askWithFormat: (NSString *)format, ...;
-(void)output: (NSString *)message;
-(void)output: (NSString *)message withIndentLv:(NSInteger)lv;
-(void)outputWithoutNewLine: (NSString *)message;
-(void)outputEmptyLine;
-(void)printHelp;

@end
