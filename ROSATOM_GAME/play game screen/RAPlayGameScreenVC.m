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
    listAnswerEdit=[NSMutableArray array];

    
       timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerStart) userInfo:nil repeats:NO];
    
    CGRect rect=CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width ,self.containerStatusBarView.bounds.size.height);
    
     _statusBar=[[RAStatusBarView alloc] initWithFrame:rect];
    
    [self.containerStatusBarView addSubview:_statusBar];
    
    
    //CGRect btnRect=self.bottomImage.frame;
    //self.bgImageButton.center=CGPointMake(self.bgImageButton.center.x, btnRect.origin.y);
    
    self.btnAnswerTrue.bounds=CGRectMake(self.bgImageButton.frame.origin.x, self.bgImageButton.frame.origin.y, self.bgImageButton.frame.size.height, self.bgImageButton.frame.size.height);
    self.btnAnswerFalse.bounds=CGRectMake(self.bgImageButton.frame.size.width-self.bgImageButton.frame.size.height, self.bgImageButton.frame.origin.y, self.bgImageButton.frame.size.height, self.bgImageButton.frame.size.height);

    [self.btnAnswerTrue addTarget:self action:@selector(ButtonPressedTrue:) forControlEvents:UIControlEventTouchDown];
    [self.btnAnswerTrue addTarget:self action:@selector(ButtonReleasedTrue:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.btnAnswerFalse addTarget:self action:@selector(ButtonPressedFalse:) forControlEvents:UIControlEventTouchDown];
    [self.btnAnswerFalse addTarget:self action:@selector(ButtonReleasedFalse:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    questionNumber=arc4random()% DATA_MGR.listQuestion.count;
    
    [_statusBar loadUserInfo];

    [self setupTimer];
    [self timerStart];
    [self getQuestion];
    DATA_MGR.update;
}



- (void)setupTimer{
    
    count=0;
    if (timer!=nil) {
        [timer invalidate];
        timer=nil;
    }
    
    
    timer=[NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerStart) userInfo:nil repeats:YES];
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addTimer:timer forMode:NSDefaultRunLoopMode];
    
}

-(void)timerStart{
    
    self.lblTimer.text=[NSString stringWithFormat:@"%i", count];
    
    if (count==20) {
        [self getQuestion];
        [self setupTimer];
        //[timer invalidate];
    }
    
    count += 1;
    
}
-(void)getQuestion{
    
    DATA_MGR.currentQuestion=DATA_MGR.listQuestion[questionNumber];
    
    NSArray * temp=DATA_MGR.listAnsweredQuestion;
    
    [listAnswerEdit addObject:DATA_MGR.currentQuestion];
    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"ID"  ascending:YES];
    DATA_MGR.listAnsweredQuestion=[DATA_MGR.listAnsweredQuestion sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
    listAnswerEdit = [DATA_MGR.listAnsweredQuestion copy];
    
    self.lblTextQuestion.text=DATA_MGR.currentQuestion[Q_D_TEXT];
    
}
//-(NSArray*)sortAnswer:(NSDictionary *) newQuestion{
//    NSMutableArray * listAnswerEdit=[NSMutableArray array];
//    [listAnswerEdit addObject:newQuestion];
//
//    NSArray *temp=DATA_MGR.listAnsweredQuestion;
//    
//        
//        for (int i =0;i<DATA_MGR.listAnsweredQuestion.count;i++) {
//            if ([DATA_MGR.listAnsweredQuestion[i][Q_D_ID] integerValue]>[newQuestion[Q_D_ID] integerValue]) {
//                [listAnswerEdit addObject:DATA_MGR.listAnsweredQuestion[i]];
//            }else{
//                [listAnswerEdit addObject:newQuestion];
//            }
//        }
//
// 
//
//    return listAnswerEdit;
//}

-(void)checkAnswer:(bool)answerUser{
   
    if ([DATA_MGR.currentQuestion[Q_D_ANSWER] boolValue] ==answerUser) {
        DATA_MGR.passQuestion++;
        if (DATA_MGR.passQuestion==8) {
            //уровень пройден
            [RACompletedLevelScreenVC showInstance:self];
        }else{
            //правильный ответ
            [RAAnswerScreenVC showInstance:self withAnswer:true];
        }
    }else{
        DATA_MGR.countLife--;
        if (DATA_MGR.countLife==0) {
            //жизни закончелись
            [RALifeBeOverScreenVC showInstance:self];
        }else{
            //неправильный ответ
            [RAAnswerScreenVC showInstance:self withAnswer:false];
        }
    }
}

-(IBAction)ButtonPressedTrue:(id)sender{
    [self.bgImageButton setImage:[UIImage imageNamed:@"btn_true_select.png"]];
}
    

-(IBAction)ButtonReleasedTrue:(id)sender{
    [self.bgImageButton setImage:[UIImage imageNamed:@"bgBtnTrueFalse.png"]];
}


-(IBAction)ButtonPressedFalse:(id)sender{
    [self.bgImageButton setImage:[UIImage imageNamed:@"btn_false_select.png"]];
    
}
-(IBAction)ButtonReleasedFalse:(id)sender{
    [self.bgImageButton setImage:[UIImage imageNamed:@"bgBtnTrueFalse.png"]];
}

- (IBAction)btnFalseClick:(id)sender {
    [self checkAnswer:false];
    //[RAAnswerScreenVC showInstance:self withAnswer:false];
    
}

- (IBAction)btnTrueClick:(id)sender {
    //[RAAnswerScreenVC showInstance:self withAnswer:true];
    [self checkAnswer:true];
}





@end
