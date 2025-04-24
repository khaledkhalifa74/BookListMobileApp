import 'package:book_list_app/core/utils/api_service.dart';
import 'package:book_list_app/core/utils/colors.dart';
import 'package:book_list_app/features/Home/data/models/book_model/authors.dart';
import 'package:book_list_app/features/Home/data/models/book_model/formats.dart';
import 'package:book_list_app/features/Home/data/models/book_model/results.dart';
import 'package:book_list_app/features/Home/presentation/views/home_view.dart';
import 'package:book_list_app/simple_bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/adapters.dart';
import 'core/utils/globals.dart' as globals;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // top status bar color
    statusBarIconBrightness: Brightness.dark,// dark icons for white background
    statusBarBrightness: Brightness.light, // for ios
    systemNavigationBarIconBrightness: Brightness.dark,// dark icons
  ));
  ApiService.init();
  await Hive.initFlutter();
  Hive.registerAdapter(ResultsAdapter());
  Hive.registerAdapter(AuthorsAdapter());
  Hive.registerAdapter(FormatsAdapter());
  Bloc.observer = SimpleBlocObserver();
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
          debugShowCheckedModeBanner: false,
          locale: Locale('en'),
          title: 'Book List',
          theme: ThemeData(
            colorScheme: const ColorScheme.light(primary: kDarkBlackColor),
            useMaterial3: true,
            textTheme: GoogleFonts.ibmPlexSansArabicTextTheme(),
            primaryColor: kDarkBlackColor,
          ),
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