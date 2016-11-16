//
//  WVTakePhotoScreen.m
//  Workville
//
//  Created by Andre Creighton on 11/9/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//


#import "WVUser.h"
#import "WVImageUpload.h"
#import "WVTakePhotoScreen.h"
#import "WVWelcomeScreen.h"
#import "AppConstant.h"
#import "WVSignInScreen.h"
@import AVFoundation;

@interface WVTakePhotoScreen ()

@property (strong, nonatomic) FIRStorage *storage;
@property (strong, nonatomic) FIRStorageReference *storageRef;

/* views */

@property (strong, nonatomic) IBOutlet UIView *cameraView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *retakeButton;
@property (strong, nonatomic) IBOutlet UIButton *takePhotoButton;
@property (strong, nonatomic) IBOutlet UILabel *numberThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOneLabel;
@property (strong, nonatomic) IBOutlet UIStackView *descriptionStackView;
@property (strong, nonatomic) IBOutlet UILabel *afterPhotoDescription;
@property (strong, nonatomic) UIColor *numberLabelColor;


@property (strong, nonatomic) NSTimer *timerForPhoto;
@property (assign) NSInteger start;


@property(nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) NSData *dataFromImage;


@property (strong, nonatomic) WVUser *userForm;

@end

@implementation WVTakePhotoScreen


-(void)viewWillAppear:(BOOL)animated{
    
    
    self.start = 4;
    
    

    
    
}
-(void)setUpTimer{

    if(self.start == 4){
        
        self.timerForPhoto = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(startCountdown) userInfo:nil repeats:YES];
    }
  
    
}

-(void)setUpCamera{
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *captureDevice = nil;
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for(AVCaptureDevice *camera in devices) {
        if([camera position] == AVCaptureDevicePositionFront) { // is front camera
            captureDevice = camera;
            break;
        }
    }
    
    
    if (captureDevice)
    {
        NSError *error;
        AVCaptureDeviceInput *videoInput = [AVCaptureDeviceInput deviceInputWithDevice:captureDevice error:&error];
        if (!error)
        {
            if ([session canAddInput:videoInput])
            {
                
                
                [session addInput:videoInput];
                AVCaptureVideoPreviewLayer *previewLayer = [AVCaptureVideoPreviewLayer layerWithSession:session];
                [previewLayer setVideoGravity:AVLayerVideoGravityResizeAspectFill];
                CALayer *layer = [previewLayer modelLayer];
                layer.cornerRadius = self.cameraView.bounds.size.width/2;
                layer.frame = self.cameraView.bounds;
                [self.cameraView.layer addSublayer:layer];
                
                // Setting up to capture image
                
                self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
                NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
                [self.stillImageOutput setOutputSettings:outputSettings];
                
                [session addOutput:self.stillImageOutput];
                
                
                [session startRunning];
                
            }
            else{
                
                NSLog(@"There may be an error");
            }
        }
    }
    
}
- (IBAction)retakePhotoButtonTapped:(id)sender {
    
    
    self.numberThreeLabel.alpha = 0;
    self.numberTwoLabel.alpha = 0;
    self.numberOneLabel.alpha = 0;
    self.imageView.alpha = 0;
    self.start = 4;
   
    [self shouldEnableRetakeButton:NO];
    
    
}
- (IBAction)takePhotoButtonTapped:(id)sender {
    
    
    
    if([self.takePhotoButton.titleLabel.text isEqualToString:@"TAKE PHOTO"]){
     [self setUpTimer];
    }
    
    
    if([self.takePhotoButton.titleLabel.text isEqualToString:@"CONTINUE"]){
        [self finishSignin];
    }
    
}


