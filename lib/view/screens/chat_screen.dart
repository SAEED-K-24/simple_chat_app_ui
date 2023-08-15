import 'package:chat_ui/model/chat_item_model.dart';
import 'package:chat_ui/view/view.dart';
import 'package:chat_ui/constant.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  late double height;

  late double width;
  List<Color> topicColor = firstColor;

  @override
  Widget build(BuildContext context) {
     height = MediaQuery.sizeOf(context).height;
     width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: EdgeInsetsDirectional.only(top:height*0.03,start: width * 0.05,end: width*0.05, ),
              height: height * 0.30,
              width: width,
              decoration:  BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: topicColor,),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.menu,color: Colors.white,size: 30,),
                      Icon(Icons.search,color: Colors.white,size: 30,),
                    ],
                  ),
                  SizedBox(height:height *0.05,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Chats',
                        style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.w400
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            _showBottomSheet();
                          },
                          child: const Icon(Icons.color_lens_rounded,color: Colors.white,size: 30,))
                    ],
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: height * 0.20,),
              padding: EdgeInsetsDirectional.only(top: height*0.025,start: width*0.07,end: width*0.07,),
              height: height,
              width:width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadiusDirectional.only(topStart: Radius.circular(80))
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: height*0.025,),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context,index) {
                        return ChatWidget(height: height, width: width,color: topicColor[0],chatItemModel: DummyChatItemData.chats[index],onTap: ()
                        {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return MessagesScreen(name: DummyChatItemData.chats[index].name! ,colors: topicColor,);
                          },));
                        },);
                      },
                      itemCount: DummyChatItemData.chats.length,
                      separatorBuilder: (context, index) {
                        return SizedBox(height: height*0.025,);
                      },
                    ),
                    SizedBox(height: height*0.025,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _showBottomSheet(){
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        width: width,
        height: height*0.12,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal:width*0.02),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _colorContainer(colors: firstColor),
              _colorContainer(colors: secondColor,),
              _colorContainer(colors: thirdColor,),
              _colorContainer(colors: fourthColor,),
              _colorContainer(colors: fifthColor,),
              _colorContainer(colors: sixthColor,),
            ].toAddSeparator(element: SizedBox(width:width* 0.025,)).toList(),
          ),
        ),
      );
    },);
  }

Widget _colorContainer({required List<Color> colors,}){
    return InkWell(
      onTap: () {
        topicColor = colors;
        setState(() {

        });
        Navigator.of(context).pop();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: height*0.1,
            width: height*0.1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors:colors),
            ),
          ),
          topicColor == colors ? const Icon(Icons.done,color: Colors.white,):Container(),
        ],
      ),
    );
}
}

extension IterableExt on Iterable<Widget>{
  Iterable<Widget> toAddSeparator({required Widget element})sync*{
    final iterator=this.iterator;
    if(iterator.moveNext()){
      yield iterator.current;
      while(iterator.moveNext()){
        yield element;
        yield iterator.current;
      }
    }
  }
}