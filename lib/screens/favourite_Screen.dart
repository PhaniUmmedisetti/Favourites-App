import 'package:favourite/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/favourite_controller.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites Screen"),
        actions:<Widget>[
          
          IconButton(
            onPressed: () {
              Get.to(() => const MyHomePage());
            },
            icon: const Icon(
              Icons.home,
            ),
          )
        ],
      ),
      body: GetBuilder<FavouriteController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.favList.length,
          itemBuilder: (context, index) {
            return ListTile(
              key: ValueKey(controller.favList[index]),
              leading: Text("${index + 1}. "),
              trailing: InkWell(
                child: controller.favList.contains(controller.favList[index])
                    ? const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : const Icon(
                        Icons.favorite_border_outlined,
                        // color: Colors.red,
                      ),
                onTap: () {
                  controller.toggle(
                    controller.favList[index],
                  );
                },
              ),
              title: Text(controller.favList[index].name),
            );
          },
        );
      }),
    );
  }
}
