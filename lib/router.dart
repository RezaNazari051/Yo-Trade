import 'package:flutter/material.dart';
import 'package:yo_trade/common/screens/main_wrapper.dart';

Map<String , WidgetBuilder> routeMethod(){
  return <String , WidgetBuilder>{
    MainWrapper.routeName:(context) => const MainWrapper()
  };
}