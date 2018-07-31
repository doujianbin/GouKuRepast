//
//  ImageUtil.h
//  ZLYDoc
//
//  Created by apple on 14-4-28.
//  Copyright (c) 2014年 ZLY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageUtil : NSObject

+(UIImage *)imageWithCompressImage:(UIImage *)image;//有判断条件，到了多大之后再压缩
+(UIImage *)imageWithCompressBigImage:(UIImage *)image;//压缩成大图
+(UIImage *)imageWithScaleImage:(UIImage *)image forSize:(CGSize)targetSize;//图片压缩到指定大小
+(UIImage *)imageFromImage:(UIImage *)image inRect:(CGRect)rect;//图片的截取

+(UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;//传入UIColor得到纯色UIImage

+(UIImage *)fixOrientation:(UIImage *)aImage;

+(UIImage *)compressImageWith:(UIImage *)image width:(float)width height:(float)height;

//医生圈内容相关的缩略图 从七牛获取资源时使用的尺寸参数串
+(NSString *)doctorGroupThumbnailImageParam;

//由UIView生成image
+ (UIImage *)imageFromView:(UIView *)v rect:(CGRect)rect;

+ (UIImage *)imageByApplyingAlpha:(CGFloat )alpha  image:(UIImage*)image;
@end
