//
//  AmazonPaymentService.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "AmazonPaymentService.h"

@interface AmazonPaymentService() {
@private BOOL available;
}

@end

@implementation AmazonPaymentService

-(instancetype)init {
    self = [super init];
    available = arc4random_uniform(2) == 1;
    return self;
}

-(void)processPaymentAmount: (NSInteger) amount {
    printf("You are paying $%ld at Amazon.\n", (long)amount);
}

-(BOOL)canProcessPayment {
    return available;
}

@end
