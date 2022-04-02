package com.smartElectronic.flutter_weather

import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Context
import android.os.Build
import android.widget.Toast
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    companion object{
        const val CHANNEL = "com.smartElectronic.flutter_weather"
        const val NATIVE_KEY = "showNotification"
        const val NATIVE_TOAST_KEY = "showToast"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler{call, result->
            
            if(call.method == NATIVE_KEY){
                createNotificationChannel(call.argument("title"))
                result.success("working")
            }else if(call.method == NATIVE_TOAST_KEY){
                Toast.makeText(context, call.argument("message"), Toast.LENGTH_SHORT).show()
            }
            else{
                result.notImplemented()
            }
        }
    }

    private fun createNotificationChannel(title: String?) {
        // Create the NotificationChannel, but only on API 26+ because
        // the NotificationChannel class is new and not in the support library
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val name = "basic"
            val descriptionText = "test"
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel("3", name, importance).apply {
                description = descriptionText
            }
            // Register the channel with the system
            val notificationManager: NotificationManager =
                    getSystemService(Context.NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
        }

        var builder = NotificationCompat.Builder(this, "3")
                .setSmallIcon(R.drawable.res_notification_app_icon)
                .setContentTitle(title)
                .setContentText("Much longer text that cannot fit one line...")
                .setStyle(NotificationCompat.BigTextStyle()
                        .bigText("Much longer text that cannot fit one line..."))
                .setPriority(NotificationCompat.PRIORITY_DEFAULT)


        with(NotificationManagerCompat.from(this)) {
            // notificationId is a unique int for each notification that you must define
            notify(3, builder.build())
        }

    }
}
