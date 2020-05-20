import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/common/icons.dart';

const double CreateButtomWidth = 38.0;
Widget get customCreateIcon => Container(
      width: 45.0,
      height: 27.0,
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10.0),
            width: CreateButtomWidth,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 250, 45, 108),
              borderRadius: BorderRadius.circular(7.0),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            width: CreateButtomWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0)),
          ),
          Center(
            child: Container(
              height: double.infinity,
              width: CreateButtomWidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7.0)),
              child: Icon(
                Icons.add,
                size: 20.0,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );

BottomNavigationBar bottomItems(currentIndex, pageController) {
  return BottomNavigationBar(
    backgroundColor: Colors.black,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white,
    elevation: 0.5,
    onTap: (index) => currentIndex = index,
    // onTap: (int index) {
    //   setState(
    //     () {
    //       currentIndex = index;
    //     },
    //   );
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(DouyinIcons.home),
        title: SizedBox.shrink(),
      ),
      BottomNavigationBarItem(
          icon: Icon(DouyinIcons.search),
          title: SizedBox.shrink(),
          backgroundColor: Colors.white),
      BottomNavigationBarItem(
        icon: customCreateIcon,
        title: SizedBox.shrink(),
      ),
      BottomNavigationBarItem(
        icon: Icon(DouyinIcons.messages),
        title: SizedBox.shrink(),
      ),
      BottomNavigationBarItem(
        icon: Icon(DouyinIcons.profile),
        title: SizedBox.shrink(),
      ),
    ],
    
  );
}

// class BottomToolbar extends StatelessWidget {
//   static const double NavigationIconSize = 20.0;
//   static const double CreateButtomWidth = 38.0;

//   Widget get customCreateIcon => Container(
//         width: 45.0,
//         height: 27.0,
//         child: Stack(
//           children: [
//             Container(
//               margin: EdgeInsets.only(left: 10.0),
//               width: CreateButtomWidth,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(255, 250, 45, 108),
//                 borderRadius: BorderRadius.circular(7.0),
//               ),
//             ),
//             Container(
//               margin: EdgeInsets.only(right: 10.0),
//               width: CreateButtomWidth,
//               decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 32, 211, 234),
//                   borderRadius: BorderRadius.circular(7.0)),
//             ),
//             Center(
//               child: Container(
//                 height: double.infinity,
//                 width: CreateButtomWidth,
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(7.0)),
//                 child: Icon(
//                   Icons.add,
//                   size: 20.0,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       );

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         Icon(DouyinIcons.home, color: Colors.white, size: NavigationIconSize),
//         Icon(DouyinIcons.search, color: Colors.white, size: NavigationIconSize),
//         customCreateIcon,
//         Icon(DouyinIcons.messages,
//             color: Colors.white, size: NavigationIconSize),
//         Icon(DouyinIcons.profile,
//             color: Colors.white, size: NavigationIconSize),
//       ],
//     );
//   }
// }
