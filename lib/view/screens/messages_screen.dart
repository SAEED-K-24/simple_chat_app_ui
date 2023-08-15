import 'package:chat_ui/model/model.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  MessagesScreen({super.key, required this.name, required this.colors, });
  final String name;
  final List<Color> colors;
  late double height;
  late double width;
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.sizeOf(context).height;
    width=MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.first,
        elevation: 0.0,
        title: Text(name),
        centerTitle: true,
        automaticallyImplyLeading: true,
      ),
      backgroundColor: colors.last,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: height * 0.008),
        child: Column(
          children: [
            Align(
                alignment: Alignment.center,
                child: Text('${MessagesDummyData.messages.first.time}',style: const TextStyle(fontSize: 12,color: Colors.white),)),
            ListView.builder(
              itemCount: MessagesDummyData.messages.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index){
                return Container(
                  padding: EdgeInsetsDirectional.symmetric(horizontal: width*0.018,vertical: height*0.01),
                  child: Align(
                    alignment: (MessagesDummyData.messages[index].check == Check.receive?Alignment.topLeft:Alignment.topRight),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (MessagesDummyData.messages[index].check  == Check.receive?Colors.white:colors.first),
                      ),
                      padding: EdgeInsets.all(height * 0.018),
                      child: Text('${MessagesDummyData.messages[index].content}', style: const TextStyle(fontSize: 15,),),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height*0.06,),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsetsDirectional.only(start: width * 0.015,bottom: height * 0.009,top: height * 0.009),
        height: height * 0.07,
        width: width,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Message',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: (){},
              child: Icon(Icons.message,color: colors.first,size: 18,),
              backgroundColor: colors.last.withOpacity(0.3),
              elevation: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
