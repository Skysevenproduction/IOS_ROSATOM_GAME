//
//  RAMapLevelScreenVC.h
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 23.12.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RADataManager.h"

@interface RAMapLevelScreenVC : UIViewController

+(RAMapLevelScreenVC*)showInstance:(UIViewController*)parent;

@property (nonatomic,strong) UIViewController * parentVC;
@property (weak, nonatomic) IBOutlet UIImageView *imgLevel;

@end
