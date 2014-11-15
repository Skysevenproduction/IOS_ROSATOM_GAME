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
    ScreenSize=self.view.frame;
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)viewDidAppear:(BOOL)animated
{
    CGRect rect=self.bottomBGImageView.frame;
    self.btnStart.center=CGPointMake(self.btnStart.center.x,rect.origin.y);
    self.commInfoView.center=self.view.center;
    
    
}
- (IBAction)btnStartGame:(id)sender {
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
