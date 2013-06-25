//
//  WebViewController.h
//  Google Music Helper
//
//  Created by Tobias Tangemann on 26.09.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <WebKit/WebKit.h>

@interface WebViewController : NSWindowController

@property (weak) IBOutlet WebView *webview;

- (void) tooglePlayPause;
- (void) nextSong;
- (void) previousSong;

- (BOOL) isMusicPlaying;

@end
