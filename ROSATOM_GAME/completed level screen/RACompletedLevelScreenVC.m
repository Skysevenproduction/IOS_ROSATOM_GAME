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


+(RACompletedLevelScreenVC*) showInstance:(UIViewController*) parent withColor:(NSInteger) color
{
    RACompletedLevelScreenVC * instance = [[RACompletedLevelScreenVC alloc] init];
    instance -> imgColorNumber=color;
    instance -> _parentVC=parent;
    [parent presentViewController:instance animated:YES completion:nil];

    return  instance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    RAStatusBarView * statusBar=[[RAStatusBarView alloc] initWithFrame:self.containerStatusBarView.bounds];
    
    [self.containerStatusBarView addSubview:statusBar];
    
    statusBar.lblLevelCount=
    
    // Do any additional setup after loading the view.
//    ScreenSize=[[UIScreen mainScreen] bounds];
//    CGPoint test=self.titleLevel.center=CGPointMake(CGRectGetMidX(ScreenSize), CGRectGetMidY(ScreenSize));
//    self.titleLevel.center=CGPointMake(CGRectGetMidX(ScreenSize), CGRectGetMidY(ScreenSize));
   
    
    self.imgColor1.hidden=true;
    self.imgColor2.hidden=true;
    self.imgColor3.hidden=true;
    self.imgColor4.hidden=true;
    self.imgColor5.hidden=true;
    self.imgColor6.hidden=true;
    self.imgColor7.hidden=true;
    self.imgColor8.hidden=true;
    
    switch (imgColorNumber) {
        case 1:
            break;
        case 2:
            self.imgColor1.hidden=false;
            break;
        case 3:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            break;
        case 4:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            self.imgColor3.hidden=false;
            break;
        case 5:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            self.imgColor3.hidden=false;
            self.imgColor4.hidden=false;
            break;
        case 6:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            self.imgColor3.hidden=false;
            self.imgColor4.hidden=false;
            self.imgColor5.hidden=false;
            break;
        case 7:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            self.imgColor3.hidden=false;
            self.imgColor4.hidden=false;
            self.imgColor5.hidden=false;
            self.imgColor6.hidden=false;
            break;
        case 8:
            self.imgColor1.hidden=false;
            self.imgColor2.hidden=false;
            self.imgColor3.hidden=false;
            self.imgColor4.hidden=false;
            self.imgColor5.hidden=false;
            self.imgColor6.hidden=false;
            self.imgColor7.hidden=false;
            break;
        default:
            break;
    }

    
}
-(void)viewDidAppear:(BOOL)animated{
    switch (imgColorNumber) {
        case 1:
            [self animation:self.imgColor1];
            break;
        case 2:
            [self animation:self.imgColor2];
            break;
        case 3:
            [self animation:self.imgColor3];
            break;
        case 4:
            [self animation:self.imgColor4];
            break;
        case 5:
            [self animation:self.imgColor5];
            break;
        case 6:
            [self animation:self.imgColor6];
            break;
        case 7:
            [self animation:self.imgColor7];
            break;
        case 8:
            [self animation:self.imgColor8];
            break;
        default:
            break;
    }
}

-(void)animation:(UIImageView*)imageView{
    imageView.alpha=0;
    imageView.hidden=false;
    [UIView animateWithDuration:0.5 animations:^(void) {
        imageView.alpha = 0;
        imageView.alpha = 1;
    }];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [_parentVC dismissViewControllerAnimated:YES completion:nil ];
}

@end
