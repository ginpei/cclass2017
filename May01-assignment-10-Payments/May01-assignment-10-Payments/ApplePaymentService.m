//
//  ApplePaymentService.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "ApplePaymentService.h"

@interface ApplePaymentService() {
@private BOOL available;
}

@end

@implementation ApplePaymentService

-(instancetype)init {
    self = [super init];
    available = arc4random_uniform(2) == 1;
    return self;
}

-(void)processPaymentAmount: (NSInteger) amount {
    printf("You are paying $%ld at ApplePay.\n", amount);
}

-(BOOL)canProcessPayment {
    return available;
}

@end
