//
//  ViewController.m
//  SharingExample
//
//  Created by Wagner Sales on 18/02/15.
//  Copyright (c) 2015 Wagner Sales. All rights reserved.
//

#import "ViewController.h"
#import "WASWhatsAppUtil.h"
#import <Crashlytics/Crashlytics.h>

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - IBActions
- (IBAction)sendDidTouch:(id)sender
{
//    UIActionSheet * sheet = [[UIActionSheet alloc]initWithTitle:@"Choose" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:nil otherButtonTitles:@"Send text",@"Send image",@"Send image with text",@"Send audio", nil];
//	[sheet showInView:self.view];
	[[Crashlytics sharedInstance] crash];
}

#pragma mark - UIActionSheet Delegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
	
	switch (buttonIndex) {
		case kSendText:
			[[WASWhatsAppUtil getInstance] sendText:@"Text"];
			break;
		case kSendImage:
			[[WASWhatsAppUtil getInstance] sendImage:[UIImage imageNamed:@"image.jpg"] inView:self.view];
			break;
		case kSendTextWithImage:
			NSLog(@"Send text with image");
		case kSendAudio:
			[[WASWhatsAppUtil getInstance] sendAudioinView:self.view];
			break;
		default:
			NSLog(@"Cancel send");
			break;
	}
	
}

@end
