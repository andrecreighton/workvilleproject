//
//  WVTakePhotoScreen.m
//  Workville
//
//  Created by Andre Creighton on 11/9/16.
//  Copyright © 2016 Andre Creighton. All rights reserved.
//

#import "WVTakePhotoScreen.h"
@import AVFoundation;

@interface WVTakePhotoScreen ()
@property (strong, nonatomic) NSTimer *timerForPhoto;
@property (assign) NSInteger start;
@property (strong, nonatomic) IBOutlet UIView *cameraView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *retakeButton;
@property (strong, nonatomic) IBOutlet UIButton *takePhotoButton;
@property (strong, nonatomic) IBOutlet UILabel *numberThreeLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberTwoLabel;
@property (strong, nonatomic) IBOutlet UILabel *numberOneLabel;


@end

@implementation WVTakePhotoScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.cameraView.layer.borderColor = [UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1].CGColor;
    self.cameraView.layer.borderWidth = 2.f;
    self.cameraView.layer.cornerRadius = self.cameraView.bounds.size.height/2;
    [self.backButton setTitleColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1] forState:UIControlStateNormal];
    self.backButton.tintColor = [UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1];
    
    
    self.retakeButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.retakeButton.layer.borderWidth = .5f;
    self.retakeButton.enabled = NO;
    
    [self.numberThreeLabel setTextColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1]];
    [self.numberTwoLabel setTextColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1]];
    [self.numberOneLabel setTextColor:[UIColor colorWithRed:62./255 green:194./255 blue:192./255 alpha:1]];
    self.numberThreeLabel.alpha = 0;
    self.numberTwoLabel.alpha = 0;
    self.numberOneLabel.alpha = 0;
    
    
    [self setUpCamera];
}

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
                [session startRunning];
                
            }
            else{
                
                NSLog(@"There may be an error");
            }
        }
    }
    
}
- (IBAction)takePhotoButtonTapped:(id)sender {
    
   
     [self setUpTimer];
    
}

- (IBAction)backButtonTapped:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
}

-(void)startCountdown{
    
    NSLog(@"time");
    
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
        
    
        NSLog(@"Take photo");
    }
    
    if(--self.start== 0)
    {
       
        [self.timerForPhoto invalidate];
        
    }
    

   
}


@end
