import 'package:flutter/material.dart';
import '../state/app_state.dart';
import 'budget_screen.dart';
import 'cart_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class ShellScreen extends StatefulWidget {
  const ShellScreen({super.key});

  @override
  State<ShellScreen> createState() => _ShellScreenState();
}

class _ShellScreenState extends State<ShellScreen> {
  int _index = 0;

  static const _screens = [HomeScreen(), CartScreen(), BudgetScreen(), ProfileScreen()];

  @override
  Widget build(BuildContext context) {
    final appState = AppStateScope.of(context);
    return AnimatedBuilder(
      animation: appState,
      builder: (context, _) {
        return Scaffold(
          body: IndexedStack(index: _index, children: _screens),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _index,
            selectedItemColor: const Color(0xFF3D4FE0),
            onTap: (i) => setState(() => _index = i),
            items: [
              const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                icon: Badge(
                  label: Text('${appState.cart.length}'),
                  isLabelVisible: appState.cart.isNotEmpty,
                  child: const Icon(Icons.shopping_cart),
                ),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(icon: Icon(Icons.pie_chart), label: 'Budget'),
              const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
          ),
        );
      },
    );
  }
}
