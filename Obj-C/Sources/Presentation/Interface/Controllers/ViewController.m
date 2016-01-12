//
//  ViewController.m
//  SharingExample
//
//  Created by Wagner Sales on 18/02/15.
//  Copyright (c) 2015 Wagner Sales. All rights reserved.
//

#import "ViewController.h"
#import "WASWhatsAppUtil.h"

typedef enum{
	kSendText = 0,
	kSendImage,
	kSendTextWithImage,
	kSendAudio,
	kSendCancel
} options;

@interface ViewController ()<UIActionSheetDelegate,UIDocumentInteractionControllerDelegate>{
	UIDocumentInteractionController *docControll;
}

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - IBActions
- (IBAction)sendDidTouch:(id)sender
{
//    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"Choose" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send text",@"Send image",@"Send image with text",@"Send audio", nil];
//	[sheet showInView:self.view];
	
	UIAlertController *as = [UIAlertController alertControllerWithTitle:@"Choose"
																message:nil
														 preferredStyle:UIAlertControllerStyleActionSheet];
	
	// Text
	[as addAction:[UIAlertAction actionWithTitle:@"Send text"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {

		[[WASWhatsAppUtil getInstance] sendText:@"Text"];
		[self dismissViewControllerAnimated:YES completion:^{}];
	}]];

	// Image
	[as addAction:[UIAlertAction actionWithTitle:@"Send image"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {

		[[WASWhatsAppUtil getInstance] sendImage:[UIImage imageNamed:@"image.jpg"] inView:self.view];
		[self dismissViewControllerAnimated:YES completion:^{}];
	}]];

	// Audio
	[as addAction:[UIAlertAction actionWithTitle:@"Send audio"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {
		
		[[WASWhatsAppUtil getInstance] sendText:@"Text"];
		[self dismissViewControllerAnimated:YES completion:^{}];
	}]];
	
	// Cancel
	[as addAction:[UIAlertAction actionWithTitle:@"Cancel"
										   style:UIAlertActionStyleCancel
										 handler:^(UIAlertAction *action) {

		 [self dismissViewControllerAnimated:YES completion:^{}];
	 }]];
	
	[self presentViewController:as animated:YES completion:nil];
}

@end