-(void)finishSignin{
    
    
    NSDateFormatter *dateFormatter=[[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MMM-dd hh:mm a"];
    // or @"yyyy-MM-dd hh:mm:ss a" if you prefer the time with AM/PM
    NSString *date = [dateFormatter stringFromDate:[NSDate date]];
    self.userForm = [[WVUser alloc] initWithFirstname:self.firstname Lastname:self.lastname email:self.email time:date];
    
    
//    
//    // Create a reference to the file you want to upload
//    FIRStorageReference *imagesRef = [self.storageRef child:@"images/picture.jpeg"];
//    
//    // Upload the file to the path "images/rivers.jpg"
//    FIRStorageUploadTask *uploadTask = [imagesRef putData:self.dataFromImage metadata:nil completion:^(FIRStorageMetadata *metadata, NSError *error) {
//        if (error != nil) {
//            
//            NSLog(@"Theres an error");
//            
//        } else {
//            // Metadata contains file metadata such as size, content-type, and download URL.
//            NSURL *downloadURL = metadata.downloadURL;
//            
//            NSLog(@"%@",downloadURL);
//        }
//    }];
//
//    
    
    
    
    WVImageUpload *uploadImageTask = [[WVImageUpload alloc]init];
    [uploadImageTask uploadDataWithImageData:self.dataFromImage ofUser:[NSString stringWithFormat:@"%@ %@", self.firstname, self.lastname]];
    
    WVWelcomeScreen *welcomeScreen = [[WVWelcomeScreen alloc] initWithNibName:@"WVWelcomeScreen" bundle:nil];
    [self.navigationController pushViewController:welcomeScreen animated:YES];

}



- (IBAction)backButtonTapped:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)startCountdown{
    
    self.takePhotoButton.userInteractionEnabled = NO;
    
    if(self.start == 4){
        
        self.numberThreeLabel.alpha = 1;
    
    }
    else if(self.start == 3){
        
        self.numberTwoLabel.alpha = 1;
        
    }
    else if(self.start == 2){
        
        
        self.numberOneLabel.alpha = 1;
    }
    else if(self.start == 1){
        
    
    }
    
    if(--self.start== 0)
    {
        self.takePhotoButton.userInteractionEnabled = YES;
        
        [self takePhoto];
        [self.timerForPhoto invalidate];
        [self shouldEnableRetakeButton:YES];
        
    }
   
}

-(void)shouldEnableRetakeButton:(BOOL) isActivated{
    
    if(isActivated == YES){
        [UIView animateWithDuration:.2 animations:^{
            
            self.retakeButton.enabled = YES;
            [self.retakeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            self.takePhotoButton.titleLabel.text = CONTINUE;
            self.descriptionStackView.alpha = 0;
            self.afterPhotoDescription.alpha = 1;
            
            
        }];
    }
    else{
        [UIView animateWithDuration:.2 animations:^{
  
        self.retakeButton.enabled = NO;
        [self.retakeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        self.takePhotoButton.titleLabel.text = TAKEPHOTO;
        self.descriptionStackView.alpha = 1;
        self.afterPhotoDescription.alpha = 0;
        
         }];
    }


}



-(void)takePhoto{


    AVCaptureConnection *videoConnection = nil;
    for (AVCaptureConnection *connection in self.stillImageOutput.connections)
    {
        for (AVCaptureInputPort *port in [connection inputPorts])
        {
            if ([[port mediaType] isEqual:AVMediaTypeVideo] )
            {
                videoConnection = connection;
                break;
            }
        }
        if (videoConnection) { break; }
    }
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error)
     {
   
         if(!error){
             NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
             UIImage *image = [[UIImage alloc] initWithData:imageData];
            
         
             self.imageView.image = [self convertImage:image];
             self.imageView.alpha = 1;
         }
         else{
             
             NSLog(@"%@", error.description);
             
         }
         
         
     }];
    
    
}


/* This method flips the image from a user perspective and converts the UIImage to NSData for storage upload*/

-(UIImage *)convertImage:(UIImage *)image
{
    UIImage *flippedImage = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationLeftMirrored];
    self.dataFromImage = UIImageJPEGRepresentation(flippedImage, 1.);
    
    return flippedImage;
}


-(void)setNumberLabels{
    
    
    [self.numberThreeLabel setTextColor:[UIColor whiteColor]];
    [self.numberTwoLabel setTextColor:[UIColor whiteColor]];
    [self.numberOneLabel setTextColor:[UIColor whiteColor]];
    
    [self.numberOneLabel   setBackgroundColor:self.numberLabelColor];
    [self.numberTwoLabel   setBackgroundColor:self.numberLabelColor];
    [self.numberThreeLabel setBackgroundColor:self.numberLabelColor];
    
    
    self.numberThreeLabel.alpha = 0;
    self.numberTwoLabel.alpha = 0;
    self.numberOneLabel.alpha = 0;
    
    self.numberOneLabel.layer.cornerRadius = self.numberOneLabel.bounds.size.height/2;
    self.numberTwoLabel.layer.cornerRadius = self.numberTwoLabel.bounds.size.height/2;
    self.numberThreeLabel.layer.cornerRadius = self.numberThreeLabel.bounds.size.height/2;
    
}




- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.storage = [FIRStorage storage];
    self.storageRef = [_storage referenceForURL:@"gs://workville-2d5f4.appspot.com"];
    
    UIColor *buttonColorOne = CONTINUEBUTTONCOLOR1;
    UIColor *buttonColorTwo = CONTINUEBUTTONCOLOR2;
    self.numberLabelColor = CONTINUEBUTTONCOLOR1;
    
    UIView *view = [[UIView alloc] initWithFrame:self.takePhotoButton.bounds];
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[buttonColorTwo CGColor],(id)[buttonColorOne CGColor],  nil];
    [gradient setStartPoint:CGPointMake(.3, 0)];
    [gradient setEndPoint:CGPointMake(0, .3)];
    
    [self.takePhotoButton.layer insertSublayer:gradient atIndex:0];

    
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.height/2;
    self.imageView.layer.borderColor = buttonColorTwo.CGColor;
    self.imageView.layer.borderWidth = .5;
    self.imageView.alpha = 0;
    
    self.retakeButton.layer.cornerRadius = self.retakeButton.bounds.size.height/10;
    self.takePhotoButton.layer.cornerRadius = self.takePhotoButton.bounds.size.height/10;
    
    
    self.cameraView.layer.borderColor = [UIColor whiteColor].CGColor;
    self.cameraView.layer.cornerRadius = self.cameraView.bounds.size.height/2;
    
    [self.backButton setTitleColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1] forState:UIControlStateNormal];
    self.backButton.tintColor = [UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1];
    
    self.retakeButton.enabled = NO;
    self.takePhotoButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    
    
    [self setUpCamera];
    [self setNumberLabels];
}

@end
