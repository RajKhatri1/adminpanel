import 'package:adminpanel/screens/homescreen/controller/home_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/firebase_helper/firebase_helper.dart';
import '../model/home_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  admincontroller controller = Get.put(admincontroller());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffE38800),
          title: const Text("my shop"),
          actions:  [IconButton(onPressed: () {
            FireBaseHelper.fireBaseHelper.logut();
            Get.offAndToNamed('/signin');
          }, icon: const Icon(Icons.logout))],
        ),
        body: StreamBuilder(
          stream: FireBaseHelper.fireBaseHelper.read(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              QuerySnapshot? snapData = snapshot.data;

              controller.productList.clear();

              for (var x in snapData!.docs) {
                Map? data = x.data() as Map;

                HomeModel m1 = HomeModel(
                    Price: data['price'],
                    Name: data['name'],
                    Category: data['category'],
                    image: data['image'],
                    key: x.id);

                controller.productList.add(m1);

                print(
                    "============${data['name']} ${data['price']} ${data['category']} ${data['image']}");
              }
              return ListView.builder(
                itemCount: controller.productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 150,
                    width: double.infinity,
                    margin: const EdgeInsets.all(5),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(10),child: Image.network("${controller.productList[index].image}",fit: BoxFit.cover)),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text("${controller.productList[index].Name}"),
                        const Expanded(
                            child: SizedBox(
                          width: 10,
                        )),
                        Text("₹${controller.productList[index].Price}"),
                        IconButton(
                          icon: const Icon(
                            Icons.edit,
                            color: Colors.green,
                          ),
                          onPressed: () {
                            HomeModel h1 = HomeModel(
                              Category: controller.productList[index].Category,
                              Name: controller.productList[index].Name,
                              Price: controller.productList[index].Price,
                              image: controller.productList[index].image,
                              key: controller.productList[index].key,
                            );
                           Get.toNamed('/input');
                          },
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            FireBaseHelper.fireBaseHelper.delete(key: controller.productList[index].key);
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return const CircularProgressIndicator(
              color: Color(0xffE38800),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.toNamed('/input');
            },
            backgroundColor: const Color(0xffE38800),
            child: const Icon(
              Icons.add_outlined,
              size: 30,
            )),
      ),
    );
  }
// ListTile(
// title: Text("${controller.productList[index].Name}"),
// subtitle: Text("${controller.productList[index].Price}"),
// trailing: IconButton(
// icon: Icon(
// Icons.edit,
// color: Colors.green,
// ),
// onPressed: () {
// HomeModel h1 = HomeModel(
// Category: controller.productList[index].Category,
// Name: controller.productList[index].Name,
// Price: controller.productList[index].Price,
// key: controller.productList[index].key,
// );
// Get.toNamed('/edit', arguments: h1);
// },
// ),
// );
}
