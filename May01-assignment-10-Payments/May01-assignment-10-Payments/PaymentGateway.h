//
//  PaymentGateway.h
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PaymentGateway <NSObject>

-(void)processPaymentAmount: (NSInteger) amount;

@end
