using System;

using Android.App;
using Android.Content;
using Android.Runtime;
using Android.Views;
using Android.Widget;
using Android.OS;
using Com.Tencent.MM.Sdk.Openapi;

namespace androidWeChatExample
{
	[Activity (Label = "androidWeChatExample", MainLauncher = true, Icon = "@drawable/icon")]
	public class MainActivity : Activity
	{
		public static IWXAPI wxApi;

		public static readonly string APP_ID = "wx_app_id_here";

		protected override void OnCreate (Bundle bundle)
		{
			base.OnCreate (bundle);

			wxApi = WXAPIFactory.CreateWXAPI(this,  APP_ID, true);
			wxApi.RegisterApp(APP_ID);

			// Set our view from the "main" layout resource
			SetContentView (Resource.Layout.Main);

			// Get our button from the layout resource,
			// and attach an event to it

			Button button = FindViewById<Button>(Resource.Id.myButton);
			button.Click += delegate { 

				if(wxApi.IsWXAppInstalled && wxApi.IsWXAppSupportAPI){

					SendMessageToWX.Req req;
					WXWebpageObject textObj = new WXWebpageObject();
					textObj.WebpageUrl = "http://lucazulian.it";
					WXMediaMessage msg = new WXMediaMessage();
					msg.Title = "Luca Zulian website";
					msg.Description = "Hello xamarin from wechat";

					msg.mediaObject = textObj;
					req = new SendMessageToWX.Req();
					req.Transaction = BuildTransaction("webpage");
					req.Message = msg;

					req.Scene = SendMessageToWX.Req.WXSceneSession;
					bool res = MainActivity.wxApi.SendReq(req);

					if(res){
						Console.WriteLine("successfully sent message")

					}

				}
				else{
					Toast.MakeText(this, "wxApi does not supported!", ToastLength.Long).Show();
				}

			};

		}

		private static String BuildTransaction(String type)
		{
			return (type == null) ? DateTime.Now.ToLongTimeString()
					: type + DateTime.Now.ToLongTimeString();
		}
	}
}
