//
//  WVUser.m
//  Workville
//
//  Created by Andre Creighton on 10/31/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVUser.h"
#import "WVDataStore.h"
#import "WVDatabase.h"

@implementation WVUser

-(instancetype)initWithFirstname:(NSString *)firstname Lastname:(NSString *)lastname email:(NSString *)email{
    
    
    self = [super init];
    
    if(self){
        
        _firstname = firstname;
        _lastname  = lastname;
        _email     = email;
        _user      = [[WVUser alloc]init];
        
        [self addUserToArray];
      
    }
    
    return self;
}


-(void)addUserToArray{
    
    NSDictionary *userDictionary = @{@"firstname" : self.firstname,
                                     @"lastname"  : self.lastname,
                                     @"email"     : self.email};
    
    
    
    WVDatabase *database = [[WVDatabase alloc] init];
    
    [database updateDatabaseInfoWithDictionary:userDictionary];
    
   // WVDataStore *datastore = [WVDataStore sharedDataStore];
   // [datastore storeUsersInDatabaseFromUserInfo:userDictionary];

}


@end
