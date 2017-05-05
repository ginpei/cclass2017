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
-(void)outputWithFormat: (NSString *)format, ...;
-(void)outputWithoutNewLine: (NSString *)message;
-(void)outputEmptyLine;
-(NSInteger)increaseIndent;
-(NSInteger)decreaseIndent;
-(void)printHelp;

@end
