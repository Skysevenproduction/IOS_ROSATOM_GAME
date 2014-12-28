//
//  RAMapLevelScreenVC.m
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 23.12.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RAMapLevelScreenVC.h"

@interface RAMapLevelScreenVC ()

@end

@implementation RAMapLevelScreenVC

+(RAMapLevelScreenVC*)showInstance:(UIViewController*)parent{
    RAMapLevelScreenVC * instance=[[RAMapLevelScreenVC alloc] init];
    instance -> _parentVC=parent;
    [parent presentViewController:instance animated:YES completion:nil];
    return  instance;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    DATA_MGR.showMapLevel=false;
    
    
    NSString * imgName=([DATA_MGR.currentLevel intValue]<10)?[NSString stringWithFormat:@"img_00%@.png",[DATA_MGR.currentLevel stringValue]]:[NSString stringWithFormat:@"img_0%@.png",[DATA_MGR.currentLevel stringValue]];
    
    [self.imgLevel setImage:[UIImage imageNamed:imgName]];
    
    
        //уровень пройден
        if ([DATA_MGR.currentLevel integerValue] < 45){
            DATA_MGR.currentLevel=[NSNumber numberWithInt:([DATA_MGR.currentLevel intValue]+1) ];
        }
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [DATA_MGR sendGAEvent:@"next_level" fromScreen:@"map" withLabel:@"level" andValue:DATA_MGR.currentLevel];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [[[[self presentingViewController] presentingViewController ]presentingViewController ]dismissViewControllerAnimated:YES completion:nil];
    }


@end
