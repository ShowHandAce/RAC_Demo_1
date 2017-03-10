//
//  RDConstant.h
//  RAC_Demo_1
//
//  Created by qjsios on 2017/2/23.
//  Copyright © 2017年 zhios. All rights reserved.
//

#ifndef RDConstant_h
#define RDConstant_h



///------
/// Color
///------

#define RGB(r, g, b) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:1.0]
#define RGBAlpha(r, g, b, a) [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:(a)]

#define HexRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define HexRGBAlpha(rgbValue, a) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(a)]

#define colorA1 0xe14828
#define colorA2 0xdc2903
#define colorA3 0xf39800
#define colorA4 0xf34659
#define colorA5 0x53d769
#define colorA6 0x1c7efb
#define colorA7 0x00aff7
#define colorA8 0xeb8501
#define colorA9 0x2fc348
#define colorA10 0xce3b4a
#define colorA11 0x0bcbc3
#define colorA12 0x0ab8b4
#define colorA13 0xec8621
#define colorA14 0xfc3c39
#define colorA15 0xe8f6ef
#define colorA16 0x62c092
#define colorA17 0x168f54
#define colorA18 0x007b46

#define colorB0 0xffffff
#define colorB1 0xeeeeee
#define colorB2 0xC8C7CC
#define colorB3 0xbfbfbf
#define colorB4 0x959595
#define colorB5 0x707070
#define colorB6 0x000000
#define colorB7 0xe5e5e5
#define colorB8 0xf8f8f8
#define colorB9 0x434343

#define colorJ1 0xf15e4b
#define colorJ2 0xed2e66
#define colorJ3 0xffb430
#define colorJ4 0x2bb97d
#define colorJ5 0x30b8f3
#define colorJ6 0xe14828
#define colorJ7 0x8fcc0b

#define colorF1 0xd9403f
#define colorF2 0x47a9f0
#define colorF3 0x9cc551
#define colorF4 0x7d7d7d
#define colorF5 0xe14828
#define colorF6 0x39921a

#define colorT1a 0xed5565
#define colorT2a 0xfc8151
#define colorT3a 0xf6bb48
#define colorT4a 0xbcd85f
#define colorT5a 0x83c06b
#define colorT6a 0x48cfad
#define colorT7a 0x4fc0e8
#define colorT8a 0x5d9cec
#define colorT9a 0xac92ec
#define colorT10a 0xec87bf

#define colorT1b 0xda4453
#define colorT2b 0xe1602d
#define colorT3b 0xf6ab42
#define colorT4b 0x8cc152
#define colorT5b 0x5ea044
#define colorT6b 0x37bc9b
#define colorT7b 0x3aafda
#define colorT8b 0x4a89dc
#define colorT9b 0x967adc
#define colorT10b 0xd671ad

#define colorI1 0xBB0F23
#define colorI2 0x30434E
#define colorI3 0x4183C4
#define colorI4 0xe9dba5
#define colorI5 0x24AFFC
#define colorI6 0xEDEDED
//#define colorI6 0xE1E8ED
//#define colorI6 0xEFEDEA
#define colorI7 0xD9D9D9

#define MRC_PLACEHOLDER_IMAGE [HexRGB(0xEDEDED) color2Image]

#define MRC_EMPTY_PLACEHOLDER @"Not Set"

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define MRC_ALERT_TITLE @"Tips"
#define MBPROGRESSHUD_LABEL_TEXT @"Loading..."

#define MRC_LEFT_IMAGE_SIZE CGSizeMake(25, 25)
#define MRC_1PX_WIDTH (1 / [UIScreen mainScreen].scale)


#endif /* RDConstant_h */
