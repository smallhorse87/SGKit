//
//  SGKitMarco.h
//  SGKit
//
//  Created by chenxiaosong on 2017/10/22.
//  Copyright © 2017年 chenxiaosong. All rights reserved.
//

#ifndef SGKitMarco_h
#define SGKitMarco_h

#ifndef kSGScreenWidth
#define kSGScreenWidth [UIScreen mainScreen].bounds.size.width
#endif

#ifndef kSGSecondsPerMinute
#define kSGSecondsPerMinute 60.0
#endif

#ifndef kSGSecondsPerHour
#define kSGSecondsPerHour 3600.0
#endif

/*
 应用支持的时间范围
 */
#ifndef kSGMinDate
#define kSGMinDate @"2001-01-01"
#endif

#ifndef kSGMaxDate
#define kSGMaxDate @"2038-01-01"
#endif

#endif /* SGKitMarco_h */
