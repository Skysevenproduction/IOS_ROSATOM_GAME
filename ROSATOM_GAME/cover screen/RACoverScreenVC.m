//
//  RACoverScreenVC.m
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 30.12.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RACoverScreenVC.h"

@interface RACoverScreenVC ()

@end

@implementation RACoverScreenVC

//+(RACoverScreenVC *) showInstance:(UIViewController*)parent{
//    RACoverScreenVC * instance=[[RACoverScreenVC alloc] init];
//    [parent presentViewController:instance animated:YES completion:nil];
//    return instance;
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)goToPlayGame:(id)sender {
    
    [RAStartGameScreenVC showInstance:self ];
    
}


@end
