import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imagine_cup/Screen/category_screen.dart';
import 'package:imagine_cup/Screen/home.dart';
import 'package:imagine_cup/Screen/memo_screen.dart';
import 'package:imagine_cup/Screen/search_screen.dart';

void main() async {
  await dotenv.load();

  runApp(const MyApp(
    userId: 'userID',
  ));
}

class MyApp extends StatelessWidget {
  final String userId;
  const MyApp({super.key, required this.userId});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Imagine Cup',
          theme: ThemeData(
              primarySwatch: Colors.green,
              appBarTheme: const AppBarTheme(
                backgroundColor: Color(0xff469D7B),
              )),
          home: child,
        );
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Home(pageIndex: 0, userId: userId),
      ),
    );
  }
}
