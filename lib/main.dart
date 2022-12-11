import 'package:bmi/controllers/bmi_controller.dart';
import 'package:bmi/controllers/url_controller.dart';
import 'package:bmi/presentation/drawer_page.dart';
import 'package:bmi/presentation/mobile/mobile_history_page.dart';
import 'package:bmi/repository/shared_repository.dart';
import 'package:bmi/shared/theme/bmi_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/home_page.dart';
import 'presentation/mobile/details_page.dart';
import 'presentation/result_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SharedRepository>(create: (_) => SharedRepository()),
        ChangeNotifierProvider(
            create: (__) => BmiController(__.read<SharedRepository>())),
        ChangeNotifierProvider(create: (context) => UrlController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BMI',
        theme: BmiTheme.theme,
        initialRoute: '/',
        routes: {
          '/': (context) => DrawerBody(),
          '/home': (context) => HomePage(),
          '/result': (context) => ResultPage(),
          '/history': (context) => HistoryPage(),
          '/details': (context) => DetailsPage()
        },
      ),
    );
  }
}
