//
//  AppDelegate.m
//  Google Music Helper
//
//  Created by Tangemann Tobias on 19.04.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import "AppDelegate.h"
#import "WebViewController.h"
//#import "HeadphoneTap.h"

@interface AppDelegate()
@property (nonatomic, strong) WebViewController* googemusicplayer;
@end

@implementation AppDelegate

SPMediaKeyTap *mediaKeyListener;
//HeadphoneTap *headphoneListener;

@synthesize window;
@synthesize googemusicplayer = _googemusicplayer;

- (void)awakeFromNib
{
  // create Mediakey Listener
  mediaKeyListener = [[SPMediaKeyTap alloc] initWithDelegate:self];
  [mediaKeyListener startWatchingMediaKeys];          
  
  //headphoneListener = [[HeadphoneTap alloc] initWithDelegate:self];
  
  statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
  
  [statusItem setImage:[NSImage imageNamed:@"statusIcon"]];
  [statusItem setMenu:statusMenu];
  [statusItem setToolTip:@"Google Music Helper"];
  [statusItem setHighlightMode:YES];
}

-(void)applicationWillTerminate:(NSNotification *)notification
{
  [mediaKeyListener startWatchingMediaKeys];
}

-(void)mediaKeyTap:(SPMediaKeyTap*)keyTap receivedMediaKeyEvent:(NSEvent*)event;
{
	assert([event type] == NSSystemDefined && [event subtype] == SPSystemDefinedEventMediaKeys);

	int keyCode = (([event data1] & 0xFFFF0000) >> 16);
	int keyFlags = ([event data1] & 0x0000FFFF);
	int keyState = (((keyFlags & 0xFF00) >> 8)) == 0xA;
	//int keyRepeat = (keyFlags & 0x1);

	if (keyState == 1 && self != NULL) {
		switch (keyCode) {

			case NX_KEYTYPE_PLAY:
        [self playPause:nil];
        return;

			case NX_KEYTYPE_FAST:
        [self nextSong:nil];
        return;

			case NX_KEYTYPE_REWIND:
        [self previousSong:nil];
        return;
		}
	}
}

- (IBAction)playPause:(id)sender
{
  [self.googemusicplayer tooglePlayPause];
}

- (IBAction)nextSong:(id)sender
{
  [self.googemusicplayer nextSong];
}

- (IBAction)previousSong:(id)sender
{
  [self.googemusicplayer previousSong];
}

- (WebViewController*) googemusicplayer
{
  if (!_googemusicplayer) {
    _googemusicplayer = [[WebViewController alloc] init];
  }
  
  return _googemusicplayer;
}


- (IBAction)showWebView:(NSMenuItem *)sender {
  [self.googemusicplayer showWindow:self];
}

@end
