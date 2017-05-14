//
//  UIColor+Additions.m
//  机场智能小车
//
//  Created by 孤岛 on 2017/5/14.
//  Copyright © 2017年 孤岛. All rights reserved.
//

#import "UIColor+Additions.h"

@implementation UIColor (Additions)
+ (UIColor *)colorWithRGBHex:(UInt32)hex
{
    int r = (hex >> 16) & 0xFF;
    int g = (hex >> 8) & 0xFF;
    int b = (hex) & 0xFF;
    
    return [UIColor colorWithRed:r / 255.0f
                           green:g / 255.0f
                            blue:b / 255.0f
                           alpha:1.0f];
}
@end
