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
}

- (void)showWindow:(id)sender
{
  [NSApp activateIgnoringOtherApps:YES];
  [self.window makeKeyAndOrderFront:sender];
}

- (BOOL)windowShouldClose:(id)sender {
  [self.window orderOut:sender];
  NSLog(@"%@", self.window);
  return NO;
}

- (void) tooglePlayPause
{
  [self.webview stringByEvaluatingJavaScriptFromString:@"SJBpost('playPause');"];
}

- (void) nextSong
{
  [self.webview stringByEvaluatingJavaScriptFromString:@"SJBpost('nextSong');"];
}

- (void) previousSong
{
  [self.webview stringByEvaluatingJavaScriptFromString:@"SJBpost('prevSong');"];
}

- (NSString*) getNextPlayPauseAction
{
  return [self.webview stringByEvaluatingJavaScriptFromString:@"document.getElementById('playPause').getAttribute('title');"];
}

@end
