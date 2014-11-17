//
//  RARootVC.m
//  ROSATOM_GAME
//
//  Created by Admin on 15.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RARootVC.h"


@interface RARootVC ()

@end

@implementation RARootVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    RAStatusBarView * stausBAr=[[RAStatusBarView alloc] init];
    [self.view addSubview:stausBAr];
}

-(void)viewDidAppear:(BOOL)animated
{
    [RACompletedLevelScreenVC showInstance:self withColor:4];
    
    
       
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
