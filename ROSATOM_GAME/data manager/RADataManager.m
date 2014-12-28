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
    if (currentLevel==nil)
        currentLevel=[USER_DEFAULTS objectForKey:CUR_LVL];
    
    return currentLevel;
}

-(void)setCurrentLevel:(NSNumber *)value{
    currentLevel=value;
    [USER_DEFAULTS setObject:value forKey:CUR_LVL];
    
}

-(NSDictionary *) spentTimeForAnswer{
    if (spentTimeForAnswer==nil)
        spentTimeForAnswer=[USER_DEFAULTS objectForKey:USR_TIME_ANSWR];
    
    if (spentTimeForAnswer==nil)
        self.spentTimeForAnswer=@{};
    
    return spentTimeForAnswer;
}

-(void)setSpentTimeForAnswer:(NSDictionary *)value{
    spentTimeForAnswer=value;
    [USER_DEFAULTS setObject:value forKey:USR_TIME_ANSWR];
}


-(void)update{
    [[NSUserDefaults standardUserDefaults] synchronize];
}
#pragma mark -
#pragma mark GoogleAnalytic Methods

-(void)sendGAScreenName:(NSString*)name{
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName
           value:name];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}

-(void)sendGAEvent:(NSString*)action fromScreen:(NSString*)screen withLabel:(NSString*)label andValue:(NSNumber *)value{
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker send:[[GAIDictionaryBuilder createEventWithCategory:screen             // Event category (required)
                                                          action:action             // Event action (required)
                                                           label:label              // Event label
                                                           value:value] build]];    // Event value
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
}
@end
