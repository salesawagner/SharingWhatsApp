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

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self setupImageView];
}

#pragma mark - IBActions
- (IBAction)sendDidTouch:(id)sender
{
	UIAlertController *as = [UIAlertController alertControllerWithTitle:@"Choose"
																message:nil
														 preferredStyle:UIAlertControllerStyleActionSheet];
	
	// Text
	[as addAction:[UIAlertAction actionWithTitle:@"Send text"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {

		[[WASWhatsAppUtil getInstance] sendText:@"Text"];
	}]];

	// Image
	[as addAction:[UIAlertAction actionWithTitle:@"Send image"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {

		 NSData *data = UIImageJPEGRepresentation(self.imageView.image, 1.0);
		 [[WASWhatsAppUtil getInstance] sendFile:data UTI:WhatsAppImageType inView:self.view];

	}]];

	// Audio
	[as addAction:[UIAlertAction actionWithTitle:@"Send audio"
										   style:UIAlertActionStyleDefault
										 handler:^(UIAlertAction *action) {
		
		 NSString *audioPath = [[NSBundle mainBundle] pathForResource:@"beeps" ofType:@"mp3"];
		 NSData *data = [[NSData alloc]initWithContentsOfFile:audioPath];
		 [[WASWhatsAppUtil getInstance] sendFile:data UTI:WhatsAppAudioType inView:self.view];

	}]];
	
	// Cancel
	[as addAction:[UIAlertAction actionWithTitle:@"Cancel"
										   style:UIAlertActionStyleCancel
										 handler:^(UIAlertAction *action) {

		 [self dismissViewControllerAnimated:YES completion:^{}];
	 }]];
	
	[self presentViewController:as animated:YES completion:nil];
}

#pragma mark - Setups

- (void)setupImageView
{
	self.imageView.layer.shadowColor = [UIColor blackColor].CGColor;
	self.imageView.layer.shadowOffset = CGSizeMake(0, 0);
	self.imageView.layer.shadowOpacity = .5;
	self.imageView.layer.shadowRadius = 1.0;
	self.imageView.clipsToBounds = NO;
}

@end
