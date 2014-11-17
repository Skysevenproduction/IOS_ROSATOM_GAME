//
//  RACompletedLevelScreenVC.h
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RACompletedLevelScreenVC : UIViewController{
    NSInteger  imgColorNumber;
    CGRect ScreenSize;
}

+(RACompletedLevelScreenVC*) showInstance:(UIViewController*) parent withColor:(NSInteger) color;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor1;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor2;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor3;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor4;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor5;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor6;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor7;
@property (weak, nonatomic) IBOutlet UIImageView *imgColor8;

@property (weak, nonatomic) IBOutlet UIImageView *titleLevel;
@end
