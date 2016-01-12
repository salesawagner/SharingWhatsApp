//
//  WASWhatsAppUtil.m
//  SharingExample
//
//  Created by Wagner Sales on 18/02/15.
//  Copyright (c) 2015 Wagner Sales. All rights reserved.
//

#import "WASWhatsAppUtil.h"

NSString *const whatsAppUrl = @"whatsapp://app";
NSString *const whatsAppSendTextUrl = @"whatsapp://send?text=";

__strong static WASWhatsAppUtil* instanceOf = nil;

@interface WASWhatsAppUtil()<UIDocumentInteractionControllerDelegate>{
	UIDocumentInteractionController *_docControll;
}

@end

@implementation WASWhatsAppUtil

+ (WASWhatsAppUtil*)getInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		instanceOf = [[WASWhatsAppUtil alloc] init];
	});
	return instanceOf;
}

- (void)sendText:(NSString *)message
{
	NSString *urlWhats = [NSString stringWithFormat:@"%@%@",whatsAppSendTextUrl,message];
	urlWhats = [urlWhats stringByAddingPercentEncodingWithAllowedCharacters:
				[NSCharacterSet alphanumericCharacterSet]];
	NSURL *whatsappURL = [NSURL URLWithString:urlWhats];
	
	if ( [self isWhatsAppInstalled] ) {
		[[UIApplication sharedApplication] openURL: whatsappURL];
	} else {
		[self alertWhatsappNotInstalled];
	}
	
}

- (void)sendImage:(UIImage *)image inView:(UIView *)view
{
	if ( [self isWhatsAppInstalled] )
	{
		NSError *error = nil;
		NSURL *documentURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
																	inDomain:NSUserDomainMask
														   appropriateForURL:nil
																	  create:NO
																	   error:&error];

		if (!documentURL){
			[self alertErro:[NSString stringWithFormat:@"Error getting document directory: %@", error]];
			return;
		}
		
		NSURL *tempFile	= [documentURL URLByAppendingPathComponent:@"whatsAppTmp.wai"];
		NSData *imageData = UIImageJPEGRepresentation(image, 1.0);
		
		if (![imageData writeToURL:tempFile options:NSDataWritingAtomic error:&error]){
			[self alertErro:[NSString stringWithFormat:@"Error writing File: %@", error]];
			return;
		}
		
		_docControll = [UIDocumentInteractionController interactionControllerWithURL:tempFile];
		_docControll.UTI = @"net.whatsapp.image";
		_docControll.delegate = self;
		
		[_docControll presentOpenInMenuFromRect:view.frame
										 inView:view
									   animated:YES];
		
	} else {
		[self alertWhatsappNotInstalled];
	}
}

- (void)sendAudioinView:(UIView *)view
{
	if ( [self isWhatsAppInstalled] )
	{
		NSString *savePath = [[NSBundle mainBundle] pathForResource:@"beeps" ofType:@"mp3"];;
		NSURL *tempFile	= [NSURL fileURLWithPath:savePath];
		
		_docControll = [UIDocumentInteractionController interactionControllerWithURL:tempFile];
		_docControll.UTI = @"net.whatsapp.audio";
		_docControll.delegate = self;
		
		[_docControll presentOpenInMenuFromRect:CGRectMake(0, 0, 0, 0)
										 inView:view
									   animated: YES];
		
	} else {
		[self alertWhatsappNotInstalled];
	}
}

#pragma mark - private
- (BOOL)isWhatsAppInstalled
{
	return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:whatsAppUrl]];
}

#pragma mark - Alert helper
-(void)alertWithTitle:(NSString *)title message:(NSString *)message
{
	UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
																   message:message
															preferredStyle:UIAlertControllerStyleAlert];
	
	[alert addAction:[UIAlertAction actionWithTitle:@"OK"
										   style:UIAlertActionStyleCancel
										 handler:^(UIAlertAction *action) {
											 
		 [vc dismissViewControllerAnimated:YES completion:^{}];
	 }]];
	
	[vc presentViewController:alert animated:YES completion:nil];
}

- (void)alertWhatsappNotInstalled
{
	[self alertErro:@"Your device has no WhatsApp installed."];
}

- (void)alertErro:(NSString *)message
{
	[self alertWithTitle:@"Error" message:message];
}

@end
