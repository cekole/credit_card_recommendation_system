import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: kPrimaryColor,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_outlined,
          ),
          label: 'Ana Sayfa',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.credit_card_outlined,
          ),
          label: 'Kredi',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.file_copy_rounded,
          ),
          label: 'Karne',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_balance_wallet_outlined,
          ),
          label: 'Kart',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle_outlined,
          ),
          label: 'Bana Özel',
        ),
      ],
    );
  }
}
