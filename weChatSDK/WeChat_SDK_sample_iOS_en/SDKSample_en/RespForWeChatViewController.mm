//
//  RespForWeChatViewController.mm
//  SDKSample
//
//  Created by Tencent on 12-4-9.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "RespForWeChatViewController.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

@implementation RespForWeChatViewController

@synthesize delegate = _delegate;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)sendTextContent
{
    if (_delegate) {
        [_delegate RespTextContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)sendImageContent
{
    if (_delegate)
    {
        [_delegate RespImageContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)sendLinkContent
{
    if (_delegate)
    {
        [_delegate RespLinkContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)sendMusicContent
{
    if (_delegate)
    {
        [_delegate RespMusicContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)sendVideoContent
{
    if (_delegate)
    {
        [_delegate RespVideoContent];
    }
    [self dismissModalViewControllerAnimated:YES];
}

- (void)sendAppContent
{
    if (_delegate)
    {
        [_delegate RespAppContent];
    }
}

- (void)sendNonGifContent
{
    if (_delegate) {
        [_delegate RespNonGifContent];
    }
}

- (void)sendGifContent
{
    if (_delegate) {
        [_delegate RespGifContent];
    }
}

- (void)sendFileContent
{
    if (_delegate) {
        [_delegate RespFileContent];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    int width = [[UIScreen mainScreen] bounds].size.width;
    int height = [[UIScreen mainScreen] bounds].size.height;
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, 135)];
    [headView setBackgroundColor:RGBCOLOR(0xe1, 0xe0, 0xde)];
    UIImage *image = [UIImage imageNamed:@"micro_messenger.png"];
    NSInteger tlx = (headView.frame.size.width -  image.size.width) / 2;
    NSInteger tly = 20;
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(tlx, tly, image.size.width, image.size.height)];
    [imageView setImage:image];
    [headView addSubview:imageView];
    [imageView release];
    
    UILabel *title = [[UILabel alloc]initWithFrame:CGRectMake(0, tly + image.size.height, width, 40)];
    [title setText:@"WeChat OpenAPI Sample Demo"];
    title.font = [UIFont systemFontOfSize:17];
    title.textColor = RGBCOLOR(0x11, 0x11, 0x11);
    title.textAlignment = UITextAlignmentCenter;
    title.backgroundColor = [UIColor clearColor];
    [headView addSubview:title];
    [title release];
    
    [self.view addSubview:headView];
    [headView release];
    
    UIView *lineView1 = [[UIView alloc] initWithFrame:CGRectMake(0, headView.frame.size.height, width, 1)]; 
    lineView1.backgroundColor = [UIColor blackColor]; 
    lineView1.alpha = 0.1f;
    [self.view addSubview:lineView1];
    [lineView1 release];
    
    UIView *lineView2 = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 1, width, 1)];
    lineView2.backgroundColor = [UIColor whiteColor];
    lineView2.alpha = 0.25f;
    [self.view addSubview:lineView2];
    [lineView2 release];
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 1, width, height - headView.frame.size.height - 2)];
    [footView setBackgroundColor:RGBCOLOR(0xef, 0xef, 0xef)];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Send text message" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, 25, 145, 40)];
    [btn addTarget:self action:@selector(sendTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"Send photo message" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(165, 25, 145, 40)];
    [btn2 addTarget:self action:@selector(sendImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"Send link message" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(10, 80, 145, 40)];
    [btn3 addTarget:self action:@selector(sendLinkContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:@"Send music message" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setFrame:CGRectMake(165, 80, 145, 40)];
    [btn4 addTarget:self action:@selector(sendMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setTitle:@"Send video message" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setFrame:CGRectMake(10, 135, 145, 40)];
    [btn5 addTarget:self action:@selector(sendVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn6 setTitle:@"Send app message" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:14]; 
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setFrame:CGRectMake(165, 135, 145, 40)];
    [btn6 addTarget:self action:@selector(sendAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn6];
    
    UIButton *btn7 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn7 setTitle:@"Send non-gif image" forState:UIControlStateNormal];
    btn7.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn7 setFrame:CGRectMake(10, 190, 145, 40)];
    [btn7 addTarget:self action:@selector(sendNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn7];
    
    UIButton *btn8 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn8 setTitle:@"Send gif image" forState:UIControlStateNormal];
    btn8.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn8 setFrame:CGRectMake(165, 190, 145, 40)];
    [btn8 addTarget:self action:@selector(sendGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn8];
    
    UIButton *btn9 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn9 setTitle:@"Send file message" forState:UIControlStateNormal];
    btn9.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn9 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn9 setFrame:CGRectMake(10, 235, 145, 40)];
    [btn9 addTarget:self action:@selector(sendFileContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn9];
    
    [self.view addSubview:footView];
    [footView release];
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation == UIInterfaceOrientationPortrait);
    } else {
        return NO;
    }
}

- (void)dealloc
{
    [super dealloc];
}

@end
