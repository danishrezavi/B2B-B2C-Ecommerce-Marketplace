import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/consts/consts.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shop_app/screens/chat_screen/chat_Screen.dart';
import 'package:shop_app/services/firestore_services.dart';
import 'package:shop_app/widget_common/loading_indicator.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "My Messages".text.color(darkFontGrey).semiBold.make(),
      ),
      body: StreamBuilder(
          stream: FirestoreServices.getAllMessages(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "No Messages Recieved!"
                  .text
                  .color(darkFontGrey)
                  .makeCentered();
            } else {
              var data = snapshot.data!.docs;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            color: Colors.grey.shade100,
                            child: ListTile(
                              onTap: () {
                                Get.to(
                                  () => ChatScreen(),
                                  arguments: [
                                    data[index]['friend_name'],
                                    data[index]['toId']
                                  ],
                                );
                              },
                              leading: const CircleAvatar(
                                backgroundColor: redColor,
                                child: Icon(
                                  Icons.person,
                                  color: whiteColor,
                                ),
                              ),
                              title: "${data[index]['friend_name']}"
                                  .text
                                  .semiBold
                                  .color(kPrimaryColor)
                                  .make(),
                              subtitle:
                                  "${data[index]['last_msg']}".text.make(),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }
          }),
    );
  }
}
