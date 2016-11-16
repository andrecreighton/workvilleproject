//
//  WVSignInScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//


#import "AppConstant.h"
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

    
    UIColor *buttonColorOne = CONTINUEBUTTONCOLOR1;
    UIColor *buttonColorTwo = CONTINUEBUTTONCOLOR2;
    
    UIView *view = [[UIView alloc] initWithFrame:self.continueButton.bounds];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[buttonColorTwo CGColor],(id)[buttonColorOne CGColor],  nil];
    [gradient setStartPoint:CGPointMake(.3, 0)];
    [gradient setEndPoint:CGPointMake(0, .3)];
    
    [self.continueButton.layer insertSublayer:gradient atIndex:0];

    

    [self.backButton setTitleColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1] forState:UIControlStateNormal];
    
    self.backButton.tintColor = [UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1];
    self.continueButton.layer.cornerRadius = self.continueButton.bounds.size.height/10;
    
    
    
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
    
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    [self.view endEditing:YES];
    //[self dismissViewControllerAnimated:YES completion:nil];
    
}


- (IBAction)whenContinueButtonTapped:(id)sender {
    
    self.firstname = self.firstnameTextField.text;
    self.lastname  = self.lastnameTextField.text;
    self.email     = self.emailTextField.text;

    
    WVTakePhotoScreen *photoScreen = [[WVTakePhotoScreen alloc] initWithNibName:@"WVPhotoFrameView" bundle:nil];
    photoScreen.firstname = self.firstname;
    photoScreen.lastname = self.lastname;
    photoScreen.email = self.email;
    
    [self.navigationController pushViewController:photoScreen animated:YES];
    
}



-(void)validateTextFields{
    
    
    
    
    
    
    
    
    
    
}



@end
