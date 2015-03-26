//
//  SendMsgToWeChatViewController.m
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "SendMsgToWeChatViewController.h"

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

#define TIPSLABEL_TAG 10086

@implementation SendMsgToWeChatViewController

@synthesize delegate = _delegate;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)onSelectSessionScene{
    [_delegate changeScene:WXSceneSession];
    
    UILabel *tips = (UILabel *)[self.view viewWithTag:TIPSLABEL_TAG];
    tips.text = @"Share Scene: Contact";
}

- (void)onSelectTimelineScene{
    [_delegate changeScene:WXSceneTimeline];
    
    UILabel *tips = (UILabel *)[self.view viewWithTag:TIPSLABEL_TAG];
    tips.text = @"Share Scene: Moments";
}

- (void)sendTextContent
{
    if (_delegate) {
        [_delegate sendTextContent];
    }
}

- (void)sendImageContent
{
    if (_delegate)
    {
        [_delegate sendImageContent];
    }
}

- (void)sendLinkContent
{
    if (_delegate)
    {
        [_delegate sendLinkContent];
    }
}

- (void)sendMusicContent
{
    if (_delegate)
    {
        [_delegate sendMusicContent];
    }
}

- (void)sendVideoContent
{
    if (_delegate)
    {
        [_delegate sendVideoContent];
    }
}

- (void)sendAppContent
{
    if (_delegate)
    {
        [_delegate sendAppContent];
    }
}

- (void)sendNonGifContent
{
    if (_delegate) {
        [_delegate sendNonGifContent];
    }
}

- (void)sendGifContent{
    if (_delegate) {
        [_delegate sendGifContent];
    }
}

- (void)sendAuthRequest
{
    if (_delegate)
    {
        [_delegate sendAuthRequest];
    }
}

- (void)sendFileContent
{
    if (_delegate) {
        [_delegate sendFileContent];
    }
}

