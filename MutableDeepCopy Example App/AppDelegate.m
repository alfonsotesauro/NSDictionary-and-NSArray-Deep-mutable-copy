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

@synthesize myTreeController;
@synthesize myDictController;
@synthesize myDict;;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application

    NSUserDefaults* myDefaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *defaultsDictionaryRepresentation = [NSDictionary dictionaryWithDictionary:[myDefaults dictionaryRepresentation]];

    self.myDict = [defaultsDictionaryRepresentation mutableDeepCopy];
    
    [self.myDictController rearrangeObjects];
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender {
    return YES;
}

@end
