import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBNavigationBar extends StatelessWidget {

  final RxInt index;
  final void Function(int) onIndexChange;

  const CustomBNavigationBar({super.key,required this.index,required this.onIndexChange});


  @override
  Widget build(BuildContext context) {
    //clip react for rounded corners
    return ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),

        //bottomnavigationbar to changing main body
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.grey,
          iconSize: 25,
          currentIndex: index.value,
          onTap: onIndexChange,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "",
            ),
          ],
        ),
      );
  }
}