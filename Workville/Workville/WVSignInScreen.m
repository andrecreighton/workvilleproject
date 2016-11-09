//
//  WVSignInScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//


#import "WVUser.h"
#import "WVSignInScreen.h"
#import "WVTakePhotoScreen.h"
#import <Masonry/Masonry.h>

@interface WVSignInScreen () <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIView *centerView;
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;

@property (strong, nonatomic) IBOutlet UIButton *backButton;

@property (strong, nonatomic) NSString *dateString;


@end

@implementation WVSignInScreen

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    
    
        
//       [self.firstnameTextField becomeFirstResponder];
//        self.continueButton.enabled = NO;

  //  [self.backButton setTintColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1]];

    [self.backButton setTitleColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1] forState:UIControlStateNormal];
    
    self.backButton.tintColor = [UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1];
    
    
    
    
    [self setUpTextFields];

}

-(void)setUpTextFields
{
    
    self.firstnameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.lastnameTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    self.emailTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    
    
    self.firstnameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;
    self.lastnameTextField.autocapitalizationType = UITextAutocapitalizationTypeWords;

    
}



- (IBAction)whenBackButtonTapped:(id)sender {
    
    NSLog(@"RESPONDING");
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.view endEditing:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)whenContinueButtonTapped:(id)sender {
    
    NSLog(@"RESPONDING");
    
    
    NSString *firstname = self.firstnameTextField.text;
    NSString *lastname  = self.lastnameTextField.text;
    NSString *email     = self.emailTextField.text;

    // Createss the user with initial properties firstname, lastname, and email
    
    WVUser *user = [[WVUser alloc] initWithFirstname:firstname Lastname:lastname email:email];
    
    
    
    WVWelcomeScreen *welcomeScreen = [[WVWelcomeScreen alloc] initWithNibName:@"WVWelcomeScreen" bundle:nil];
    WVTakePhotoScreen *photoScreen = [[WVTakePhotoScreen alloc] initWithNibName:@"WVPhotoFrameView" bundle:nil];
    [self.navigationController pushViewController:photoScreen animated:YES];


    
    
}



-(void)validateTextFields{
    
    
    
    
    
    
    
    
    
    
}



@end
