import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app_new/src/pages/home_page.dart';
import 'package:flutter_ecommerce_app_new/src/pages/shopping_cart_page.dart';
import 'package:flutter_ecommerce_app_new/src/themes/theme.dart';
import 'package:flutter_ecommerce_app_new/src/widgets/BottomNavigationBar/bottom_navigation_bar.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isHomePageSelected = true;

  void onBottomIconPressed(int index) {
    if (index == 0 || index == 1) {
      setState(() {
        isHomePageSelected = true;
      });
    } else {
      setState(() {
        isHomePageSelected = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false, // biar AppBar bisa sampai status bar
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                height: AppTheme.fullHeight(context) - 50,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xfffbfbfb), Color(0xfff7f7f7)],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 200),
                        switchInCurve: Curves.easeInToLinear,
                        switchOutCurve: Curves.easeOutBack,
                        child: isHomePageSelected
                            ? const HomePage(key: ValueKey('home'))
                            : Align(
                                alignment: Alignment.topCenter,
                                child: ShoppingCartPage(),
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: CustomBottomNavigationBar(
                onIconPresedCallback: onBottomIconPressed,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
