//
//  WVDataStore.h
//  Workville
//
//  Created by Andre Creighton on 10/31/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WVDatabase.h"
#import "WVUser.h"

@interface WVDataStore : NSObject

@property (strong, nonatomic) NSMutableArray *arrayOfUsers;
@property (nonatomic,assign) WVUser *user;


+(instancetype)sharedDataStore;
-(void)storeUsersInDatabaseFromUserInfo:(NSDictionary *)user;


@end
