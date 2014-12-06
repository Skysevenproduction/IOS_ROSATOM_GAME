//
//  RAPlayGameScreenVC.h
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAStatusBarView.h"
#import "RAAnswerScreenVC.h"
#import "RACompletedLevelScreenVC.h"
#import "RALifeBeOverScreenVC.h"


@interface RAPlayGameScreenVC : UIViewController
{
    UIViewController * parentVC;
    NSTimer * timer;
    int count;
    NSArray * listQuestions;
    int questionNumber;
    NSMutableArray * listAnswerEdit;

}
+(RAPlayGameScreenVC*)showInstance:(UIViewController *)parent;

@property (weak, nonatomic) IBOutlet UIView *containerStatusBarView;
@property (weak, nonatomic) IBOutlet UILabel *lblTextQuestion;

@property (weak, nonatomic) IBOutlet UIImageView *bottomImage;
@property (weak, nonatomic) IBOutlet UILabel *lblTimer;


@property (weak, nonatomic) IBOutlet UIButton *btnAnswerTrue;
@property (weak, nonatomic) IBOutlet UIButton *btnAnswerFalse;

@property (weak, nonatomic) IBOutlet UIImageView *bgImageButton;

@property(nonatomic,strong) RAStatusBarView * statusBar;


-(IBAction)ButtonPressedTrue:(id)sender;
-(IBAction)ButtonReleasedTrue:(id)sender;

-(IBAction)ButtonPressedFalse:(id)sender;
-(IBAction)ButtonReleasedFalse:(id)sender;

@end
