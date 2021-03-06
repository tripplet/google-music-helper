//
//  AppDelegate.h
//  Google Music Helper
//
//  Created by Tangemann Tobias on 19.04.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "SPMediaKeyTap.h"
#import "WebViewController.h"

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
- (IBAction)nextSong:(id)sender;
- (IBAction)previousSong:(id)sender;
- (IBAction)showWebView:(NSMenuItem *)sender;

@property (weak) IBOutlet NSMenuItem *playPauseItem;
@property (nonatomic, strong) IBOutlet WebViewController* googemusicplayer;
@end

