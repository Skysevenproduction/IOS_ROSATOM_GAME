//
//  RAStatusBarView.h
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RAStatusBarView : UIView



@property (strong, nonatomic) IBOutlet UIView *statusView;

@property (weak, nonatomic) IBOutlet UILabel *lblQuestionCount;
@property (weak, nonatomic) IBOutlet UILabel *lblLifeCount;
@property (weak, nonatomic) IBOutlet UILabel *lblLevelCount;



@end
