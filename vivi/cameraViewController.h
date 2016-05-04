//
//  photoCameraViewController.h
//  vivi
//
//  Created by Admin on 15.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface cameraViewController : UIViewController

@property (retain, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property(nonatomic, retain) UIImageView *vImage;

@end
