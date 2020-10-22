import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walktron/controllers/controllers.dart';
import 'package:walktron/widgets/widgets.dart';

class ProfileView extends StatelessWidget {
  final controller = Get.put(ProfileController(repository: Get.find()));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 240.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
              gradient: LinearGradient(
                  colors: [Colors.indigo.shade300, Colors.indigo.shade500]),
            ),
          ),
          ListView(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50.0),
                height: 240.0,
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 40.0, right: 40.0, bottom: 10.0),
                      child: Material(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        elevation: 5.0,
                        color: Colors.white,
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 50.0,
                            ),
                            Text(
                              "Walktron",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            const SizedBox(
                              height: 16.0,
                            ),
                            Container(
                              height: 40.0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const <Widget>[
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "3.2Km",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("Distance",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "4038",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("Steps",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                  Expanded(
                                    child: ListTile(
                                      title: Text(
                                        "XXX",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text("Calories",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(fontSize: 12.0)),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const <Widget>[
                        Material(
                          elevation: 5.0,
                          shape: CircleBorder(),
                          child: CircleAvatar(
                            radius: 40.0,
                            backgroundImage: NetworkImage(
                                'https://images.unsplash.com/photo-1491897554428-130a60dd4757?ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onDoubleTap: () {
                  print('hell');
                  controller.nameEnable.toggle();
                },
                child: Obx(() => MaterialTextField(
                      enabled: controller.nameEnable.value,
                      controller: controller.name,
                      hintText: 'Name',
                      icon: Icons.person,
                      validator: (val) {
                        return;
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onDoubleTap: () {
                  print('hell');
                  controller.ageEnable.toggle();
                },
                child: Obx(() => MaterialTextField(
                      enabled: controller.ageEnable.value,
                      controller: controller.age,
                      hintText: 'Age',
                      icon: Icons.perm_camera_mic,
                      validator: (val) {
                        return;
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onDoubleTap: () {
                  print('hell');
                  controller.heightEnable.toggle();
                },
                child: Obx(() => MaterialTextField(
                      enabled: controller.heightEnable.value,
                      controller: controller.height,
                      hintText: 'height',
                      icon: Icons.person,
                      validator: (val) {
                        return;
                      },
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onDoubleTap: () {
                  print('hell');
                  controller.wieghtEnable.toggle();
                },
                child: Obx(
                  () => MaterialTextField(
                    controller: controller.weight,
                    enabled: controller.wieghtEnable.value,
                    hintText: 'weight',
                    icon: Icons.person,
                    validator: (val) {
                      return;
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const MaterialTextField(
                  icon: Icons.bedtime_sharp, hintText: 'BMI')
            ],
          ),
        ],
      ),
    );
  }
}
