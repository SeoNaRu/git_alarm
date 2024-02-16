// 전 코드
// package com.example.git_commit

// import io.flutter.embedding.android.FlutterActivity

// class MainActivity: FlutterActivity() {
// }

package nd.sheep.nd
import android.net.Uri
import io.flutter.embedding.android.FlutterActivity
import android.content.ActivityNotFoundException
import android.content.Intent
import android.util.Log
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.embedding.engine.FlutterEngine
import android.os.Bundle
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.view.FlutterMain
import android.os.Build;
import android.view.WindowManager
import com.google.android.gms.maps.MapsInitializer
import com.google.android.gms.maps.MapsInitializer.Renderer
import com.google.android.gms.maps.OnMapsSdkInitializedCallback




class MainActivity: FlutterActivity(),OnMapsSdkInitializedCallback {
    private val CHANNEL = "ndkonect.xyz/pass"

    override 
    fun onCreate(savedInstanceState: Bundle?){
        super.onCreate(savedInstanceState);
        MapsInitializer.initialize(applicationContext, Renderer.LATEST, this)
    }

    override fun onMapsSdkInitialized(renderer: MapsInitializer.Renderer) {
      when (renderer) {
        Renderer.LATEST -> Log.d("NewRendererLog", "The latest version of the renderer is used.")
        Renderer.LEGACY -> Log.d("NewRendererLog","The legacy version of the renderer is used.")
      }
    }


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when {
                // Intent 스킴 URL을 안드로이드 웹뷰에서 접근가능하도록 변환
                call.method.equals("passRequest") -> {
                    var url: String? = call.argument<String>("url")
                    val intent: Intent = Intent.parseUri(url, Intent.URI_INTENT_SCHEME)
                    result.success(intent.dataString)
                }
                
                // Intent 스킴 URL을 playStore Market URL로 변환
                call.method.equals("getMarketUrl") -> {
                    var url: String? = call.argument<String>("url")
                    val packageName = Intent.parseUri(url, Intent.URI_INTENT_SCHEME).getPackage()
                    val marketUrl = Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=$packageName"))
                    result.success(marketUrl.dataString)
                }

            }
        }
        
        
    }
}
