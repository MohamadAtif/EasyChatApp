import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/massage.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
 
  FirebaseFirestore firestore=FirebaseFirestore.instance;
  CollectionReference massages = FirebaseFirestore.instance.collection('massages');

  void sendMessage ({required String message,required String email}){
      
               try {
  massages.add({
   'massage':message,
   'createdAt':DateTime.now(),
   'id': email,
  });
} on Exception catch (e) {
  // TODO
}
  }

  void getMessages(){
  massages.orderBy('createdAt',descending: true).snapshots().listen((event) {
      List<Message> messageList = [];
      for (var doc in event.docs) {

  messageList.add(Message.fromJson(doc));

}

      
    emit(ChatSuccess(messages: messageList));});
  }

}
