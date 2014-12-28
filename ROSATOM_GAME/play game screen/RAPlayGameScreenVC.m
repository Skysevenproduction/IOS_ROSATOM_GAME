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
    
    [DATA_MGR sendGAScreenName:GA_SCR_QUESTION];

    
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
    
}

-(void)timerStart{
    
    self.lblTimer.text=[NSString stringWithFormat:@"%i", count];
    
    if (count==20) {
        [self wrongAnswer];
    }
    
    count += 1;
    
}
-(void)getQuestion{
    if (DATA_MGR.listQuestion.count==1) {
        NSArray * listQuestion=[NSArray arrayWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"listQuestions" ofType:@"plist"]];
        DATA_MGR.listQuestion=listQuestion;
    }

        questionNumber=arc4random()% (DATA_MGR.listQuestion.count-1);
    
    

    DATA_MGR.currentQuestion=DATA_MGR.listQuestion[questionNumber];
    
    NSLog(@" answer=%@",DATA_MGR.currentQuestion[Q_D_ANSWER] );

    
//    
//    NSSortDescriptor *descriptor = [[NSSortDescriptor alloc] initWithKey:@"ID"  ascending:YES];
//    
//    DATA_MGR.listAnsweredQuestion=[DATA_MGR.listAnsweredQuestion sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor,nil]];
//    
//    listAnswerEdit = [DATA_MGR.listAnsweredQuestion copy];
//    
//    NSLog(@"%@",DATA_MGR.currentQuestion[Q_D_ANSWER] );
    
    self.lblTextQuestion.text=DATA_MGR.currentQuestion[Q_D_TEXT];
    
}


-(void)checkAnswer:(bool)answerUser{
    BOOL rightAnswer;
    NSString * temp=DATA_MGR.currentQuestion[Q_D_ANSWER];
    if ([DATA_MGR.currentQuestion[Q_D_ANSWER] isEqualToString:@"ПРАВДА"])
        rightAnswer=YES;
    else
        rightAnswer=NO;
    
    if (answerUser==rightAnswer)
        [self rightAnswer];
    else
        [self wrongAnswer];
    
}

-(void)rightAnswer{
    DATA_MGR.passQuestion++;
    NSMutableDictionary * spentTimeForAnswerCopy=[[NSMutableDictionary alloc] init];
    if (DATA_MGR.spentTimeForAnswer!=nil)
         spentTimeForAnswerCopy=[DATA_MGR.spentTimeForAnswer mutableCopy];
    
    [spentTimeForAnswerCopy setObject:[NSNumber numberWithInt:count] forKey:[@(questionNumber) stringValue]];
    DATA_MGR.spentTimeForAnswer=[spentTimeForAnswerCopy copy];
    
    NSMutableArray * listQuestionCopy=[DATA_MGR.listQuestion mutableCopy];
    [listQuestionCopy removeObject:DATA_MGR.currentQuestion];
    DATA_MGR.listQuestion=[listQuestionCopy copy];

        //правильный ответ
    [RAAnswerScreenVC showInstance:self withAnswer:true];
    
    
}
-(void)wrongAnswer{
        //неправильный ответ
        [RAAnswerScreenVC showInstance:self withAnswer:false];
    
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
    [self checkAnswer:NO];
    //[RAAnswerScreenVC showInstance:self withAnswer:false];
    
}

- (IBAction)btnTrueClick:(id)sender {
    //[RAAnswerScreenVC showInstance:self withAnswer:true];
    [self checkAnswer:YES];
}





@end
