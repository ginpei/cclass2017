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

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSLog(@"Please pick your pizza size and toppings:");
        
        Kitchen *restaurantKitchen = [Kitchen new];
        
        while (TRUE) {
            // Loop forever
            
            NSLog(@"> ");
            char str[100];
            fgets (str, 100, stdin);
            
            NSString *inputString = [[NSString alloc] initWithUTF8String:str];
            inputString = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
            
            NSLog(@"Input was %@", inputString);
            
            // Take the first word of the command as the size, and the rest as the toppings
            NSArray *commandWords = [inputString componentsSeparatedByString:@" "];
            
            // And then send some message to the kitchen...
            PizzaSize size = [Pizza sizeFromString:commandWords[0]];
            NSArray *toppings = [commandWords subarrayWithRange:NSMakeRange(1, commandWords.count - 1)];
            Pizza *pizza = [[Pizza alloc] initWithSize:size toppings:toppings];
            NSLog(@"Here is a %@.", pizza);
            
            Pizza *largePepperoni = [Pizza largePepperoni];
            NSLog(@"Here is a %@.", largePepperoni);
            Pizza *meatLoversWithSize = [Pizza meatLoversWithSize:large];
            NSLog(@"Here is a %@.", meatLoversWithSize);
        }

    }
    return 0;
}

