//
//  HeadphoneTap.m
//  Google Music Helper
//
//  Created by Tangemann Tobias on 21.06.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import "HeadphoneTap.h"

@interface HeadphoneTap()
@end

@implementation HeadphoneTap

@synthesize delegate = _delegate;
@synthesize headphone = _headphone;

NSArray *mElements;
DDHidQueue *mQueue;
NSMutableArray * mEventHistory;


-(id)initWithDelegate:(id)delegate
{
  self.delegate = delegate;
  [self startWatching];
  
  return self;
}

-(void)startWatching
{
  NSArray *devices = [DDHidDevice allDevices];
  
  //Only return "Apple Mikey HID Driver", if noxt found, return nil.
  for (DDHidDevice *device in devices) {
    if ([[device productName] isEqualToString:@"Apple Mikey HID Driver"]) {
      self.headphone = device;
      break;
    }
  }
  
  [self.headphone open];
  mQueue = [self.headphone createQueueWithSize:30];
  [mQueue setDelegate: self];
  [mQueue addElements: mElements];
  [mQueue startOnCurrentRunLoop];
  NSLog(@"startWatching");
}

-(void)stopWatching
{
  [mQueue stop];
  [self.headphone close];
}

- (void)ddhidQueueHasEvents: (DDHidQueue *) hidQueue;
{
  NSLog(@"asdja");
  DDHidEvent* event;
  while ((event = [hidQueue nextEvent]))
  {
    DDHidElement *element = [self.headphone elementForCookie: [event elementCookie]];
    unsigned usageId = [[element usage] usageId];
    SInt32 value = [event value];
    if (value == 1) {
      NSLog(@"asdad");
    }
  }
}

@end
