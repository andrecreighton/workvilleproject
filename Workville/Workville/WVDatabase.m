//
//  WVDatabase.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVDatabase.h"
@import FirebaseDatabase;
@implementation WVDatabase



-(instancetype)init{
    
    
    self = [super init];
    
    if(self)
    {
        
        if(!_databaseRef)
        {
            
            _databaseRef = [[FIRDatabase database] reference];
            
        }
        
    }
    
    
    return self;
    
    
}

-(instancetype)initWithFirstName:(NSString *)firstname Lastname:(NSString *)lastname Email:(NSString *)email{
    
    
    self = [super init];
    
    

    if(self){
    
        
        _firstname = firstname;
        _lastname = lastname;
        _email = email;
    
        
    }
    
    return self;
}


-(void)updateDatabaseInfoWithDictionary:(NSDictionary *)userDictionary{
    

    
    if([self.databaseRef child:@"users"])
    {
        NSLog(@"it already exists");
        
        
        FIRDatabaseReference *userReference = [self.databaseRef child:@"users"];
        [[userReference childByAutoId] setValue:userDictionary];
        
        
    }
    else{
        [[self.databaseRef child:@"users"] setValue:userDictionary];
    }
}


@end
