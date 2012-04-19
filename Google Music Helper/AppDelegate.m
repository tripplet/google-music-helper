//
//  AppDelegate.m
//  Google Music Helper
//
//  Created by Tangemann Tobias on 19.04.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;

- (void)awakeFromNib {
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
  
  NSBundle *bundle = [NSBundle mainBundle];
  
  statusImage = [[NSImage alloc] initWithContentsOfFile:[bundle pathForResource:@"icon" ofType:@"png"]];
  
  [statusItem setImage:statusImage];
  [statusItem setAlternateImage:statusImage];
  [statusItem setMenu:statusMenu];
  [statusItem setToolTip:@"Google Music Helper"];
  [statusItem setHighlightMode:YES];
  
  // load scripts
  NSString* path_playPause = [[NSBundle mainBundle] pathForResource:@"playpause" ofType:@"scpt"];
  NSURL* url_playPause = [NSURL fileURLWithPath:path_playPause];
  
  NSString* path_search = [[NSBundle mainBundle] pathForResource:@"search" ofType:@"scpt"];
  NSURL* url_search = [NSURL fileURLWithPath:path_search];
  
  NSDictionary* errors = [NSDictionary dictionary];
  
  playPauseScript = [[NSAppleScript alloc] initWithContentsOfURL:url_playPause error:&errors];
  searchScript = [[NSAppleScript alloc] initWithContentsOfURL:url_search error:&errors];
}

- (IBAction)playPause:(id)sender {
  [NSApp activateIgnoringOtherApps:YES];  
  NSLog(@"Played/Paused music");
    
  [playPauseScript executeAndReturnError:nil];  
}

- (IBAction)searchSong:(id)sender {  
  [NSApp activateIgnoringOtherApps:YES];
  NSLog(@"Search music");
  
  [searchScript executeAndReturnError:nil];
}

@end
