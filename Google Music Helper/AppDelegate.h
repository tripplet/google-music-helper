//
//  AppDelegate.h
//  Google Music Helper
//
//  Created by Tangemann Tobias on 19.04.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPMediaKeyTap.h"

@interface AppDelegate : NSObject <NSApplicationDelegate> {
  IBOutlet NSMenu *statusMenu;
  NSStatusItem *statusItem;
  NSImage *statusImage;
  NSImage *statusHighlightImage;
  
  NSAppleScript* playPauseScript;
  NSAppleScript* searchScript;  
  NSAppleScript* nextSongScript;
  NSAppleScript* previousSongScript;
}

- (IBAction)playPause:(id)sender;
- (IBAction)searchSong:(id)sender;
- (IBAction)nextSong:(id)sender;
- (IBAction)previousSong:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end

