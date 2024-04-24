import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yo_trade/common/blocs_and_cubits/cubit/bottom_navbar_cubit.dart';
import 'package:yo_trade/config/theme/app_theme.dart';
import 'package:yo_trade/router.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        //* Cubits
        BlocProvider(
          create: (_) => BottomNavBarCubit(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        themeMode: ThemeMode.dark,
        darkTheme: AppTheme.darkTheme,
        routes: routeMethod(),
        initialRoute: '/',
      ),
    );
  }
}
