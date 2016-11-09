//
//  WVLaunchScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVLaunchScreen.h"
#import "WVSignInScreen.h"

@interface WVLaunchScreen ()

@property (strong, nonatomic) WVSignInScreen *signInViewController;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UILabel *welcomeLabel;
@property (strong, nonatomic) IBOutlet UIButton *signinButton;

@end

@implementation WVLaunchScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.welcomeLabel.text = @"Workville";
   // self.signinButton.layer.cornerRadius = self.signinButton.bounds.size.height/4;
   
    

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
