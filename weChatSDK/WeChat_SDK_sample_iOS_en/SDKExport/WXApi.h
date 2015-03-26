//
//  MMApi.h
//  ApiClient
//
//  Created by Tencent on 12-2-28.
//  Copyright (c) 2012 Tencent. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "WXApiObject.h"

#pragma mark - 
/*! @brief Receive and process event messages from WeChat
 *
 * Receive and process event messages from WeChat.
 * Meanwhile WeChat will switch to the third-party app.
 * WXApiDelegate is used and triggered in handleOpenURL.
 */
@protocol WXApiDelegate <NSObject>

@optional

/*! @brief Receive and process request from WeChat and call sendResp
 *
 * The third-party app receives a request from WeChat.
 * After asynchronous processing of the request.
 * sendResp should be called to send the result to WeChat.
 * Possible requests include GetMessageFromWXReq, ShowMessageFromWXReq, etc.
 * @param req Specific request contents (auto-released)
 */
-(void) onReq:(BaseReq*)req;

/*! @brief Response of sendReq from WeChat
 *
 * The third-party app receives the result from WeChat.
 * If sendReq is called, onResp will be received.
 * Possible results include SendMessageToWXResp, etc.
 * @param Specific response contents (auto-released)
 */
-(void) onResp:(BaseResp*)resp;

@end

#pragma mark -

/*! @brief WeChat API interface functions
 *
 * This class envelopes all interfaces of WeChat SDK
 */
@interface WXApi : NSObject

/*! @brief Member function of WXApi. It's used to register the third-party app in WeChat.
 *
 * It should be called whenever WeChat enables the third-party app.
 * The app will appear in Available Apps in WeChat.
 * @param appid WeChat Developer ID
 * @return Yes (success) or No (failure)
 */
+(BOOL) registerApp:(NSString *)appid;

/*! @brief A member function of WXApi, used for the application registration of third parties in WeChat client program
 *
 * Needs to be called when a third-party application starts each time. It will show in the list of available applications
 * on WeChat after the first call.
 * @param appid WeChat developer ID
 * @param appdesc Additional application description, no longer than 1024 bytes
 * @return Return ‘YES’ if success, otherwise return ‘NO’.
 */
+(BOOL) registerApp:(NSString *)appid withDescription:(NSString *)appdesc;

/*! @brief Process the data transferred while WeChat enable the app through URL
 *
 * Call in application:openURL:sourceApplication:annotation: or application:handleOpenURL
 * @param url URL used to enable the app
 * @param delegate  Object of WXApiDelegate. It's used to receive messages that trigger WeChat
 * @return Yes (success) or No (failure)
 */
+(BOOL) handleOpenURL:(NSURL *) url delegate:(id<WXApiDelegate>) delegate;

/*! @brief Check whether the user has installed WeChat
 *
 * @return Yes (WeChat installed) or No (WeChat not installed)
 */
+(BOOL) isWXAppInstalled;

/*! @brief Check whether the current WeChat version supports OpenApi
 *
 * @return Yes (support) or No (do not support)
 */
+(BOOL) isWXAppSupportApi;


/*! @brief Get the current SDK version
 *
 * @return the current SDK version
 */
+(NSString *) getApiVersion;

/*! @brief Get installation URL of WeChat in iTunes
 *
 * @return strings about installation URL of WeChat
 */
+(NSString *) getWXAppInstallUrl;

/*! @brief Open WeChat
 *
 * @return Yes (success) or No (failure)
 */+(BOOL) openWXApp;

/*! @brief Send a request to WeChat and wait for onResp returned from WeChat
 *
 *The third-party app calls this function, switches to WeChat interface and
 * waits for onResp returned from WeChat. WeChat must calls onResp after the
 * asynchronous processing. Possible requests include SendMessageToWXReq, etc.
 * @param req Specific request. It should be auto-released after calling the function.
 * @return Yes (success) or No (failure)
 */

+(BOOL) sendReq:(BaseReq*)req;


/*! @brief Send the response of onReq request from WeChat and go to WeChat interface
 *
 * When this function is called, WeChat interface is open.
 * The third-party app receives onResp request from WeChat, processes this request
 * asynchronously and calls this function.
 * Possible requests include GetMessageFromWXResp, ShowMessageFromWXResp, etc.
 * @param resp Specific response. It should be auto-released after calling the function.
 * @return Yes (success) or No (failure)
 */
+(BOOL) sendResp:(BaseResp*)resp;

@end
