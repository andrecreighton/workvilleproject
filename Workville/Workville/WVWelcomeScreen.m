//
//  WVWelcomeScreenViewController.m
//  Workville
//
//  Created by Andre Creighton on 10/31/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVWelcomeScreen.h"
#import "WVLaunchScreen.h"

@interface WVWelcomeScreen ()

@property (nonatomic,strong) WVLaunchScreen *launchScreen;

@end

@implementation WVWelcomeScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.launchScreen = [[WVLaunchScreen alloc] initWithNibName:@"WVLaunchScreen" bundle:nil];
    
    
}


- (IBAction)backToLaunchButton:(id)sender {


    [self presentViewController:self.launchScreen animated:YES completion:nil];



}




@end
