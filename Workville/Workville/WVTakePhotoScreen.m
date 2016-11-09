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
@property (strong, nonatomic) IBOutlet UIView *cameraView;
@property (strong, nonatomic) IBOutlet UIButton *backButton;


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
    

    [self setUpCamera];
}

-(void)setUpCamera{
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    AVCaptureDevice *captureDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDevicePosition position;
    if (captureDevice)
    {
        position = AVCaptureDevicePositionFront;
        
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
- (IBAction)backButtonTapped:(id)sender {
    
    
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
