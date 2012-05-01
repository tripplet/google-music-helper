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
  
  [self loadScripts];
}

- (void)loadScripts
{
  // load scripts
  NSString* path_playPause = [[NSBundle mainBundle] pathForResource:@"playpause" ofType:@"scpt"];
  NSURL* url_playPause = [NSURL fileURLWithPath:path_playPause];
  
  NSString* path_search = [[NSBundle mainBundle] pathForResource:@"search" ofType:@"scpt"];
  NSURL* url_search = [NSURL fileURLWithPath:path_search];
  
  NSString* path_nextSong = [[NSBundle mainBundle] pathForResource:@"nextSong" ofType:@"scpt"];
  NSURL* url_nextSong = [NSURL fileURLWithPath:path_nextSong];
  
  NSString* path_previousSong = [[NSBundle mainBundle] pathForResource:@"prevSong" ofType:@"scpt"];
  NSURL* url_previousSong = [NSURL fileURLWithPath:path_previousSong];
  
  NSDictionary* errors = [NSDictionary dictionary];
  
  playPauseScript = [[NSAppleScript alloc] initWithContentsOfURL:url_playPause error:&errors];
  searchScript = [[NSAppleScript alloc] initWithContentsOfURL:url_search error:&errors];
  nextSongScript = [[NSAppleScript alloc] initWithContentsOfURL:url_nextSong error:&errors];
  previousSongScript = [[NSAppleScript alloc] initWithContentsOfURL:url_previousSong error:&errors];
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

- (IBAction)nextSong:(id)sender {  
  [NSApp activateIgnoringOtherApps:YES];
  NSLog(@"Search music");
  
  [nextSongScript executeAndReturnError:nil];
}

- (IBAction)previousSong:(id)sender {
  [NSApp activateIgnoringOtherApps:YES];
  NSLog(@"Search music");
  
  [previousSongScript executeAndReturnError:nil];
}

@end
