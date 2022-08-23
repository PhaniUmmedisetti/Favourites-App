import 'package:favourite/controller/favourite_controller.dart';
import 'package:favourite/screens/favourite_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites app"),
        centerTitle: true,
        actions: <Widget>[
          
          IconButton(
            onPressed: () {
              Get.to(() => const FavouriteScreen());
            },
            icon: const Icon(
              Icons.favorite,
            ),
          )
        ],
      ),
      body: GetBuilder<FavouriteController>(builder: (controller) {
        return ListView.builder(
          itemCount: controller.mainList.length,
          itemBuilder: (context, index) {
            return ListTile(
              key: ValueKey(controller.mainList[index]),
              leading: Text("${index + 1}. "),
              trailing: InkWell(
                child: controller.favList.contains(controller.mainList[index])
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
                    controller.mainList[index],
                  );
                },
              ),
              title: Text(controller.mainList[index].name),
            );
          },
        );
      }),
    );
  }
}

// return ListTile(
//                 leading: const Icon(Icons.list),
//                 trailing: const Text(
//                   "GFG",
//                   style: TextStyle(color: Colors.green, fontSize: 15),
//                 ),
//                 title: Text("List item $index"));