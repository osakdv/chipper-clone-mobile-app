import 'dart:async';

import 'package:flutter/material.dart';

import './home.dart';
import './earn.dart';
import './invest.dart';
import './card.dart';
import './security.password.dart';
import '../util/color.scheme.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with WidgetsBindingObserver {
  // dashboard screens
  static final List<Widget> _dashboardScreens = <Widget>[
    const HomeScreen(),
    const EarnScreen(),
    const InvestmentScreen(),
    const CardScreen()
  ];

  static int _screenIndex = 0;

  // switch between screens
  _switchScreen(int index) {
    setState(() {
      _screenIndex = index;
    });
    // print(index);
    // print(_screenIndex);
  }

// TODO: Error: user still gets sent to the security pass page even when app lifecycle is active and countdown isn't elaspe
  // monitor if user leaves app for more than 10sec - request security code to reaccess the dashboard
  void securityPassScreen() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const SecurityPassword()));
  }

  void userAbsenceFromApp(appState, int dura) {
    bool isCountdownUp = false;
    int countdownValue = dura;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countdownValue--;
      print('app state --------- $appState');
      if (countdownValue > 0 && appState == AppLifecycleState.resumed) {
        print('countdown is false and app resumed');
        timer.cancel();
      } else if (countdownValue == 0 && appState == AppLifecycleState.paused) {
        print('countdown is true and app is still paused');
        securityPassScreen();
        timer.cancel();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    userAbsenceFromApp(state, 10);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  final pageContents = SafeArea(
    child: _dashboardScreens[_screenIndex],
  );

  @override
  Widget build(BuildContext context) {
    print('reload');
    print(_screenIndex);

    return Scaffold(
      body: SafeArea(
        child: _dashboardScreens[_screenIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
          onTap: _switchScreen,
          currentIndex: _screenIndex,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: AppColorScheme.activeInputColor,
          unselectedItemColor: Color.fromARGB(255, 68, 68, 68),
          enableFeedback: false,
          // showSelectedLabels: false,
          // showUnselectedLabels: false,

          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.circle_rounded), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.money_outlined), label: 'Earn'),
            BottomNavigationBarItem(
                icon: Icon(Icons.currency_bitcoin_outlined), label: 'Invest'),
            BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard_outlined), label: 'Card'),
          ]),
    );
  }
}
