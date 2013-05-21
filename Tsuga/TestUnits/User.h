//
//  User.h
//  Tsuga
//
//  Created by Alex Denisov on 21.05.13.
//  Copyright (c) 2013 okolodev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Conformable.h"

@interface User : NSObject
    <Conformable>

+ (instancetype)newUser;

- (void)hello;

@end
