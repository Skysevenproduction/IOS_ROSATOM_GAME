//
//  RADataManager.h
//  ROSATOM_GAME
//
//  Created by Admin on 19.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <Foundation/Foundation.h>

#define USER_DEFAULTS [NSUserDefaults standardUserDefaults]
#define DATA_MGR [RADataManager shared]

#define LIST_QUESTION           @"listQuestion"
#define LIST_ANSWERED_QUESTION  @"listAnsweredQuestion"

#define Q_CURRENT   @"currentQuestion"
#define Q_PASS      @"passQuestion"
#define Q_TIME      @"timeQuestion"
#define Q_COUNT_PASS @"countPassQuestion"
#define LIFE_COUNT   @"countLife"

#define Q_D_TEXT      @"QUESTION"
#define Q_D_ANSWER    @"ANSWER"
#define Q_D_COMMENT   @"COMMENT"
#define Q_D_ID        @"ID"

#define CUR_LVL   @"currentLevel"



@interface RADataManager : NSObject{
    
    NSArray * listQuestion;
    NSArray * listAnsweredQuestion;
    
    NSNumber * currentLevel;
    NSMutableDictionary * currentQuestion;
    
}
@property (nonatomic,strong) NSArray * listQuestion;
@property (nonatomic,strong) NSArray * listAnsweredQuestion;

@property (nonatomic,assign) NSNumber * currentLevel;
@property (nonatomic,assign) NSInteger passQuestion;
@property (nonatomic,assign) NSInteger countLife;
@property (nonatomic,strong) NSMutableDictionary * currentQuestion;


+(instancetype)shared;
-(void)update;
@end
