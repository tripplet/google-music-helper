//
//  WebViewController.m
//  Google Music Helper
//
//  Created by Tobias Tangemann on 26.09.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (void) awakeFromNib {
  [self.webview.mainFrame loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://play.google.com/music/"]]];
  
  // Setup user-stylesheet
  [self.webview setPreferencesIdentifier:@"GoogleMusicHelper"];
  [[self.webview preferences] setUserStyleSheetEnabled:YES];
  [[self.webview preferences] setUserStyleSheetLocation:
   [NSURL fileURLWithPath:
    [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"GoogleMusicHelper.css"]]];
}

- (void)showWindow:(id)sender
{
  [NSApp activateIgnoringOtherApps:YES];
  [self.window makeKeyAndOrderFront:sender];
}

- (BOOL)windowShouldClose:(id)sender {
  [self.window orderOut:sender];
  return NO;
}

- (void) tooglePlayPause
{
   NSLog(@"%@",[self.webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('player-middle')[0].childNodes[2].click()"]);
}

- (void) nextSong
{
  NSLog(@"%@",[self.webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('player-middle')[0].childNodes[3].click()"]);
}

- (void) previousSong
{
   NSLog(@"%@",[self.webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('player-middle')[0].childNodes[1].click()"]);
}

- (BOOL) isMusicPlaying
{
  NSString* ret = [self.webview stringByEvaluatingJavaScriptFromString:@"document.getElementsByClassName('player-middle')[0].childNodes[2].getAttribute('class').indexOf('playing')!=-1"];
  return [ret boolValue];
}

@end
