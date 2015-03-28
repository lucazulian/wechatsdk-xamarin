using System;
using System.Drawing;

using Foundation;
using UIKit;
using iOSWeChatBinding;

namespace iOSWeChatExample
{
	public partial class iOSWeChatExampleViewController : UIViewController
	{
		public static readonly string APP_ID = "wx_app_id_here";

		public iOSWeChatExampleViewController (IntPtr handle) : base (handle)
		{

			WXApi.RegisterApp (APP_ID);

		}

		public override void DidReceiveMemoryWarning ()
		{
			// Releases the view if it doesn't have a superview.
			base.DidReceiveMemoryWarning ();
			
			// Release any cached data, images, etc that aren't in use.
		}

		#region View lifecycle

		public override void ViewDidLoad ()
		{
			base.ViewDidLoad ();
			
			// Perform any additional setup after loading the view, typically from a nib.

			messageButton.TouchUpInside += delegate {




				//new UIAlertView("Touch1", "TouchUpInside handled", null, "OK", null).Show();
			
			};

		}

		public override void ViewWillAppear (bool animated)
		{
			base.ViewWillAppear (animated);
		}

		public override void ViewDidAppear (bool animated)
		{
			base.ViewDidAppear (animated);
		}

		public override void ViewWillDisappear (bool animated)
		{
			base.ViewWillDisappear (animated);
		}

		public override void ViewDidDisappear (bool animated)
		{
			base.ViewDidDisappear (animated);
		}

		#endregion
	}
}

