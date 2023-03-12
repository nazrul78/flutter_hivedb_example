import 'package:flutter/material.dart';
import 'package:flutter_hivedb_example/src/config/base.dart';
import 'package:get/state_manager.dart';

class HomePage extends StatelessWidget with Base {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text('Example of hive DB'),
          centerTitle: true,
          actions: [
            TextButton.icon(
                onPressed: (() {
                  homeC.getUserDataFromHiveDb();
                }),
                icon: Icon(Icons.arrow_circle_down),
                label: Text('')),
            TextButton.icon(
                onPressed: (() {
                  homeC.clearUsers();
                }),
                icon: Icon(Icons.delete),
                label: Text(''))
          ],
        ),
        body: homeC.isLoading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: homeC.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = homeC.userList[index];
                  return ListTile(
                    leading: const Icon(Icons.person),
                    trailing: Text(
                      "${user.id}",
                      style: TextStyle(color: Colors.green, fontSize: 15),
                    ),
                    title: Text("${user.name}"),
                    subtitle: Column(
                      children: [
                        Text("${user.address!.city}"),
                        Text("${user.address!.geo!.lat}"),
                      ],
                    ),
                  );
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            homeC.getUsers();
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
