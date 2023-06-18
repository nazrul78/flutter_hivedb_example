import 'package:flutter/material.dart';
import 'package:flutter_hivedb_example/src/config/base.dart';
import 'package:flutter_hivedb_example/src/pages/example_of_nested_list.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Example of hive DB'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              userInfoC.isLoading.value
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(),
              TextButton(
                  onPressed: () async {
                    await userInfoC.dataStoreInHive();
                  },
                  child: Text('Start the data puting')),
              TextButton(
                  onPressed: () {
                    userInfoC.getAllDataFromHive();
                  },
                  child: Text('Get All data')),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => ExampleOfNestedList());
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
