import UIKit
import Flutter
// highlight-import
import ImglyKit
// highlight-import
import video_editor_sdk
import photo_editor_sdk

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)

    applyNativeInterfaces()
    applyLocalization()
    applyIcons()

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func applyNativeInterfaces() {
    // highlight-configuration-vesdk
    FlutterVESDK.configureWithBuilder = { builder in
      // Disable the color pipette for the text color selection tool
      builder.configureTextColorToolController { options in
        var colors = options.availableColors
        // Remove first color item which is the color pipette
        colors.remove(at: 0)
        options.availableColors = colors
      }
    }
    // highlight-configuration-vesdk
    // highlight-editor-vesdk
    FlutterVESDK.willPresentVideoEditViewController = { videoEditViewController in
      print("Will present:", videoEditViewController)
    }
    // highlight-editor-vesdk
    // highlight-configuration-pesdk
    FlutterPESDK.configureWithBuilder = { builder in
      // Disable the color pipette for the text color selection tool
      builder.configureTextColorToolController { options in
        var colors = options.availableColors
        // Remove first color item which is the color pipette
        colors.remove(at: 0)
        options.availableColors = colors
      }
    }
    // highlight-configuration-pesdk
    // highlight-editor-pesdk
    FlutterPESDK.willPresentPhotoEditViewController = { photoEditViewController in
      print("Will present:", photoEditViewController)
    }
    // highlight-editor-pesdk
  }

  private func applyLocalization() {
    // highlight-localization-pesdk
    PESDK.localizationDictionary = [
      "en": [
        "pesdk_transform_title_name": "Crop",
        "pesdk_adjustments_title_name": "Correct",
        "pesdk_adjustments_button_reset": "Clear"
      ]
    ]
    // highlight-localization-pesdk

    // highlight-localization-vesdk
    VESDK.localizationDictionary = [
      "en": [
        "pesdk_transform_title_name": "Crop",
        "pesdk_adjustments_title_name": "Correct",
        "pesdk_adjustments_button_reset": "Clear"
      ]
    ]
    // highlight-localization-vesdk
  }

  private func applyIcons() {
    // highlight-icons-pesdk
    PESDK.bundleImageBlock = { identifier in
      if identifier == "imgly_icon_save" {
        return UIImage(named: "imgly_icon_approve_44pt")
      }
      return nil
    }
    // highlight-icons-pesdk

    // highlight-icons-vesdk
    VESDK.bundleImageBlock = { identifier in
      if identifier == "imgly_icon_save" {
        return UIImage(named: "imgly_icon_approve_44pt")
      }
      return nil
    }
    // highlight-icons-vesdk
  }
}
