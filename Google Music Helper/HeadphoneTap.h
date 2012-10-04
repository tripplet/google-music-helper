//
//  HeadphoneTap.h
//  Google Music Helper
//
//  Created by Tangemann Tobias on 21.06.12.
//  Copyright (c) 2012 Wincor. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <DDHidLib/DDHidLib.h>



@interface HeadphoneTap : NSObject

@property (nonatomic, strong) id delegate;
@property (nonatomic, strong) DDHidDevice* headphone;


-(id)initWithDelegate:(id)delegate;

@end



@interface NSObject (HeadphoneDelegate)
-(void)buttonPressed:(HeadphoneTap*)sender;
@end