//
//  UIDevice+YYBasedAdd.h
//  Pomodoroom
//
//  Created by chen xiaosong on 2016/11/19.
//  Copyright © 2016年 chen xiaosong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIDevice (SGAddition)

+(BOOL) sg_cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;
+(BOOL) sg_isCameraAvailable;
+(BOOL) sg_isRearCameraAvailable;
+(BOOL) sg_isFrontCameraAvailable;
+(BOOL) sg_doesCameraSupportTakingPhotos;
+(BOOL) sg_isPhotoLibraryAvailable;
+(BOOL) sg_canUserPickVideosFromPhotoLibrary;
+(BOOL) sg_canUserPickPhotosFromPhotoLibrary;


- (NSString *)sg_machineModelName;
- (NSString *)sg_machineModel;
+ (double)sg_systemVersion;
@end
