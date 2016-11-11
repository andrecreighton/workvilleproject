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
@property(nonatomic, retain) AVCaptureStillImageOutput *stillImageOutput;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation WVTakePhotoScreen

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.imageView.layer.cornerRadius = self.imageView.bounds.size.height/2;
    self.imageView.alpha = 0;
    
    
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
        
    
    }
    
    if(--self.start== 0)
    {
        [self takePhoto];
        [self.timerForPhoto invalidate];
        self.retakeButton.enabled = YES;
        
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
    
    NSLog(@"about to request a capture from: %@", self.stillImageOutput);
    [self.stillImageOutput captureStillImageAsynchronouslyFromConnection:videoConnection completionHandler: ^(CMSampleBufferRef imageSampleBuffer, NSError *error)
     {
   
         
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         
         UIImage *image = [[UIImage alloc] initWithData:imageData];
         NSLog(@"%@", image);
         
         
         self.imageView.image = [self makeMirroredImage:image];
         self.imageView.alpha = 1;
         
         
     }];
    
    
}
-(UIImage *)makeMirroredImage:(UIImage *)image
{
    
 
    UIImage * flippedImage = [UIImage imageWithCGImage:image.CGImage scale:image.scale orientation:UIImageOrientationLeftMirrored];
    return flippedImage;
}

@end
