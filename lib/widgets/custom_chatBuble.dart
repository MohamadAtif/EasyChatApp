import 'package:easychat/models/massage.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
 const ChatBubble({super.key,required this.message, });
  
 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text(
              message.massage,
                    style: TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            color: Colors.white,
                    ),
                  ),
          ),
          decoration: BoxDecoration(
            color: Color(0xff27445d),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
        ),
      ),
    );
  }
}


class ChatBubbleforFriend extends StatelessWidget {
  const ChatBubbleforFriend({super.key,required this.message});
 
 final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding:  EdgeInsets.all(8.0),
        child: Container(
          child:  Padding(
            padding:  EdgeInsets.all(8.0),
            child: Text(
            message.massage,
            style:  TextStyle(
            fontSize: 20,
            fontFamily: 'Kanit',
            color: Colors.black87,
                    ),
                  ),
          ),
          decoration:const BoxDecoration(
           color: Color(0xffb0becc),
            borderRadius:  BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
              bottomLeft: Radius.circular(18),
            ),
          ),
        ),
      ),
    );
  }
}
