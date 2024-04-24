// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yo_trade/common/blocs_and_cubits/cubit/bottom_navbar_cubit.dart';
import 'package:yo_trade/common/constants/constants.dart';
import 'package:yo_trade/config/theme/app_color.dart';
import 'package:yo_trade/features/home/screens/home_screen.dart';

class MainWrapper extends StatelessWidget {
  static const String routeName = '/';
  const MainWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(
              body:  IndexedStack(
                index: state,
                children: const[
                  HomeScreen(),
                  HomeScreen(),
                  HomeScreen(),
                  HomeScreen(),
                  HomeScreen(),
                ],
              ),
              bottomNavigationBar: SizedBox(
                height: 110,
                child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    useLegacyColorScheme: false,
                    currentIndex: state,
                    onTap: (value) {
                      BlocProvider.of<BottomNavBarCubit>(context).changeIndex(value);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('$iconAssets/ic_nav_home.svg',color:state==0?primaryColor: null),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('$iconAssets/ic_nav_trade.svg',color:state==1?primaryColor: null),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('$iconAssets/ic_nav_market.svg',color:state==2?primaryColor: null),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon:
                              SvgPicture.asset('$iconAssets/ic_nav_favorite.svg',color:state==3?primaryColor: null),
                          label: 'Home'),
                      BottomNavigationBarItem(
                          icon: SvgPicture.asset('$iconAssets/ic_nav_wallet.svg',color:state==4?primaryColor: null),
                          label: 'Home'),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
