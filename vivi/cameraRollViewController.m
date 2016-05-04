//
//  cameraRollViewController.m
//  vivi
//
//  Created by Admin on 17.03.16.
//  Copyright © 2016 MAC. All rights reserved.
//

#import "cameraRollViewController.h"
#import "QuartzCore/CALayer.h"
#import <Photos/Photos.h>

@interface cameraRollViewController ()

@end

@implementation cameraRollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    [self.view setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    UINavigationBar *nBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, (self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height) / 15)];
    UIColor *customColor = [UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0];
    [nBar setBarTintColor:customColor];
    [nBar setTranslucent:NO];
    UINavigationItem *nBarItems = [[UINavigationItem alloc] init];
    nBarItems.title = @"Camera Roll";
    UIBarButtonItem *closeButton = [[UIBarButtonItem alloc] initWithTitle:@"X" style:UIBarButtonItemStylePlain target:self action:@selector(closeController:)];
    closeButton.tintColor = [UIColor colorWithRed:1.00 green:0.59 blue:0.73 alpha:1.0];
    nBarItems.rightBarButtonItem = closeButton;
    [nBar setItems:@[nBarItems]];
    [self.view addSubview:nBar];
    
    [self authCheck];
    
    
    UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc] init];
    self.selectedPhotoImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0 + nBar.frame.size.height + 20, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height * 4)];
    self.selectedPhotoImage.image = [self.imgArray objectAtIndex:0];
    
    UICollectionView *cameraRollCollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, self.selectedPhotoImage.frame.size.height + 80, self.view.frame.size.width, self.view.frame.size.height - self.tabBarController.tabBar.frame.size.height - self.selectedPhotoImage.frame.size.height - 20) collectionViewLayout:layout];
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 0.5;
    [cameraRollCollView setBackgroundColor:[UIColor colorWithRed:0.12 green:0.10 blue:0.09 alpha:1.0]];
    [cameraRollCollView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"collectionCell"];
    cameraRollCollView.delegate = self;
    cameraRollCollView.dataSource = self;
    [self.view addSubview:self.selectedPhotoImage];
    [self.view addSubview:cameraRollCollView];


}


-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  self.imgArray.count;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(self.view.frame.size.width / 4 - 0.5, self.view.frame.size.width / 4);
}

-(UIEdgeInsets) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    self.cellImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, cell.frame.size.width, cell.frame.size.height)];
    self.cellImage.image = [self.imgArray objectAtIndex:indexPath.row];
    [cell.contentView setBackgroundColor:[UIColor whiteColor]];
    [cell.contentView addSubview:self.cellImage];
    return cell;
}

-(void) authCheck {
    PHAuthorizationStatus status = [PHPhotoLibrary authorizationStatus];
    if(status == PHAuthorizationStatusNotDetermined) {
        // Request photo authorization
        [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
            // User code (show imagepicker)
        }];
    } else if (status == PHAuthorizationStatusAuthorized) {
        self.imgArray = nil;
        [self allPhotosArray];
        
        
    } else if (status == PHAuthorizationStatusRestricted) {
        NSLog(@"stop");UIAlertController *denied = [[UIAlertController alloc] init];
        [denied setTitle:@"Please go to settings and take permissions for access to your photos"];
        [denied setMessage:@":)"];
        UIAlertAction *noauth = [UIAlertAction actionWithTitle:@"Good" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [denied addAction:noauth];
        [self presentViewController:denied animated:YES completion:nil];
        
    } else if (status == PHAuthorizationStatusDenied) {
        NSLog(@"NOPE");
        UIAlertController *denied = [[UIAlertController alloc] init];
        [denied setTitle:@"Please go to settings and take permissions for access to your photos"];
        [denied setMessage:@":)"];
        UIAlertAction *noauth = [UIAlertAction actionWithTitle:@"Good" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [denied addAction:noauth];
        [self presentViewController:denied animated:YES completion:nil];
    }
}

-(void) allPhotosArray {
    self.imgArray=[[NSArray alloc] init];
    self.imageMutArray =[[NSMutableArray alloc]init];
    
    PHImageRequestOptions *requestOptions = [[PHImageRequestOptions alloc] init];
    requestOptions.resizeMode   = PHImageRequestOptionsResizeModeExact;
    requestOptions.deliveryMode = PHImageRequestOptionsDeliveryModeHighQualityFormat;
    requestOptions.synchronous = true;
    PHFetchResult *result = [PHAsset fetchAssetsWithMediaType:PHAssetMediaTypeImage options:nil];
    
    NSLog(@"%d",(int)result.count);
    
    PHImageManager *manager = [PHImageManager defaultManager];
    NSMutableArray *images = [NSMutableArray arrayWithCapacity:[result count]];
    
    // assets contains PHAsset objects.
    
    __block UIImage *ima;
    for (PHAsset *asset in result) {
        // Do something with the asset
        
        [manager requestImageForAsset:asset
                           targetSize:PHImageManagerMaximumSize
                          contentMode:PHImageContentModeDefault
                              options:requestOptions
                        resultHandler:^void(UIImage *image, NSDictionary *info) {
                            ima = image;
                            
                            [images addObject:ima];
                        }];
        
        
    }
    
    self.imgArray = [images copy];  // You can direct use NSMutuable Array images
}

-(void) collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"collectionCell" forIndexPath:indexPath];
    

    self.selectedPhotoImage.image = [self.imgArray objectAtIndex:indexPath.row];
}

-(void) collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectedPhotoImage.image = nil;
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
