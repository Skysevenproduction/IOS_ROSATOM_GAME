//
//  RAStatusBarView.m
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RAStatusBarView.h"

@implementation RAStatusBarView

-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        [[NSBundle mainBundle] loadNibNamed:@"RAStatusBarView" owner:self options:nil];
        
        [self addSubview:self.statusView];
        

    CGRect rect=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width ,frame.size.height);
        
        self.statusView.bounds=rect;
        self.statusView.center=CGPointMake(rect.size.width/2, rect.size.height/2);
        self.statusView.autoresizesSubviews=true;
        [self.statusView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        
        
    }
    return self;
}




@end
