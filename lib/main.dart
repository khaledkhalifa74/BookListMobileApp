import 'package:book_list_app/features/Home/presentation/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/utils/globals.dart' as globals;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
        builder: (context, child){
        return MaterialApp(
          locale: Locale('en'),
          title: 'Book List',
          initialRoute: HomeView.id,
          navigatorKey: globals.navigatorKey,
          routes: {
            HomeView.id: (context) => const HomeView(),
          },
        );
        }
    );
  }
}