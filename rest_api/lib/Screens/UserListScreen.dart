import 'package:flutter/material.dart';
import 'package:rest_api/Constants/AppStrings.dart';
import 'package:rest_api/Network/net_request.dart';

import '../Dialogs/alertDialog.dart';
import '../Objects/User.dart';
import '../Objects/UserData.dart';

class UserListScreen extends StatefulWidget {
  const UserListScreen({
    super.key,
  });
  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  UserData? userData;

  @override
  void initState() {
    getUsersData();
    super.initState();
  }

  Future<void> getUsersData() async {
    var response = await NetRequest.getUsers();
    if (response is UserData) {
      setState(() {
        userData = response;
      });
    } else {
      showAlertDialog(context, response, subtitle: "Just a test");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.usersList),
      ),
      body: showRelevantScreen(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // var response = await NetRequest.getUsers();
          // if (response is UserData) {
          // } else {
          //   showAlertDialog(context, response, subtitle: "Just a test");
          // }
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget showRelevantScreen() {
    if (userData != null) {
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: userData!.userList!.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                thickness: 3,
                color: Colors.red,
              ),
              itemBuilder: (BuildContext context, int index) {
                User user = userData!.userList![index];
                return ListTile(
                  leading: Image.network(user.avatar!),
                  title: Text(user.firstName!),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(user.lastName!),
                      Text(user.email!),
                    ],
                  ),
                  onTap: () {
                    // Do something when the item is tapped
                    print('Tapped on item $index');
                  },
                );
              },
            ),
          )
        ],
      );
    } else {
      return showLoader();
    }
  }

  getImage(String imageUrl) {
    return Image.network(
      imageUrl,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return CircularProgressIndicator(
          value: loadingProgress.expectedTotalBytes != null
              ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
              : null,
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Text('Failed to load image');
      },
    );
  }

  Widget showLoader() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Text(
              AppStrings.downlodingUsers,
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
          CircularProgressIndicator(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
