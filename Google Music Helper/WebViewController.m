//
//  WebViewController.m
//  Google Music Helper
//
//  Created by Tobias Tangemann on 26.09.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import "WebViewController.h"

@implementation WebViewController

- (id)init
{
  if ((self = [super init])) {
		[NSBundle loadNibNamed:@"Window" owner:self];
  }
  
  return self;
}

- (void) awakeFromNib {
  [self.webview.mainFrame loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://play.google.com/music/"]]];
}

- (void)showWindow:(id)sender
{
  [self.window makeKeyAndOrderFront:self];
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

@end
