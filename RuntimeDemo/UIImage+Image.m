//
//  UIImage+Image.m
//  RuntimeDemo
//
//  Created by LXJ on 2018/5/7.
//  Copyright © 2018年 LianLuo. All rights reserved.
//

#import "UIImage+Image.h"
#import <objc/message.h>

@implementation UIImage (Image)

+ (void)load {
    // 1.获取 imageNamed方法地址
    // class_getClassMethod（获取某个类的方法）
    Method imageNamedMethod = class_getClassMethod(self, @selector(imageNamed:));
    Method lxj_imageNamedMethod = class_getClassMethod(self, @selector(lxj_imageNamedMethod:));
    // 交换方法
    method_exchangeImplementations(imageNamedMethod, lxj_imageNamedMethod);
}

+ (UIImage *)lxj_imageNamedMethod:(NSString *)name {
    UIImage *image = [UIImage lxj_imageNamedMethod:name];
    if (image) {
        NSLog(@"runtime添加额外功能--加载成功");
    } else {
        NSLog(@"runtime添加额外功能--加载失败");
    }
    return image;
}

- (void)setName:(NSString *)name {
    // objc_setAssociatedObject（将某个值跟某个对象关联起来，将某个值存储到某个对象中）
    // object:给哪个对象添加属性
    // key:属性名称
    // value:属性值
    // policy:保存策略
    objc_setAssociatedObject(self, @"name", name, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)name {
    return objc_getAssociatedObject(self, @"name");
}

@end
