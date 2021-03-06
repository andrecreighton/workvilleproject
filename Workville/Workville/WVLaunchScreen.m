//
//  WVLaunchScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVLaunchScreen.h"
#import "WVSignInScreen.h"
#import "AppConstant.h"

@interface WVLaunchScreen ()

@property (strong, nonatomic) WVSignInScreen *signInViewController;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UIButton *signinButton;

@end

@implementation WVLaunchScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIColor *buttonColorOne = CONTINUEBUTTONCOLOR1;
    UIColor *buttonColorTwo = CONTINUEBUTTONCOLOR2;
    
    UIView *view = [[UIView alloc] initWithFrame:self.signinButton.bounds];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[buttonColorTwo CGColor],(id)[buttonColorOne CGColor],  nil];
    [gradient setStartPoint:CGPointMake(.3, 0)];
    [gradient setEndPoint:CGPointMake(0, .3)];
    
    [self.signinButton.layer insertSublayer:gradient atIndex:0];
    
    
    self.welcomeLabel.text = @"Workville";
    self.signinButton.layer.cornerRadius = self.signinButton.bounds.size.height/10;
   
    

}
- (IBAction)whenSignInButtonTapped:(id)sender {
    
    
    
    NSLog(@"when sign in button tapped");
    self.signInViewController = [[WVSignInScreen alloc]initWithNibName:@"WVSignInScreen" bundle:nil];
    //[self presentViewController:self.signInViewController animated:YES completion:nil];
    
    [self.navigationController pushViewController:self.signInViewController animated:YES];
    
  //  [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
