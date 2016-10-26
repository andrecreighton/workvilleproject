//
//  WVSignInScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVSignInScreen.h"

@interface WVSignInScreen () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>


@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (strong, nonatomic) UIImagePickerController *picker;



@end

@implementation WVSignInScreen

- (void)viewDidLoad {
    [super viewDidLoad];
   
        
//       [self.firstnameTextField becomeFirstResponder];
//        self.continueButton.enabled = NO;

    



}



- (IBAction)whenBackButtonTapped:(id)sender {
    
    NSLog(@"back button tapped");
    
    [self.view endEditing:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


- (IBAction)whenContinueButtonTapped:(id)sender {
    
    NSLog(@"continue button tapped");
    
    [self setUpImageProcess];
    
    
    
}


-(void)setUpImageProcess
{
    
    _picker = [[UIImagePickerController alloc] init];
    _picker.delegate = self;
    _picker.allowsEditing = YES;
    _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    _picker.showsCameraControls = YES;
    
    [self presentViewController:_picker animated:YES completion:NULL];
    

    
}






@end
