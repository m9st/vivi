//
//  photoCameraViewController.m
//  vivi
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "cameraViewController.h"
#import <ImageIO/CGImageProperties.h>

@interface cameraViewController ()

@end

@implementation cameraViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    
    UINavigationBar *nBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height / 15)];
    UIColor *customColor = [UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0];
    [nBar setBarTintColor:customColor];
    [nBar setTranslucent:NO];
    
    UINavigationItem *nBarItems = [[UINavigationItem alloc] init];
    nBarItems.title = @"Camera";
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(closeController:)];
    closeButton.tintColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    nBarItems.rightBarButtonItem = closeButton;
    [nBar setItems:@[nBarItems]];
    [self.view addSubview:nBar];
    NSLog(@"%f", self.tabBarController.tabBar.frame.size.height);
    UIButton *takeAShot = [[UIButton alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height * 3, self.view.frame.size.width, self.tabBarController.tabBar.frame.size.height * 2)];
    [takeAShot setTitle:@"Press to Take a Shot" forState:UIControlStateNormal];
    [takeAShot setBackgroundColor:[UIColor blueColor]];
    [takeAShot addTarget:self action:@selector(takeAShotAction:) forControlEvents:UIControlEventTouchUpInside];
    UIImageView *cameraView = [[UIImageView alloc] initWithFrame:CGRectMake(0, nBar.frame.origin.y + nBar.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - nBar.frame.size.height - self.tabBarController.tabBar.frame.size.height - takeAShot.frame.size.height)];
    
    AVCaptureSession *session = [[AVCaptureSession alloc] init];
    session.sessionPreset = AVCaptureSessionPresetMedium;
    
    CALayer *viewLayer = cameraView.layer;
    NSLog(@"viewLayer = %@", viewLayer);
    
    AVCaptureVideoPreviewLayer *captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:session];
    
    captureVideoPreviewLayer.frame = cameraView.bounds;
    [cameraView.layer addSublayer:captureVideoPreviewLayer];
    
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    NSError *error = nil;
    AVCaptureDeviceInput *input = [AVCaptureDeviceInput deviceInputWithDevice:device error:&error];
    if (!input) {
        // Handle the error appropriately.
        NSLog(@"ERROR: trying to open camera: %@", error);
    }
    [session addInput:input];
    
    self.stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [self.stillImageOutput setOutputSettings:outputSettings];
    [session addOutput:self.stillImageOutput];
    
    [session startRunning];

    
    
    [self.view addSubview:takeAShot];


    // Do any additional setup after loading the view.
}

-(IBAction) takeAShotAction:(id)sender {
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
         CFDictionaryRef exifAttachments = CMGetAttachment( imageSampleBuffer, kCGImagePropertyExifDictionary, NULL);
         if (exifAttachments)
         {
             // Do something with the attachments.
             NSLog(@"attachements: %@", exifAttachments);
         }
         else
             NSLog(@"no attachments");
         
         NSData *imageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageSampleBuffer];
         UIImage *image = [[UIImage alloc] initWithData:imageData];
         
         self.vImage.image = image;
     }];
}

-(IBAction)closeController:(id)sender {
    [self dismissViewControllerAnimated:YES completion:NO];
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
