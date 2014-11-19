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



-(NSNumber*)currentLevel{
    if (currentLevel==nil) {
        [USER_DEFAULTS objectForKey:CUR_LVL];
    }
    return currentLevel;
}

-(void)setCurrentLevel:(NSNumber *)value{
    currentLevel=value;
    [USER_DEFAULTS setObject:value forKey:CUR_LVL];
    
}

-(NSArray*)passQuestion{
    if (passQuestion==nil) {
        [USER_DEFAULTS objectForKey:Q_PASS];
    }
    return passQuestion;
}

-(void)setPassQuestion:(NSArray *)value{
    passQuestion=value;
    [USER_DEFAULTS setObject:value forKey:Q_PASS];
}


-(NSArray*)timeQuestion{
    if (timeQuestion==nil) {
        [USER_DEFAULTS objectForKey:Q_TIME];
    }
    return timeQuestion;
}

-(void)setTimeQuestion:(NSArray *)value{
    timeQuestion=value;
    [USER_DEFAULTS setObject:value forKey:Q_TIME];
}

@end
