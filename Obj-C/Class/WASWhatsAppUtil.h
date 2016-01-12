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

// Whatsapp UTI
typedef enum {
	WhatsAppImageType = 0,
	WhatsAppAudioType,
	WhatsAppVideoType
} WhatsAppType;

+ (id)getInstance;
- (void)sendText:(NSString*)message;
- (void)sendFile:(NSData *)data UTI:(WhatsAppType)type inView:(UIView *)view;

@end
