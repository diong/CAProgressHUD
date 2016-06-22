//
//  SVProgressHUDViewController.m
//  SVProgressHUD
//
//  Created by Sam Vermette on 27.03.11.
//  Copyright 2011 Sam Vermette. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"

@implementation ViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return YES;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [self openGif];
    [SVProgressHUD setForegroundColor:[UIColor whiteColor]];
    [SVProgressHUD setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.4]];
}

- (void)openGif
{
    NSArray *imagesArray = [NSArray arrayWithObjects:
                            [UIImage imageNamed:@"1.png"],
                            [UIImage imageNamed:@"2.png"],
                            [UIImage imageNamed:@"3.png"],
                            [UIImage imageNamed:@"4.png"],
                            [UIImage imageNamed:@"5.png"],
                            [UIImage imageNamed:@"6.png"],
                            [UIImage imageNamed:@"7.png"],
                            [UIImage imageNamed:@"8.png"],
                            [UIImage imageNamed:@"9.png"],
                            [UIImage imageNamed:@"10.png"],
                            [UIImage imageNamed:@"11.png"],
                            [UIImage imageNamed:@"12.png"],
                            [UIImage imageNamed:@"13.png"],
                            [UIImage imageNamed:@"14.png"],
                            [UIImage imageNamed:@"15.png"],
                            [UIImage imageNamed:@"16.png"],
                            [UIImage imageNamed:@"17.png"],nil];
    [SVProgressHUD setLoaingAnimationImages:imagesArray imageSize:CGSizeMake(100, 100)];
}

- (void)closeGif
{
    [SVProgressHUD setLoaingAnimationImages:nil imageSize:CGSizeZero];
}

#pragma mark - Notification Methods Sample

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidAppearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDWillDisappearNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(handleNotification:)
                                                 name:SVProgressHUDDidDisappearNotification
                                               object:nil];
}

- (void)handleNotification:(NSNotification *)notif
{
    NSLog(@"Notification recieved: %@", notif.name);
    NSLog(@"Status user info key: %@", [notif.userInfo objectForKey:SVProgressHUDStatusUserInfoKey]);
}


#pragma mark - Show Methods Sample

- (IBAction)btnSwitchGif:(UISwitch *)btnSwitch
{
    if (btnSwitch.on) {
        [self openGif];
    }else {
        [self closeGif];
    }
}

- (void)show {
	[SVProgressHUD show];
}

- (void)showWithStatus {
	[SVProgressHUD showWithStatus:@"Doing Stuff"];
}

static float progress = 0.0f;

- (IBAction)showWithProgress:(id)sender {
    progress = 0.0f;
    [SVProgressHUD showProgress:0 status:@"Loading"];
    [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3f];
}

- (void)increaseProgress {
    progress+=0.1f;
    [SVProgressHUD showProgress:progress status:@"Loading"];

    if(progress < 1.0f)
        [self performSelector:@selector(increaseProgress) withObject:nil afterDelay:0.3f];
    else
        [self performSelector:@selector(dismiss) withObject:nil afterDelay:0.4f];
}


#pragma mark - Dismiss Methods Sample

- (void)dismiss {
	[SVProgressHUD dismiss];
}

- (IBAction)dismissInfo{
    [SVProgressHUD showInfoWithStatus:@"Useful Information."];
}

- (void)dismissSuccess {
	[SVProgressHUD showSuccessWithStatus:@"Great Success!"];
}

- (void)dismissError {
	[SVProgressHUD showErrorWithStatus:@"Failed with Error"];
}

@end
