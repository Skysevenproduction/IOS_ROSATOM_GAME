//
//  RACompletedLevelScreenVC.m
//  ROSATOM_GAME
//
//  Created by Admin on 16.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RACompletedLevelScreenVC.h"

@interface RACompletedLevelScreenVC ()

@end

@implementation RACompletedLevelScreenVC


+(RACompletedLevelScreenVC*) showInstance:(UIViewController*) parent
{
    RACompletedLevelScreenVC * instance = [[RACompletedLevelScreenVC alloc] init];
    instance -> _parentVC=parent;
    [parent presentViewController:instance animated:YES completion:nil];

    return  instance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    RAStatusBarView * statusBar=[[RAStatusBarView alloc] initWithFrame:self.containerStatusBarView.bounds];
    
    [self.containerStatusBarView addSubview:statusBar];

    DATA_MGR.passQuestion=0;
    
    if ([DATA_MGR.currentLevel integerValue] < 45){
        DATA_MGR.currentLevel=[NSNumber numberWithInt:([DATA_MGR.currentLevel intValue]+1) ];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_parentVC dismissViewControllerAnimated:YES completion:nil ];
}

@end
