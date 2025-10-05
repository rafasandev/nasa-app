package com.example.atmos_app

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.SharedPreferences
import android.widget.RemoteViews
import es.antonborri.home_widget.HomeWidgetProvider
import com.example.atmos_app.R

class WeatherWidget : HomeWidgetProvider() {

    override fun onUpdate(context: Context, appWidgetManager: AppWidgetManager, appWidgetIds: IntArray, widgetData: SharedPreferences) {
        appWidgetIds.forEach { widgetId ->
            val views = RemoteViews(context.packageName, R.layout.weather_widget).apply {
                val text = widgetData.getString("widget_text", "Aguardando dados...")
                setTextViewText(R.id.appwidget_text, text)
            }
            appWidgetManager.updateAppWidget(widgetId, views)
        }
    }
}