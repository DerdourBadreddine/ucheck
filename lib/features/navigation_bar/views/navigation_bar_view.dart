import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ucheck/core/utils/assets.dart';
import 'package:ucheck/core/utils/styles.dart';
import 'package:ucheck/features/navigation_bar/view_model/cubit/navigation_cubit.dart';

class NavigationBarView extends StatelessWidget {
  const NavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationCubit = context.watch<NavigationCubit>();
    return Scaffold(
      extendBody: true,
      body: (navigationCubit.state as NavigationInitial).currentPage,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 29, top: 0, right: 29, bottom: 29),
        child: Container(
          height: 61,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              // spreadRadius: -5,
              blurRadius: 10,
              color: Colors.black.withOpacity(0.07),
              offset: const Offset(0, 12.52),
            ),
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: BottomNavigationBar(
                currentIndex:
                    (navigationCubit.state as NavigationInitial).currentIndex,
                onTap: (int index) {
                  switch (index) {
                    case 0:
                      navigationCubit.updateIndex(index);
                      break;
                    case 1:
                      navigationCubit.updateIndex(index);
                      break;
                    case 2:
                      navigationCubit.updateIndex(index);
                      break;
                    default:
                  }
                },
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.white,
                backgroundColor: const Color(0xff0738CC).withOpacity(0.7),
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                showSelectedLabels: true,
                selectedFontSize: 0,
                items: [
                  myCustomNavigationBarItem(
                      AssetsData.iconCalendar, 'Calendar'),
                  myCustomNavigationBarItem(AssetsData.iconHome, 'Home'),
                  myCustomNavigationBarItem(AssetsData.iconProfile, 'Profile'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem myCustomNavigationBarItem(
      String pathSvg, String label) {
    return BottomNavigationBarItem(
        activeIcon: Container(
          width: 82,
          height: 61,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(51),
            color: const Color(0xff452CDD),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                pathSvg,
              ),
              Text(
                label,
                style: Styles.textStyle11,
              ),
            ],
          ),
        ),
        icon: SvgPicture.asset(pathSvg),
        label: '');
  }
}
