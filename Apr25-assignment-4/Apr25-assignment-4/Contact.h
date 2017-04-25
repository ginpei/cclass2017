//
//  Contact.h
//  Apr25-assignment-4
//
//  Created by Ginpei on 2017-04-25.
//  Copyright © 2017 Ginpei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property NSString *name;
@property NSString *email;
@property NSMutableArray *phones;

- (void) addPhone: (NSString *) label withNumber: (NSString *) number;

@end