- (void)onSegmentdControlChanged:(id)sender {
    if ([sender selectedSegmentIndex] == 0) {
        // Contact
        sendNonGIFBtn.hidden = NO;
        sendGIFBtn.hidden = NO;
        
        oAuthBtn.transform = CGAffineTransformIdentity;
        sendFileBtn.transform = CGAffineTransformIdentity;
        
        [self onSelectSessionScene];
    } else {
        // Moemnts
        sendNonGIFBtn.hidden = YES;
        sendGIFBtn.hidden = YES;
        
        oAuthBtn.transform = CGAffineTransformMakeTranslation(0, -55);
        sendFileBtn.transform = CGAffineTransformMakeTranslation(0, -55);
        
        [self onSelectTimelineScene];
    }
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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
    
    UIView *sceceView = [[UIView alloc] initWithFrame:CGRectMake(0, headView.frame.size.height + 2, width, 90)];
    [sceceView setBackgroundColor:RGBCOLOR(0xef, 0xef, 0xef)];
    
    UILabel *tips = [[UILabel alloc]init];
    tips.tag = TIPSLABEL_TAG;
    tips.text = @"Share Scene: Contact";
    tips.textColor = [UIColor blackColor];
    tips.backgroundColor = [UIColor clearColor];
    tips.textAlignment = UITextAlignmentLeft;
    tips.frame = CGRectMake(10, 5, 200, 40);
    [sceceView addSubview:tips];
    [tips release];
    
    UISegmentedControl * aSegmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Contact", @"Moments", nil]];
    aSegmentedControl.frame = CGRectMake(0, 45, 320, 29);
    aSegmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
    [aSegmentedControl addTarget:self action:@selector(onSegmentdControlChanged:) forControlEvents:UIControlEventValueChanged];
    aSegmentedControl.selectedSegmentIndex = 0;
    [self onSelectSessionScene];
    [sceceView addSubview:aSegmentedControl];
    [aSegmentedControl release];
    [self.view addSubview:sceceView];
    [sceceView release];
    
    UIView *lineView3 = [[UIView alloc] initWithFrame:CGRectMake(0, headView.frame.size.height + 2 + sceceView.frame.size.height, width, 1)];
    lineView3.backgroundColor = [UIColor blackColor];
    lineView3.alpha = 0.1f;
    [self.view addSubview:lineView3];
    [lineView3 release];
    
    UIView *lineView4 = [[UIView alloc]initWithFrame:CGRectMake(0, headView.frame.size.height + 2 + sceceView.frame.size.height + 1, width, 1)];
    lineView4.backgroundColor = [UIColor whiteColor];
    lineView4.alpha = 0.25f;
    [self.view addSubview:lineView4];
    [lineView4 release];
    
    UIScrollView *footView = [[UIScrollView alloc]initWithFrame:CGRectMake(0,
                                                                           headView.frame.size.height + 2 + sceceView.frame.size.height + 2,
                                                                           width,
                                                                           height - headView.frame.size.height - 2 - sceceView.frame.size.height - 2)];
    [footView setBackgroundColor:RGBCOLOR(0xef, 0xef, 0xef)];
    footView.contentSize = CGSizeMake(width, height);
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"Send text message" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setFrame:CGRectMake(10, 10, 145, 40)];
    [btn addTarget:self action:@selector(sendTextContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn];
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn2 setTitle:@"Send photo message" forState:UIControlStateNormal];
    btn2.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 setFrame:CGRectMake(165, 10, 145, 40)];
    [btn2 addTarget:self action:@selector(sendImageContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn2];
    
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn3 setTitle:@"Send link message" forState:UIControlStateNormal];
    btn3.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn3 setFrame:CGRectMake(10, 65, 145, 40)];
    [btn3 addTarget:self action:@selector(sendLinkContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn3];
    
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn4 setTitle:@"Send music message" forState:UIControlStateNormal];
    btn4.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 setFrame:CGRectMake(165, 65, 145, 40)];
    [btn4 addTarget:self action:@selector(sendMusicContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn4];
    
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn5 setTitle:@"Send video message" forState:UIControlStateNormal];
    btn5.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 setFrame:CGRectMake(10, 120, 145, 40)];
    [btn5 addTarget:self action:@selector(sendVideoContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn5];
    
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn6 setTitle:@"Send app message" forState:UIControlStateNormal];
    btn6.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 setFrame:CGRectMake(165, 120, 145, 40)];
    [btn6 addTarget:self action:@selector(sendAppContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:btn6];
    
    sendNonGIFBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendNonGIFBtn setTitle:@"Send non-gif image" forState:UIControlStateNormal];
    sendNonGIFBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendNonGIFBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendNonGIFBtn setFrame:CGRectMake(10, 175, 145, 40)];
    [sendNonGIFBtn addTarget:self action:@selector(sendNonGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:sendNonGIFBtn];
    
    sendGIFBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [sendGIFBtn setTitle:@"Send gif image" forState:UIControlStateNormal];
    sendGIFBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendGIFBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendGIFBtn setFrame:CGRectMake(165, 175, 145, 40)];
    [sendGIFBtn addTarget:self action:@selector(sendGifContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:sendGIFBtn];
    
    oAuthBtn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    [oAuthBtn setTitle:@"OAuth" forState:UIControlStateNormal];
    oAuthBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [oAuthBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [oAuthBtn setFrame:CGRectMake(10, 230, 145, 40)];
    [oAuthBtn addTarget:self action:@selector(sendAuthRequest) forControlEvents:UIControlEventTouchUpInside];
    //[footView addSubview:oAuthBtn];
    
    sendFileBtn = [[UIButton buttonWithType:UIButtonTypeRoundedRect] retain];
    [sendFileBtn setTitle:@"Send file message" forState:UIControlStateNormal];
    sendFileBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    [sendFileBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [sendFileBtn setFrame:CGRectMake(10, 230, 145, 40)];
    [sendFileBtn addTarget:self action:@selector(sendFileContent) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:sendFileBtn];
    
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
    [sendNonGIFBtn release];
    [sendGIFBtn release];
    
    [oAuthBtn release];
    [sendFileBtn release];
    
    [super dealloc];
}

@end
