//
//  WASWhatsAppUtil.swift
//  SharingWhatsApp
//
//  Created by Wagner Sales on 3/21/16.
//  Copyright © 2016 Wagner Sales. All rights reserved.
//

import UIKit

let whatsAppUrl = "whatsapp://app";
let whatsAppSendTextUrl = "whatsapp://send?text=";

class WASWhatsAppUtil: NSObject {

}

//// Whatsapp UTI
//NSString *UTIWithWhatsAppType(WhatsAppType type) {
//	NSArray *arr = @[
//	@"net.whatsapp.image", //image
//	@"net.whatsapp.audio", //audio
//	@"net.whatsapp.movie"  //movie
//	];
//	return (NSString *)[arr objectAtIndex:type];
//}
//
//NSString *typeWithWhatsAppType(WhatsAppType type) {
//	NSArray *arr = @[
//	@"whatsAppTmp.wai", //image
//	@"whatsAppTmp.waa", //audio
//	@"whatsAppTmp.wam"  //movie
//	];
//	return (NSString *)[arr objectAtIndex:type];
//}
//
//// Instace
//__strong static WASWhatsAppUtil* instanceOf = nil;
//
//@interface WASWhatsAppUtil()<UIDocumentInteractionControllerDelegate>{
//	UIDocumentInteractionController *_docControll;
//}
//
//@end
//
//@implementation WASWhatsAppUtil
//
//#pragma mark - Instance
//+ (WASWhatsAppUtil*)getInstance
//{
//	static dispatch_once_t onceToken;
//	dispatch_once(&onceToken, ^{
//	instanceOf = [[WASWhatsAppUtil alloc] init];
//	});
//	return instanceOf;
//}
//
//#pragma mark - Sends
//- (void)sendText:(NSString *)message
//{
//	NSString *urlWhats = [NSString stringWithFormat:@"%@%@",whatsAppSendTextUrl,message];
//	NSCharacterSet *set = [NSCharacterSet URLQueryAllowedCharacterSet];
//	urlWhats = [urlWhats stringByAddingPercentEncodingWithAllowedCharacters:set];
//	NSURL *whatsappURL = [NSURL URLWithString:urlWhats];
//	
//	if ( [self isWhatsAppInstalled] ) {
//		[[UIApplication sharedApplication] openURL: whatsappURL];
//	} else {
//		[self alertWhatsappNotInstalled];
//	}
//	}
//	
//	- (void)sendFile:(NSData *)data UTI:(WhatsAppType)type inView:(UIView *)view
//{
//	if ( [self isWhatsAppInstalled] )
//	{
//		NSURL *tempFile	= [self createTempFile:data type:typeWithWhatsAppType(type)];
//		_docControll = [UIDocumentInteractionController interactionControllerWithURL:tempFile];
//		_docControll.UTI = UTIWithWhatsAppType(type);
//		_docControll.delegate = self;
//		
//		[_docControll presentOpenInMenuFromRect:CGRectZero
//			inView:view
//			animated:YES];
//	} else {
//		[self alertWhatsappNotInstalled];
//	}
//}
//
//#pragma mark - Helpers
//- (NSURL *)createTempFile:(NSData *)data type:(NSString *)type
//{
//	NSError *error = nil;
//	NSURL *tempFile = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory
//		inDomain:NSUserDomainMask
//		appropriateForURL:nil
//		create:NO
//		error:&error];
//	
//	if (tempFile)
//	{
//		tempFile = [tempFile URLByAppendingPathComponent:type];
//	} else {
//		[self alertErro:[NSString stringWithFormat:@"Error getting document directory: %@", error]];
//	}
//	
//	if (![data writeToURL:tempFile options:NSDataWritingAtomic error:&error]){
//		[self alertErro:[NSString stringWithFormat:@"Error writing File: %@", error]];
//	}
//	
//	return tempFile;
//	}
//	
//	- (BOOL)isWhatsAppInstalled
//		{
//			return [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:whatsAppUrl]];
//		}
//		
//		- (void)alertWithTitle:(NSString *)title message:(NSString *)message
//{
//	UIViewController *vc = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
//	UIAlertController *alert = [UIAlertController alertControllerWithTitle:title
//		message:message
//		preferredStyle:UIAlertControllerStyleAlert];
//	
//	[alert addAction:[UIAlertAction actionWithTitle:@"OK"
//		style:UIAlertActionStyleCancel
//		handler:^(UIAlertAction *action) {
//		
//		[vc dismissViewControllerAnimated:YES completion:^{}];
//	 }]];
//	
//	[vc presentViewController:alert animated:YES completion:nil];
//	}
//	
//	- (void)alertWhatsappNotInstalled
//		{
//			[self alertErro:@"Your device has no WhatsApp installed."];
//		}
//		
//		- (void)alertErro:(NSString *)message
//{
//	[self alertWithTitle:@"Error" message:message];
//}
//
//@end
