class ChatItemModel{
  String? name;
  String? lastMessage;
  String? time;
  int? unreadMessageNumber;

  ChatItemModel(
      this.name, this.lastMessage, this.time, this.unreadMessageNumber);
}


class DummyChatItemData{
  static List<ChatItemModel> chats = [
    ChatItemModel('Jon', 'i arrived, where are you', '2:18 pm', 0),
    ChatItemModel('mohammed', 'i am fine , what about you', '5:00 am', 2),
    ChatItemModel('saeed', 'i arrived, where are you where are you where are you where are you', '2:59 am', 0),
    ChatItemModel('user', 'hello, where are you ?', '3:02 pm', 6),
    ChatItemModel('ali', 'yes, it is me', '6:18 pm', 0),
  ];
}