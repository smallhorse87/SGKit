//
//  UIDevice+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (CXSAdded)

+(BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;
+(BOOL) isCameraAvailable;
+(BOOL) isRearCameraAvailable;
+(BOOL) isFrontCameraAvailable;
+(BOOL) doesCameraSupportTakingPhotos;
+(BOOL) isPhotoLibraryAvailable;
+(BOOL) canUserPickVideosFromPhotoLibrary;
+(BOOL) canUserPickPhotosFromPhotoLibrary;


- (NSString *)machineModelName;
- (NSString *)machineModel;
+ (double)systemVersion;
@end
