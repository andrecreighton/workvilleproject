//
//  WVTakePhotoScreen.h
//  Workville
//
//  Created by Andre Creighton on 11/9/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import <UIKit/UIKit.h>

@import FirebaseStorage;

@interface WVTakePhotoScreen : UIViewController
@property (strong, nonatomic) IBOutlet UIView *conentView;

@property(strong,nonatomic)NSString *firstname;
@property(strong,nonatomic)NSString *lastname;
@property(strong,nonatomic)NSString *email;





@end
