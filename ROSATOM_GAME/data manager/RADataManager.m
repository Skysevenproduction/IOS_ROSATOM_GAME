//
//  RADataManager.m
//  ROSATOM_GAME
//
//  Created by Admin on 19.11.14.
//  Copyright (c) 2014 AlexNikov. All rights reserved.
//

#import "RADataManager.h"

@implementation RADataManager


+(instancetype)shared {
    static RADataManager * manager;
    @synchronized(self) {
        if (!manager) {
            manager = [[RADataManager alloc] init];
        }
    }
    return manager;
}

-(NSArray*)listAnsweredQuestion{
    if (listAnsweredQuestion==nil) {
        listAnsweredQuestion=[USER_DEFAULTS objectForKey:LIST_ANSWERED_QUESTION];
    }
    return listAnsweredQuestion;
}

-(void) setListAnsweredQuestion:(NSArray *)value{
    listAnsweredQuestion=value;
    [USER_DEFAULTS setObject:value forKey:LIST_ANSWERED_QUESTION];
}

-(NSArray*)listQuestion{
    if (listQuestion==nil) {
        listQuestion=[USER_DEFAULTS objectForKey:LIST_QUESTION];
    }
    return listQuestion;
}

-(void) setListQuestion:(NSArray *)value{
    listQuestion=value;
    [USER_DEFAULTS setObject:value forKey:LIST_QUESTION];
}



-(NSMutableDictionary*) currentQuestion{
    if (currentQuestion==nil) {
        currentQuestion=[USER_DEFAULTS objectForKey:Q_CURRENT];
    }
    return currentQuestion;
}

-(void) setCurrentQuestion:(NSMutableDictionary *)value{
    currentQuestion=value;
    [USER_DEFAULTS setObject:value forKey:Q_CURRENT];
}


-(NSNumber*)currentLevel{
    if (currentLevel==nil) {
        currentLevel=[USER_DEFAULTS objectForKey:CUR_LVL];
    }
    return currentLevel;
}

-(void)setCurrentLevel:(NSNumber *)value{
    currentLevel=value;
    [USER_DEFAULTS setObject:value forKey:CUR_LVL];
    
}


-(void)update{
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
