//
//  RAPlayGameScreenVC.h
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAStatusBarView.h"


@interface RAPlayGameScreenVC : UIViewController
{
    UIViewController * parentVC;
}
+(RAPlayGameScreenVC*)showInstance:(UIViewController *)parent;

@property (weak, nonatomic) IBOutlet UIView *containerStatusBarView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;


@property (weak, nonatomic) IBOutlet UIButton *btnAnswerTrue;
@property (weak, nonatomic) IBOutlet UIButton *btnAnswerFalse;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageButton;

@end
