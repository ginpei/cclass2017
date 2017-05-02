//
//  StripePaymentService.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "StripePaymentService.h"

@implementation StripePaymentService

-(void)processPaymentAmount: (NSInteger) amount {
    printf("You are paying $%ld at Stripe.\n", (long)amount);
}

-(BOOL)canProcessPayment {
    return NO;
}

@end
