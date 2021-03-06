//
//  WVDatabase.h
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <Foundation/Foundation.h>

@import FirebaseDatabase;
@interface WVDatabase : NSObject


@property (strong,nonatomic) NSString *firstname;
@property (strong,nonatomic) NSString *lastname;
@property (strong,nonatomic) NSString *email;
@property (strong,nonatomic) FIRDatabaseReference *databaseRef;



-(instancetype)init;
-(instancetype)initWithFirstName:(NSString *)firstname Lastname:(NSString *)lastname Email:(NSString *)email;
-(void)updateDatabaseInfoWithDictionary:(NSDictionary *)userDicitonary;


@end
