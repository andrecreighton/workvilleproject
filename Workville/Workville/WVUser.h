//
//  WVUser.h
//  Workville
//
//  Created by Andre Creighton on 10/31/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface WVUser : NSObject

@property (strong, nonatomic) WVUser *user;
@property (strong, nonatomic) NSString *timeAndDateOfSignin;
@property (strong, nonatomic) NSString *firstname;
@property (strong, nonatomic) NSString *lastname;
@property (strong, nonatomic) NSString *email;



-(instancetype)initWithFirstname:(NSString *)firstname Lastname:(NSString *)lastname email:(NSString *)email time:(NSString *)timeAndDateOfSignin;



@end
