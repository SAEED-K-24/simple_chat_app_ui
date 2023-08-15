enum Check{
send, receive
}

class Message{
  String? content;
  String? time;
  Check? check;

  Message(this.content, this.time,this.check);
}

class MessagesDummyData{
  static List<Message> messages = [
    Message('hello','2:01 pm',Check.send),
    Message('hello','2:01 pm', Check.receive),
    Message('how do you do','2:02 pm', Check.send),
    Message('fine, what about you','2:03 pm', Check.receive),
    Message('good , do you want hang out ? ','2:06 pm', Check.send),
    Message('or you busy ?','2:06 pm', Check.send),
    Message('yes i am busy','2:06 pm', Check.receive),
    Message('sorry','2:06 pm', Check.receive),
    Message('it is okay','2:07 pm', Check.send),
    Message('bey','2:07 pm', Check.send),
    Message('bey','2:010 pm', Check.receive),
  ];
}