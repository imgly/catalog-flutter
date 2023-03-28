package ly.img.catalog_ui.flutter

import io.flutter.embedding.android.FlutterActivity
import ly.img.android.pesdk.backend.model.config.OverlayAsset
import ly.img.android.pesdk.backend.model.state.AssetConfig
import ly.img.android.pesdk.backend.model.state.OverlaySettings
import ly.img.android.pesdk.backend.model.state.TrimSettings
import ly.img.android.pesdk.ui.model.state.UiConfigText
import ly.img.flutter.photo_editor_sdk.FlutterPESDK
import ly.img.flutter.video_editor_sdk.FlutterVESDK
import java.util.concurrent.TimeUnit

class MainActivity: FlutterActivity() {
    override fun onStart() {
        // highlight-open-closure-pesdk
        FlutterPESDK.editorWillOpenClosure = { settingsList ->
            settingsList.configure<UiConfigText> {
                // Remove first color item which is the color pipette
                it.textColorList.removeFirst()
            }
        }
        // highlight-open-closure-pesdk
        // highlight-open-closure-vesdk
        FlutterVESDK.editorWillOpenClosure = { settingsList ->
            settingsList.configure<UiConfigText> {
                // Remove first color item which is the color pipette
                it.textColorList.removeFirst()
            }
        }
        // highlight-open-closure-vesdk
        // highlight-export-closure-pesdk
        FlutterPESDK.editorWillExportClosure = {
            // Add an overlay to the image
            val overlay = it[AssetConfig::class].getAssetById(OverlayAsset::class.java, "imgly_overlay_golden")!!
            it[OverlaySettings::class].overlayAsset = overlay
        }
        // highlight-export-closure-pesdk
        // highlight-export-closure-vesdk
        FlutterVESDK.editorWillExportClosure = {
            // Set a custom trim time
            it[TrimSettings::class].setStartTime(2, TimeUnit.SECONDS)
            it[TrimSettings::class].setEndTime(3, TimeUnit.SECONDS)
        }
        // highlight-export-closure-vesdk
        super.onStart()
    }
}
