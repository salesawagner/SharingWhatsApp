//
//  WASWhatsAppUtil.h
//  SharingExample
//
//  Created by Wagner Sales on 18/02/15.
//  Copyright (c) 2015 Wagner Sales. All rights reserved.
//

#import <Foundation/Foundation.h>
#import  <UIKit/UIKit.h>

@interface WASWhatsAppUtil : NSObject

+ (id)getInstance;
- (void)sendText:(NSString*)message;
- (void)sendImage:(UIImage*)image inView:(UIView*)view;
- (void)sendText:(NSString*)message image:(UIImage*)image inView:(UIView*)view;
- (void)sendAudioinView:(UIView*)view;

@end
