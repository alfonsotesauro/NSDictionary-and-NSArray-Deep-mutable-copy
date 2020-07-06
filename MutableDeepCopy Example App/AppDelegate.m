//
//  AppDelegate.m
//  MutableDeepCopy Example App
//
//  Created by Alfonso Maria Tesauro on 14/12/15.
//  Copyright © 2015 Alfonso Maria Tesauro. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;

@end

@implementation AppDelegate

@synthesize myDict;;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    NSUserDefaults* myDefaults = [NSUserDefaults standardUserDefaults];
    
    // Here we retrieve the NSUserDefaults as a dictionary representaion. As this returns a
    // CFDictionaryRef, I prefer to create a modern dictionary for easier ispection in the debugger.
    
    NSDictionary *defaultsDictionaryRepresentation = [NSDictionary dictionaryWithDictionary:[myDefaults dictionaryRepresentation]];
    
    // In fact, after the mutable dict copy, we may want to inspect the returned dictionary keys to
    // check they have been turned to their mutable counterparts.

    self.myDict = [NSDictionary doDeepMutateDictionary:defaultsDictionaryRepresentation];
    
    NSLog(@"Eccoci");
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
