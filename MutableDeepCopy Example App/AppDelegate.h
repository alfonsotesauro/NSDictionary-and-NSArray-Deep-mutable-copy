//
//  AppDelegate.h
//  MutableDeepCopy Example App
//
//  Created by Alfonso Maria Tesauro on 14/12/15.
//  Copyright © 2015 Alfonso Maria Tesauro. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "NSDictionary+MutableDeepCopy.h"

//#import "NSDictionary+MutableDeepCopy.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (strong) NSMutableDictionary                  *myDict;


@end

