//
//  WVDataStore.m
//  Workville
//
//  Created by Andre Creighton on 10/31/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVDataStore.h"

@interface WVDataStore ()


@end


@implementation WVDataStore

+(instancetype)sharedDataStore
{
    static WVDataStore *_sharedDataStore = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedDataStore = [[WVDataStore alloc] init];
    });
    
    return _sharedDataStore;
    
    
}

-(instancetype)init{
    
    self = [super init];
    
    if(self){
        
        _arrayOfUsers = [NSMutableArray new];
        
    }
    
    return self;
}


-(void)storeUsersInDatabaseFromUserInfo:(NSDictionary *)user{
    

    [self.arrayOfUsers addObject:user];
    WVDatabase *database = [[WVDatabase alloc]init];
    
    [database updateDatabaseInfoWithArray:self.arrayOfUsers];
    
    

}




@end
