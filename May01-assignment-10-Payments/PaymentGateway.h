//
//  PaymentGateway.h
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentService <NSObject>

-(void)processPaymentAmount: (NSInteger) amount;
-(BOOL)canProcessPayment;

@end

@interface PaymentGateway : NSObject

@property id<PaymentService> paymentService;

-(void)setGatewayByName:(NSString *)name;

@end
