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


-(instancetype)initStorageToDatabaseWithFirstname:(NSString *)firstname Lastname:(NSString *)lastname Email:(NSString *)email{
    
    self = [super init];
    
    if(self)
    {
        
        _firstname = firstname;
        _lastname = lastname;
        _email = email;
        
    }
    

    return self;
}


@end
