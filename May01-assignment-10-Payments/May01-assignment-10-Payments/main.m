//
//  main.m
//  May01-assignment-10-Payments
//
//  Created by Ginpei on 2017-05-01.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UiController.h"
#import "PaymentGateway.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        UiController *controller = [UiController new];
        PaymentGateway *paymentGateway = [PaymentGateway new];
        int price = arc4random_uniform(1000 + 1 - 100) + 1000;
        
        while (!controller.finished) {
            NSString *message = [NSString stringWithFormat:@"Thank you for shopping at Acme.com Your total today is $%d Please select your payment method: 1: Paypal, 2: Stripe, 3: Amazon", price];
            NSString *input = [controller ask:message];
            if (input == NULL || [input isEqualToString:@"quit"]) {
                [controller finish];
                continue;
            }
            else if ([input isEqualToString:@"1"]) {
                [paymentGateway setGatewayByName:@"stripe"];
            }
            else if ([input isEqualToString:@"2"]) {
                [paymentGateway setGatewayByName:@"paypal"];
            }
            else if ([input isEqualToString:@"3"]) {
                [paymentGateway setGatewayByName:@"amazon"];
            }
            else {
                paymentGateway = NULL;
            }
            
            if ([paymentGateway.paymentService canProcessPayment]) {
                [paymentGateway.paymentService processPaymentAmount:price];
            }
            else {
                [controller output:@"Not available..."];
            }
        }
        
        [controller output:@"Bye!"];
    }
    return 0;
}
