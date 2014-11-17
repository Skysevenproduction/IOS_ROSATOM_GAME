//
//  RAPlayGameScreenVC.m
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RAPlayGameScreenVC.h"

@interface RAPlayGameScreenVC ()

@end

@implementation RAPlayGameScreenVC

+(RAPlayGameScreenVC*)showInstance:(UIViewController *)parent
{
    RAPlayGameScreenVC * instance = [[RAPlayGameScreenVC alloc] init];

    [parent presentViewController:instance animated:YES completion:nil];
    return instance;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect rect=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width ,self.containerStatusBarView.bounds.size.height);
    
    RAStatusBarView * statusBar=[[RAStatusBarView alloc] initWithFrame:rect];
    
    [self.containerStatusBarView addSubview:statusBar];
    
    statusBar.lblLevelCount.text=@"3";
    
    
    CGRect btnRect=self.bottomImage.frame;
    //self.bgImageButton.center=CGPointMake(self.bgImageButton.center.x, btnRect.origin.y);
    
    self.btnAnswerTrue.bounds=CGRectMake(self.bgImageButton.frame.origin.x, self.bgImageButton.frame.origin.y, self.bgImageButton.frame.size.height, self.bgImageButton.frame.size.height);
    self.btnAnswerFalse.bounds=CGRectMake(self.bgImageButton.frame.size.width-self.bgImageButton.frame.size.height, self.bgImageButton.frame.origin.y, self.bgImageButton.frame.size.height, self.bgImageButton.frame.size.height);

    
    
    
}

-(void)viewDidAppear:(BOOL)animated
{

}






@end
