//
//  PaypalPaymentService.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "PaypalPaymentService.h"

@interface PaypalPaymentService() {
@private BOOL available;
}

@end

@implementation PaypalPaymentService

-(instancetype)init {
    self = [super init];
    available = arc4random_uniform(2) == 1;
    return self;
}

-(void)processPaymentAmount: (NSInteger) amount {
    printf("You are paying $%ld at Paypal.\n", amount);
}

-(BOOL)canProcessPayment {
    return available;
}

@end
