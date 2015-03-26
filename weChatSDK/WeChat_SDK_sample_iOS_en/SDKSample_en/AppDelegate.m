//
//  AppDelegate.m
//  ApiClient
//
//  Created by Tencent on 12-2-27.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize viewController = _viewController;

- (id)init{
    if(self = [super init]){
        _scene = WXSceneSession;
    }
    return self;
}

- (void)dealloc
{
    [_window release];
    [_viewController release];
    [_sendMsgToWechatMgr release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        self.viewController = [[[SendMsgToWeChatViewController alloc] initWithNibName:@"ViewController_iPhone" bundle:nil] autorelease];
    } else {
        self.viewController = [[[SendMsgToWeChatViewController alloc] initWithNibName:@"ViewController_iPad" bundle:nil] autorelease];
    }
    
    _sendMsgToWechatMgr = [[SendMsgToWechatMgr alloc] init];
    _sendMsgToWechatMgr.viewController = self.viewController;
    self.viewController.delegate = _sendMsgToWechatMgr;
    self.window.rootViewController = self.viewController;
    [self.window makeKeyAndVisible];
    
    // Register your app
    [WXApi registerApp:@"wxd930ea5d5a258f4f" withDescription:@"demo 2.0"];
    
    return YES;
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    return  [WXApi handleOpenURL:url delegate:_sendMsgToWechatMgr];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
{
    return  [WXApi handleOpenURL:url delegate:_sendMsgToWechatMgr];
}

- (void)applicationWillResignActive:(UIApplication *)application
{
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
}

- (void)applicationWillTerminate:(UIApplication *)application
{
}

@end
