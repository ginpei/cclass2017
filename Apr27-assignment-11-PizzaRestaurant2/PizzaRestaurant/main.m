//
//  main.m
//  PizzaRestaurant
//
//  Created by Steven Masuch on 2014-07-19.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Kitchen.h"
#import "Pizza.h"
#import "AntiAnchoviManager.h"
#import "CheeryManager.h"
#import "DeleveryService.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        DeleveryService *deleveryService = [DeleveryService new];
        AntiAnchoviManager *antiAnchoviManager = [AntiAnchoviManager new];
        CheeryManager *cheeryManager = [CheeryManager new];
        antiAnchoviManager.deleveryService = deleveryService;
        cheeryManager.deleveryService = deleveryService;
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            if (fgets (str, 100, stdin) == NULL) {
                break;
            }
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            NSString *keyword = commandWords[0];
            
            Pizza *pizza;
            if ([keyword isEqualToString:@"pepperoni"]) {
                pizza = [Pizza largePepperoni];
            }
            else {
                NSLog(@"Who do you want to make pizza? 1. AntiAnchoviManager 2. CheeryManager 3. No managers");
                NSLog(@"> ");
                char str[100];
                fgets (str, 100, stdin);
                NSString *inputString = [[[NSString alloc] initWithUTF8String:str] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
                if ([inputString isEqualToString:@"1"]) {
                    restaurantKitchen.delegate = antiAnchoviManager;
                }
                else if ([inputString isEqualToString:@"2"]) {
                    restaurantKitchen.delegate = cheeryManager;
                }
                else {
                    restaurantKitchen.delegate = NULL;
                }
                
                // And then send some message to the kitchen...
                PizzaSize size = [Pizza sizeFromString:keyword];
                NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count - 1)];
                pizza = [restaurantKitchen makePizzaWithSize:size toppings:toppings];
            }
            
            if (pizza != NULL) {
                NSLog(@"Here is a %@.", pizza);
            }
            else {
                NSLog(@"I'm sorry but there are no pizza for you!");
            }
        }

    }
    return 0;
}

