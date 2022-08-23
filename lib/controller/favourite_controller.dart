import 'package:favourite/models/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

class FavouriteController extends GetxController {
  // final List _favourites = [].obs;
  bool isSelected = false;

  List<User> mainList = [
    User(id: 1, name: "phani"),
    User(id: 2, name: "mouli"),
    User(id: 3, name: "ranadeep"),
  ];

  List<User> favList = [];

  // Future<String> Fav_color() async {

  // }

  // String getValues(){
  //   return _favourites[List];
  // }
  void toggle(User user) {
    if (favList.contains(user)) {
      //remove from favlist
      favList.remove(user);
      update();
    } else {
      //add to favlist
      favList.add(user);
      update();
    }
    // if (!isSelected) {
    //   favList.addAll(mainList.where((element) => element.id == user.id));
    //   update();
    // } else {
    //   favList.remove(user);
    //   update();
    // }
    // isSelected = !isSelected;
    // update();

    // print(favList);
  }
}
