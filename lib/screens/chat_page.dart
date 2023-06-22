import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easychat/cubit/chat_cubit/chat_cubit.dart';
import 'package:easychat/models/massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_chatBuble.dart';

class ChatPage extends StatelessWidget {
  ChatPage({
    super.key,
    required this.email, 
  });
  final String email;

  List<Message> messageList = [];

  TextEditingController controller = TextEditingController();
  final ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0XFF27445e),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Chat.png',
                height: 40,
              ),
              const Text(
                'EasyChat',
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontFamily: 'Kanit',
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit,ChatState>(
                listener: (context, state) {
                 if (state is ChatSuccess)
                 {
                  messageList=state.messages;

                 }
                },
                builder: (context, state) {
                  return ListView.builder(
                    reverse: true,
                    controller: scrollController,
                    itemCount: messageList.length,
                    itemBuilder: (context, index) {
                      return messageList[index].id == email
                          ? ChatBubble(message: messageList[index])
                          : ChatBubbleforFriend(message: messageList[index]);
                    },
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.send,
                    color: Color(0xff27445d),
                  ),
                  hintText: 'Type a message',
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6))),
                ),
                onSubmitted: (data) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: data, email: email);

                  controller.clear();
                  _scrollDown();
                },
              ),
            )
          ],
        ));
  }

  void _scrollDown() {
    scrollController.animateTo(
      0,
      // scrollController.position.maxScrollExtent,
      duration: Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }
}
