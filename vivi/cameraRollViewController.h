//
//  cameraRollViewController.h
//  vivi
//
//  Created by Admin on 17.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface cameraRollViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>


@property (strong, nonatomic) UIImageView *selectedPhotoImage;
@property (strong, nonatomic) UIImageView *cellImage;
@property (strong, nonatomic) NSArray *imgArray;
@property (strong, nonatomic) NSMutableArray *imageMutArray;

@end
