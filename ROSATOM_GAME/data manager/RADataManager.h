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


#define Q_PASS @"passQuestion"
#define Q_TIME @"timeQuestion"
#define Q_COUNT_PASS @"countPassQuestion"
#define LIFE_COUNT   @"countLife"

#define CUR_LVL   @"currentLevel"



@interface RADataManager : NSObject{
    
    NSNumber * currentLevel;
    NSArray  * passQuestion;
    NSArray  * timeQuestion;
    NSNumber * countLife;
    
}

@property (nonatomic,strong) NSNumber * currentLevel;
@property (nonatomic,strong) NSArray  * passQuestion;
@property (nonatomic,strong) NSArray  * timeQuestion;
@property (nonatomic,strong) NSNumber * countLife;


+(instancetype)shared;
@end
