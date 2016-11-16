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
    [self.logoImageView setTintColor:[UIColor whiteColor]];

    
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor colorWithRed:55./255.0 green:230./255.0 blue:223./255.0 alpha:1] CGColor],(id)[[UIColor colorWithRed: 2./255.0 green:133./255.0 blue:128./255.0 alpha:1] CGColor],  nil];
    [gradient setStartPoint:CGPointMake(1, 0)];
    [gradient setEndPoint:CGPointMake(0, 1)];
    
    [self.view.layer insertSublayer:gradient atIndex:0];

    
}


- (IBAction)backToLaunchButton:(id)sender {


    [self.navigationController popToRootViewControllerAnimated:YES];
    



}




@end
