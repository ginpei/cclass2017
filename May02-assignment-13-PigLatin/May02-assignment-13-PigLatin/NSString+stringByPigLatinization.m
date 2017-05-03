//
//  NSString+NSString_stringByPigLatinization.m
//  May02-assignment-13-PigLatin
//
//  Created by Ginpei on 2017-05-02.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import "NSString+stringByPigLatinization.h"

@implementation NSString (stringByPigLatinization)

-(NSString *)stringByPigLatinization
{
    NSMutableArray *results = [NSMutableArray new];
    NSArray *words = [self componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    for (int i = 0; i < words.count; i++) {
        [results addObject:[self pigLatinize:words[i]]];
    }
    
    return [results componentsJoinedByString:@" "];
}

-(NSString *)pigLatinize: (NSString *)original {
    NSString *result = NULL;
    
    if (original.length > 0) {
        NSRange range = [original rangeOfCharacterFromSet:[NSCharacterSet characterSetWithCharactersInString:@"aeiou"]];
        NSLog(@"%lul", (unsigned long)range.location);
        if (range.location < original.length) {
            result = [NSString stringWithFormat:@"%@%@ay", [original substringFromIndex:range.location], [original substringToIndex:range.location]];
        }
    }
    
    if (result == NULL) {
        result = original;
    }
    return result;
}

@end
