//
//  RAAnswerScreenVC.m
//  ROSATOM_GAME
//
//  Created by Aleksey Molokovich on 22.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RAAnswerScreenVC.h"

@interface RAAnswerScreenVC ()

@end

@implementation RAAnswerScreenVC

+(RAAnswerScreenVC*)showInstance:(UIViewController *)parent withAnswer:(BOOL) answer{
    RAAnswerScreenVC * instance=[[RAAnswerScreenVC alloc] init];
    instance->userAnswer=answer;
    [parent presentViewController:instance animated:YES completion:nil];
    return instance;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (userAnswer) {
        [self.bgAnswer setImage:[UIImage imageNamed:@"477B91-1.png"]];
        [self.iconAnswer setImage:[UIImage imageNamed:@"img_right.png"]];
        
        self.lblCommentText.text=([DATA_MGR.currentQuestion[Q_D_COMMENT] length]==0)?@"ПРАВИЛЬНО!":DATA_MGR.currentQuestion[Q_D_COMMENT];
        
    }else{
        [self.bgAnswer setImage:[UIImage imageNamed:@"3B4A5A-1.png"]];
        [self.iconAnswer setImage:[UIImage imageNamed:@"img_wrong.png"]];
        self.lblCommentText.text=([DATA_MGR.currentQuestion[Q_D_COMMENT] length]==0)?@"НЕ ПРАВИЛЬНО!":DATA_MGR.currentQuestion[Q_D_COMMENT];
    }
    
  
    
    CGRect rect=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width ,self.statusBarView.bounds.size.height);
    
    RAStatusBarView * statusBar=[[RAStatusBarView alloc] initWithFrame:rect];
    
    [self.statusBarView addSubview:statusBar];
    
    self.lblCurrentQuestion.text=statusBar.lblQuestionCount.text;
    
    self.color1.hidden=true;
    self.color2.hidden=true;
    self.color3.hidden=true;
    self.color4.hidden=true;
    self.color5.hidden=true;
    self.color6.hidden=true;
    self.color7.hidden=true;
    self.color8.hidden=true;
    
    switch (DATA_MGR.passQuestion) {
        case 1:
            if (!userAnswer) {
                self.color1.hidden=false;
            }
            break;
        case 2:
            self.color1.hidden=false;
            if (!userAnswer) {
                self.color2.hidden=false;
            }
            break;
        case 3:
            self.color1.hidden=false;
            self.color2.hidden=false;
            if (!userAnswer) {
                self.color3.hidden=false;
            }
            break;
        case 4:
            self.color1.hidden=false;
            self.color2.hidden=false;
            self.color3.hidden=false;
            if (!userAnswer) {
                self.color4.hidden=false;
            }
            break;
        case 5:
            self.color1.hidden=false;
            self.color2.hidden=false;
            self.color3.hidden=false;
            self.color4.hidden=false;
            if (!userAnswer) {
                self.color5.hidden=false;
            }
            break;
        case 6:
            self.color1.hidden=false;
            self.color2.hidden=false;
            self.color3.hidden=false;
            self.color4.hidden=false;
            self.color5.hidden=false;
            if (!userAnswer) {
                self.color6.hidden=false;
            }
            break;
        case 7:
            self.color1.hidden=false;
            self.color2.hidden=false;
            self.color3.hidden=false;
            self.color4.hidden=false;
            self.color5.hidden=false;
            self.color6.hidden=false;
            if (!userAnswer) {
                self.color7.hidden=false;
            }
            break;
        default:
            break;
    }

    

}

-(void)viewDidAppear:(BOOL)animated{
    if (userAnswer) {
        switch (DATA_MGR.passQuestion) {
            case 1:
                [self animation:self.color1];
                break;
            case 2:
                [self animation:self.color2];
                break;
            case 3:
                [self animation:self.color3];
                break;
            case 4:
                [self animation:self.color4];
                break;
            case 5:
                [self animation:self.color5];
                break;
            case 6:
                [self animation:self.color6];
                break;
            case 7:
                [self animation:self.color7];
                break;
            default:
                break;
        }
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
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
