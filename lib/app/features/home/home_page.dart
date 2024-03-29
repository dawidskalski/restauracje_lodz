import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:restauracje_lodz/app/features/home/add_opinion/add_opinion_page_content.dart';
import 'package:restauracje_lodz/app/features/home/my_account/my_account_page_content.dart';
import 'package:restauracje_lodz/app/features/home/restaurants/restaurants_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentInt = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restauracje Łódź'),
      ),
      body: Builder(
        builder: (context) {
          if (currentInt == 0) {
            return const RestaurantsPageContent();
          }
          if (currentInt == 1) {
            return AddOpinionPageContent(onSave: () {
              setState(() {
                currentInt = 0;
              });
            });
          }

          return MyAccountPageContent(email: widget.user.email);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentInt,
        onTap: (newInt) {
          setState(() {
            currentInt = newInt;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.reviews),
            label: 'Opinia',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'dodaj',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Moje konto',
          ),
        ],
      ),
    );
  }
}
