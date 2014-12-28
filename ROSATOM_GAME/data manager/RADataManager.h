//
//  RADataManager.h
//  ROSATOM_GAME
//
//  Created by Admin on 19.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GAIDictionaryBuilder.h"
#import "GAIFields.h"
#import "GAI.h"

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

#define USR_TIME_ANSWR  @"userTimeAnswer"
#define CUR_LVL   @"currentLevel"


#define GA_SCR_ANSWER_RIGHT  @"answer_screen_right"
#define GA_SCR_ANSWER_WRONG  @"answer_screen_wrong"

#define GA_SCR_QUESTION     @"question_screen"



@interface RADataManager : NSObject{
    
    NSArray * listQuestion;
    NSArray * listAnsweredQuestion;
    
    NSNumber * currentLevel;
    NSMutableDictionary * currentQuestion;
    NSDictionary    *   spentTimeForAnswer;
    
    BOOL    * showMapLevel;
    
}
@property (nonatomic,strong) NSArray * listQuestion;
@property (nonatomic,strong) NSArray * listAnsweredQuestion;
@property (nonatomic,strong) NSDictionary    *   spentTimeForAnswer;


@property (nonatomic,assign) NSNumber * currentLevel;
@property (nonatomic,assign) NSInteger passQuestion;
@property (nonatomic,assign) NSInteger countLife;
@property (nonatomic,strong) NSMutableDictionary * currentQuestion;

@property (nonatomic, readwrite)   BOOL   showMapLevel;


+(instancetype)shared;
-(void)update;

#pragma mark -
#pragma mark GoogleAnalytic Methods

-(void)sendGAScreenName:(NSString*)name;
-(void)sendGAEvent:(NSString*)action fromScreen:(NSString*)screen withLabel:(NSString*)label andValue:(NSNumber *)value;
@end
