import 'package:chat_ui/model/chat_item_model.dart';
import 'package:flutter/material.dart';

import '../../constant.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget({super.key,required this.height,required this.width,required this.color,required this.chatItemModel,this.onTap});
  final double height;
  final double width;
  final Color color;
  final ChatItemModel chatItemModel;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: height*0.06,
        width: width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: height*0.06,
              height: height*0.06,
              decoration: const ShapeDecoration(
                image: DecorationImage(
                  image: NetworkImage("https://via.placeholder.com/44x44"),
                  fit: BoxFit.fill,
                ),
                shape: OvalBorder(),
              ),
            ),
            SizedBox(width: width*0.07,),
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 Text(
                  '${chatItemModel.name}',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Color(0xFF292929),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: -0.50,
                  ),
                ),
                SizedBox(height: height*0.008,),
                   Container(
                     alignment: Alignment.centerLeft,
                  width: width*0.45,
                  child:  Text(
                    '${chatItemModel.lastMessage}',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF9D9D9D),
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.50,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            // SizedBox(width: width*0.07,),
            const Spacer(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('${chatItemModel.time}',style: const TextStyle(fontSize: 10,color: Colors.grey),),
                  SizedBox(height:height*0.008 ,),
                  chatItemModel.unreadMessageNumber! != 0 ? Container(
                    width: height*0.018,
                    height: height*0.018,
                    alignment: Alignment.center,
                    decoration:  ShapeDecoration(
                      color: color,
                      shape: const OvalBorder(),
                    ),
                    child:  Text(
                      '${chatItemModel.unreadMessageNumber}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        letterSpacing: -0.50,
                      ),
                    ),
                  ):Container(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
