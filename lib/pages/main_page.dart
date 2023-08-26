import 'package:animations/animations.dart';
import 'package:boardify/pages/home/home_page.dart';
import 'package:boardify/pages/task/task_page.dart';
import 'package:boardify/profiles/profile_page.dart';
import 'package:boardify/providers/app_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../utils/constant.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(
      create: (context) => AppProviders(),
      child: Consumer<AppProviders>(
        builder: (context, index, _) => Scaffold(
          body: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) =>
                FadeThroughTransition(
              animation: primaryAnimation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            ),
            child: pageList[index.pageIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedItemColor: mainBlue,
            currentIndex: index.pageIndex,
            items: bottomNavigationBarItem,
            onTap: (value) =>
                context.read<AppProviders>().changePageIndex(value),
          ),
        ),
      ),
    );
  }

  final List<Widget> pageList = [
    HomePage(),
    const TaskPage(),
    ProfilePage(),
  ];

  List<BottomNavigationBarItem> get bottomNavigationBarItem {
    return [
      const BottomNavigationBarItem(
        icon: Icon(Icons.home_rounded),
        label: "Beranda",
      ),
      BottomNavigationBarItem(
        label: "Task",
        icon: SvgPicture.asset(
          'assets/svg/task.svg',
          colorFilter: const ColorFilter.mode(
            Colors.black,
            BlendMode.srcIn,
          ),
        ),
        activeIcon: SvgPicture.asset(
          'assets/svg/task.svg',
          colorFilter: const ColorFilter.mode(
            mainBlue,
            BlendMode.srcIn,
          ),
        ),
      ),
      const BottomNavigationBarItem(
        label: "Profil",
        icon: Icon(CupertinoIcons.person),
      ),
    ];
  }
}
