//
//  PaymentGateway.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "PaymentGateway.h"
#import "StripePaymentService.h"
#import "PaypalPaymentService.h"
#import "AmazonPaymentService.h"
#import "ApplePaymentService.h"

@implementation PaymentGateway

-(void)setGatewayByName:(NSString *)name {
    if ([name isEqualToString:@"paypal"]) {
        _paymentService = [PaypalPaymentService new];
    }
    else if ([name isEqualToString:@"stripe"]) {
        _paymentService = [StripePaymentService new];
    }
    else if ([name isEqualToString:@"amazon"]) {
        _paymentService = [AmazonPaymentService new];
    }
    else if ([name isEqualToString:@"apple"]) {
        _paymentService = [ApplePaymentService new];
    }
    else {
        _paymentService = NULL;
    }
}

@end
