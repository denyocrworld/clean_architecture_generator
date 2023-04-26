import 'package:flutter/material.dart';

import '../controller/user_list_controller.dart';

class UserListView extends StatefulWidget {
  const UserListView({Key? key}) : super(key: key);

  Widget build(context, UserListController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text(
                "${controller.users.length}",
                style: const TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.users.length,
                padding: EdgeInsets.zero,
                clipBehavior: Clip.none,
                itemBuilder: (context, index) {
                  var item = controller.users[index];

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          item.avatar,
                        ),
                      ),
                      title: Text(item.firstName),
                      subtitle: Text(item.email),
                    ),
                  );
                },
              ),
            ),
            // Expanded(
            //   child: QListView(
            //     futureBuilder: (page) async {
            //       return controller.getUserList();
            //     },
            //     builder: (index, item) {
            //       return Card(
            //         child: ListTile(
            //           leading: CircleAvatar(
            //             backgroundColor: Colors.grey[200],
            //             backgroundImage: NetworkImage(
            //               item["avatar"],
            //             ),
            //           ),
            //           title: Text("${item["first_name"]}"),
            //           subtitle: Text("${item["email"]}"),
            //         ),
            //       );
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  @override
  State<UserListView> createState() => UserListController();
}
