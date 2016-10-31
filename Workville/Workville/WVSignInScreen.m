//
//  WVSignInScreen.m
//  Workville
//
//  Created by Andre Creighton on 10/24/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//


#import "WVUser.h"
#import "WVDataStore.h"
#import "WVSignInScreen.h"
#import <Masonry/Masonry.h>

@interface WVSignInScreen () <UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIView *centerView;
@property (strong, nonatomic) IBOutlet UIView *photoFrameContentView;


@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (strong, nonatomic) IBOutlet UITextField *firstnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastnameTextField;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UIButton *continueButton;
@property (strong, nonatomic) IBOutlet UIImageView *photoImageView;
@property (strong, nonatomic) UIImagePickerController *picker;
@property (strong, nonatomic) WVDataStore* datastore;


@end

@implementation WVSignInScreen

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.datastore = [WVDataStore sharedDataStore];
    
        
//       [self.firstnameTextField becomeFirstResponder];
//        self.continueButton.enabled = NO;

    self.photoImageView.layer.cornerRadius = self.photoImageView.bounds.size.width/2;

    
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
    
    NSLog(@"back button tapped");
    
    [self.view endEditing:YES];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}


- (IBAction)whenContinueButtonTapped:(id)sender {
    
    
    
    NSString *firstname = self.firstnameTextField.text;
    NSString *lastname  = self.lastnameTextField.text;
    NSString *email     = self.emailTextField.text;
    
    
  //  WVDatabase *database = [[WVDatabase alloc]init];
  //  [database initWithFirstName:firstname Lastname:lastname Email:email];
    
    
    WVUser *user = [[WVUser alloc] initWithFirstname:firstname Lastname:lastname email:email];
    
    
    
    
//    [self setUpImageProcess];
    
    
    
}


-(void)setUpImageProcess
{
    
    _picker = [[UIImagePickerController alloc] init];
    _picker.delegate = self;
    _picker.allowsEditing = YES;
    _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
    _picker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    _picker.showsCameraControls = YES;
    
  /*
    NSArray *nibContents = [[NSBundle mainBundle] loadNibNamed:@"WVPhotoFrameView"
                                                         owner:nil
                                                       options:nil];
    
    UIView *photoFrame = [nibContents firstObject];
    photoFrame.frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _picker.cameraOverlayView = photoFrame;
   
    */

    [self presentViewController:_picker animated:YES completion:nil];
   

    
}

-(void)validateTextFields{
    
    
    
    
    
    
    
    
    
    
}





@end
