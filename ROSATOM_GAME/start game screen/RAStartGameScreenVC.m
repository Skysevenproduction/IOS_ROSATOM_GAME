//
//  RAStartGameScreenVC.m
//  ROSATOM_GAME
//
//  Created by Admin on 15.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RAStartGameScreenVC.h"

@interface RAStartGameScreenVC ()

@end

@implementation RAStartGameScreenVC

+(RAStartGameScreenVC*)showInstance:(UIViewController *)parent{
    RAStartGameScreenVC * instance=[[RAStartGameScreenVC alloc] init];
    [parent presentViewController:instance animated:NO completion:nil];
    return instance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    ScreenSize=self.view.frame;
    
    
}



-(void)viewDidAppear:(BOOL)animated
{
    CGRect rect=self.bottomBGImageView.frame;
    self.btnStart.center=CGPointMake(self.btnStart.center.x,rect.origin.y);
    self.commInfoView.center=self.view.center;
   
}
- (IBAction)btnStartGame:(id)sender {
    //self.parentViewController
    [RAPlayGameScreenVC showInstance:self];
    
}


@end
