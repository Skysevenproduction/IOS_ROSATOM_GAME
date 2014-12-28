//
//  RACompletedLevelScreenVC.h
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAStatusBarView.h"
#import "RADataManager.h"
#import "RAMapLevelScreenVC.h"

@interface RACompletedLevelScreenVC : UIViewController{
    NSInteger  imgColorNumber;
    CGRect ScreenSize;
}

+(RACompletedLevelScreenVC*) showInstance:(UIViewController*) parent;


@property (weak, nonatomic) IBOutlet UIImageView *titleLevel;


@property (weak, nonatomic) IBOutlet UIView *containerStatusBarView;
@property (nonatomic,strong) UIViewController * parentVC;
@end
