//
//  AppDelegate.h
//  Google Music Helper
//
//  Created by Tangemann Tobias on 19.04.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  IBOutlet NSMenu *statusMenu;
  NSStatusItem *statusItem;
  NSImage *statusImage;
  NSImage *statusHighlightImage;
  
  NSAppleScript* playPauseScript;
  NSAppleScript* searchScript;  
}

- (IBAction)playPause:(id)sender;
- (IBAction)searchSong:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end

