//
//  RALifeBeOverScreenVC.h
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 22.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RAStatusBarView.h"
#import "RADataManager.h"

@interface RALifeBeOverScreenVC : UIViewController
+(RALifeBeOverScreenVC*)showInstance:(UIViewController*)parent;

//@property(nonatomic,strong) RAStatusBarView * statusBar;
@property (weak, nonatomic) IBOutlet UIButton *btnRepeat;

@property (weak, nonatomic) IBOutlet UIView *containerStatusBarView;


@property(nonatomic,strong) RAStatusBarView * statusBar;

@end
