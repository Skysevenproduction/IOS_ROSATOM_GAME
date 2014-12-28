//
//  RAAnswerScreenVC.h
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 22.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAStatusBarView.h"
#import "RADataManager.h"
#import "RACompletedLevelScreenVC.h"
#import "RALifeBeOverScreenVC.h"

@interface RAAnswerScreenVC : UIViewController{
    BOOL userAnswer;
}

+(RAAnswerScreenVC*)showInstance:(UIViewController *)parent withAnswer:(BOOL) answer;

@property (weak, nonatomic) IBOutlet UIView *statusBarView;
@property (weak, nonatomic) IBOutlet UIImageView *bgAnswer;
@property (weak, nonatomic) IBOutlet UIImageView *iconAnswer;
@property (weak, nonatomic) IBOutlet UILabel *lblCurrentQuestion;

@property (weak, nonatomic) IBOutlet UIImageView *color1;
@property (weak, nonatomic) IBOutlet UIImageView *color2;
@property (weak, nonatomic) IBOutlet UIImageView *color3;
@property (weak, nonatomic) IBOutlet UIImageView *color4;
@property (weak, nonatomic) IBOutlet UIImageView *color5;
@property (weak, nonatomic) IBOutlet UIImageView *color6;
@property (weak, nonatomic) IBOutlet UIImageView *color7;
@property (weak, nonatomic) IBOutlet UIImageView *color8;

@property (weak, nonatomic) IBOutlet UILabel *lblCommentText;
@property (weak, nonatomic) IBOutlet UIImageView *titleAnswerImg;

@end
