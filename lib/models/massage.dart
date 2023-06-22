

class Message
{
  
 final String massage;
 final String id;

  


  Message(this.massage, this.id);
  

  factory Message.fromJson( jsonData){
    return Message(jsonData['massage'],jsonData['id']);
  }
   
  //  factory Message.fromJson( jsonData){
  //   return Message(jsonData['massage']);
  //  }
}