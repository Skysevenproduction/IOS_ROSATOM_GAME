//
//  RAStartGameScreenVC.h
//  ROSATOM_GAME
//
//  Created by Admin on 15.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAPlayGameScreenVC.h"
#import "RAStatusBarView.h"

@interface RAStartGameScreenVC : UIViewController{
    CGRect ScreenSize;
}


+(RAStartGameScreenVC*)showInstance:(UIViewController*)parent;

@property (weak, nonatomic) IBOutlet UIImageView *bottomBGImageView;
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UIView *commInfoView;
@property (weak, nonatomic) IBOutlet UIImageView *upImgView;
@property (weak, nonatomic) IBOutlet UIImageView *topImageView;


@end
