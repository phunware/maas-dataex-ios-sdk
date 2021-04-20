Data SDK
=====

The `Data SDK` enables publishers/app developers to earn PhunCoin by incorporating the SDK into their applications and engaging their users with the PhunWallet application.



In addition to contributing users to the data SDK - developers can also send app usage events for users - and earn PhunCoin when app activity is used by brands as audiences.



An easy to use dashboard in the [Phunware MaaS portal](maas.phunware.com) provides a dashboard for developers to see their balances and track engagement from their users into the ecosystem.



>  *****<sub>note</sub>***** _<br/>_

>  `Data SDK` _is currently only supported on_

- ****iOS 13.0 or greater****+.

- ****Xcode 12 or greater****+.

<a id="installation"></a>

## Using Data SDK

### ****CocoaPods Installation****



* Phunware recommends using [CocoaPods](http://www.cocoapods.org) to integrate the framework. Simply add



`pod 'DataEx'`



to your podfile.



***

<a id="usage-overview"></a>

## Usage Overview



### ****Initialization****

The Data SDK needs to be initialized each time your application is started.  In this release of the Data SDK you should initialize DataEx to use our development environment.

```Swift

DataEx.environment = .prod

```

You should initialize the Data SDK from your AppDelegate in the didFinishLaunchingWithOptions delegate method or from your Root View Controller.


## PWCore Setup

The Data SDK requires configuration of [Phunware Core SDK]((https://github.com/phunware/maas-core-ios-sdk/)) on application launch to provide application authentication with the Phunware MaaS suite and provides other built in useful features such as Analytics. In the MaaS portal, retrieve your application identifier, signature key, access key then in your application's AppDelegate, add the following into the didFinishLaunchingWithOptions delegate method:

````Swift

PWCore.setApplicationID("YOUR_APPLICATION_IDENTIFIER",

accessKey: "YOUR_ACCESS_KEY",

signatureKey: "YOUR_SIGNATURE_KEY")

````

***

## Bluetooth Permissions

Beginning in iOS 13, applications that use the devices bluetooth features need to declare the NSBluetoothAlwaysUsageDescription key in their info.plists. The Phunware Data SDK has a dependency on the Phunware Core SDK and the Core SDK needs access to bluetooth to report on bluetooth status. Thus, your application will need to include the NSBluetoothAlwaysUsageDescription if it isn't already.

## ****Tease your users****

In order for your users to claim any accrued digital assets and receive the full benefit of participating in the PhunCoin ecosystem, they will have to install the PhunWallet mobile app. Publishers who successfully get their users to generate a Wallet in the PhunWallet mobile app will earn PhunCoin for each unique user.

We provide you a colorful platform specific widget that you can display anywhere in your app to call attention to installing the PhunWallet mobile app. 

1. Add a view to a storyboard or .xib file.

2. Ensure it's class is "TeaserView"

3. Ensure it's module is "DataEx"

4. Connect the TeaserView to an IBOutlet in the ViewController of your choice.

5. Ensure this view has userInteractionEnabled set to true

6. Set the delegate of the Teaser View.

7. Implement the presentation logic for the Takeover view.

```swift
class MyViewController: UIViewController {
    // Assuming you've added the TeaserView to your nib/storyboard
    @IBOutlet weak var teaserView: TeaserView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        teaserView.delegate = self
        teaserView.userInteractionEnabled = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        teaserView.isHidden = !DataEx.isEligible
    }
}

extension MyViewController: TakeoverDelegate {
    func presentDataExTakeover(with viewController: UIViewController) {
        // Present the takeover modally, although it can be presented however you wish.
        present(viewController, animated: true, completion: nil)
    }
    
    func dismissDataExTakeover() {
        // Dismiss modal takeover
        dismiss(animated: true, completion: nil)
    }
}
```

***

Data SDK branding doesn't match your app? We gotchu.

````Swift

teaserView.buttonBackgroundColor = UIColor.red //or whatever color you want

teaserView.buttonForegroundColor = UIColor.green //^^ditto

````

## ****Eligibility****

Not all of your users will be eligible for PhunCoin (see [advertising](#advertising)).  You should check to see if the user is eligible before showing any PhunCoin branding. Simply check the DataEx static boolean. Eligibility is determined by if the user has allowed ad tracking via IDFA usage by disabling Limit Ad Tracking in the device settings.

````Swift

DataEx.isEligible

````

To summarize:

User is Eligible if they have not selected Limit Ad Tracking in their device settings.

User is not Eligible if they have selected Limit Ad Tracking in their device settings.

***

### ****Checking the user's PhunCoin balance****

You may want to display the user's current asset balance as your user accrues digital assets across the blockchain-powered, mobile-first cryptocurrency ecosystem.

When requesting an updated balance we will also return you a current digital asset branding image to display alongside the balance.

````Swift

DataEx.assetManager.balances { [weak self] result in
    DispatchQueue.main.async {
        switch result {
        case .success(let assets):
            // do something with the balances
        case .failure(let error):
            //handle failure
        }
    }
}

````

***

### **Linking to PhunWallet**
You have the option of letting your users link to the Phunware PhunWallet app; doing so will result the phuncoin balance to show up in the wallet.

```swift
if DataEx.isEligible {
    DataEx.linkManager.linkWallet { [weak self] result in
        switch result {
        case .success:
            print("PhunWallet app installed and linking is in progress.")
        case .failure(let error):
            print("PhunWallet app not installed or other failure.")
        }
    }
}
```

***

<a id="advertising"></a>

## A bit on device identifiers

### iOS

In order to use the Data SDK, the user/device must allow ad tracking via IDFA usage by disabling Limit Ad Tracking in the device settings. For more information please review [Apple's Advertising & Privacy document](https://support.apple.com/en-us/HT205223).

***

<a id="class"></a>

## Class Reference Documentation

The [Reference Documentation](https://phunware.github.io/maas-dataex-ios-sdk/) has all of the detailed usage information including all the public methods, parameters, and convenience initializers.


***

<a id="privacy"></a>

## Privacy

You understand and consent to Phunware's Privacy Policy located at www.phunware.com/privacy. If your use of Phunware's software requires a Privacy Policy of your own, you also agree to include the terms of Phunware's Privacy Policy in your Privacy Policy to your end users.

***

<a id="terms"></a>

## Terms

Use of this software requires review and acceptance of our terms and conditions for developer use located at http://www.phunware.com/terms/
