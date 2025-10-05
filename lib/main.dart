import 'package:atmos_app/data/models/weather_data.dart';
import 'package:atmos_app/presentation/pages/main.dart';
import 'package:flutter/material.dart';
import 'package:home_widget/home_widget.dart';

List<WeatherItem> getNewIndexData() {
  return [
    WeatherItem(
      iconName: 'sentiment_happy',
      indexName: 'Qualidade do Ar',
      indexValue: '25',
      status: 'Boa',
    ),
    WeatherItem(
      iconName: 'air',
      indexName: 'Vento',
      indexValue: '12 km/h',
      status: 'Moderado',
    ),
    WeatherItem(
      iconName: 'water_drop',
      indexName: 'Umidade',
      indexValue: '65%',
      status: 'Ideal',
    ),
    // ... outros itens
  ];
}

Future<void> updateWidgetData() async {
  try {
    // ADICIONE ESTA LINHA PARA VERIFICAR
    debugPrint("Enviando para o widget: 'message'");

    await HomeWidget.saveWidgetData<String>('widget_text', 'message');
    await HomeWidget.updateWidget(
      name: 'WeatherWidget',
      androidName: 'WeatherWidget',
    );
  } catch (e) {
    debugPrint('Não foi possível atualizar o widget: $e');
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await updateWidgetData();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.indigo,
      ),
      home: const MainPage(),
    );
  }
}
