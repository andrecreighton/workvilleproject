//
//  WVSignInScreen.h
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WVWelcomeScreen.h"

@interface WVSignInScreen : UIViewController

@property(strong,nonatomic)NSString *firstname;
@property(strong,nonatomic)NSString *lastname;
@property(strong,nonatomic)NSString *email;

@end
