//
//  RALifeBeOverScreenVC.m
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 22.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RALifeBeOverScreenVC.h"

@interface RALifeBeOverScreenVC ()

@end

@implementation RALifeBeOverScreenVC


+(RALifeBeOverScreenVC*)showInstance:(UIViewController*)parent{
    RALifeBeOverScreenVC * instace=[[RALifeBeOverScreenVC alloc]init];
    [parent presentViewController:instace animated:YES completion:nil];
    return  instace;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    CGRect rect=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width ,self.containerStatusBarView.bounds.size.height);
    
    _statusBar=[[RAStatusBarView alloc] initWithFrame:rect];
    
    [self.containerStatusBarView addSubview:_statusBar];
    DATA_MGR.passQuestion=0;
    DATA_MGR.countLife=3;
    

}

- (IBAction)btnRepeatClick:(id)sender {
    [[[self presentingViewController ]presentingViewController ]dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[[self presentingViewController ]presentingViewController ]dismissViewControllerAnimated:YES completion:nil];
}

@end
