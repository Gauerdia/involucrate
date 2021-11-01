import 'package:flutter/cupertino.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CommentTile extends StatelessWidget {


  // A controller for the textfield
  var textFieldControlador;
  // The date is saved as milisecondssinceepoch, this one is normal format
  late String dateFormatted;

  late Size screenSize;

  String name;
  String imageUrl;
  String content;
  int date;


  List<int> likes = [];
  int likeTestId = 0000;

  CommentTile({Key? key,
    required String this.name,
    required String this.imageUrl,
    required String this.content,
    required this.date});

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

      textFieldControlador = TextEditingController();

      final df = new DateFormat('dd-MM-yyyy hh:mm a');
      dateFormatted = df.format(new DateTime.fromMillisecondsSinceEpoch(date));

      return _buildMainColumn();
  }

  /// View

  Widget _buildMainColumn(){
    try{
      return Padding(
        padding: EdgeInsets.only(top: 8.0),
        child: Card(
          color: Colors.grey[50],
          margin: EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
          child: Column(
            children: [
              _buildHeadOfPosting(),
              _buildSeparator(),
              buildPostingContent(),
            ],
          ),
        ),
      );
    }catch(e){
      print("catch buildColumn " + e.toString());
      return Container(child: Text("Sorry, an error occured."));
    }
  }
  // Builds the small picture, the name, the date and the button on the right
  Widget _buildHeadOfPosting(){
      return ListTile(
        // Leading is the Avatar-picture
        leading: GestureDetector(
          onTap: (){},
          child: Container(
            width: 40.0,
            height: 40.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.cover,
              ),

              borderRadius: BorderRadius.circular(80.0),
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
          ),
        ),
        title: Text(name),
        subtitle: Text(dateFormatted),
        // Trailing is the 3-point-icon on the right
        trailing: GestureDetector(
          onTap: (){},
          child: Icon(Icons.more_vert),
        ),
      );

  }
  // Build the part that display the text and/or the photos of the posting
  Widget buildPostingContent(){
      return ListTile(
        title: Text(content),
      );
  }
  // A simple line to separate the parts
  Widget _buildSeparator(){
      return Container(
        width: screenSize.width / 1.2,
        height: 1.0,
        color: Colors.grey,
        margin: EdgeInsets.only(top: 4.0),
      );
  }
  // Build the lower part with the likes and the comments
  Widget _buildLikesAndComments(){
      return Row(
        children: [
          Expanded(
            flex: 3,
            child: _buildLikeButton(),
          ),
          Expanded(
            flex: 10,
            child: _buildCommentButton(),
          ),
        ],
      );
  }
  // A helper function to create the like button
  Widget _buildLikeButton(){

    Icon likeButtonIcon;
    if(likes.contains(likeTestId)){
      likeButtonIcon = Icon(Icons.add_circle_outline,color: Colors.green);
    }else{
      likeButtonIcon = Icon(Icons.add_circle_outline,color: Colors.grey);
    }
      return GestureDetector(
        onTap: (){
          if(!likes.contains(likeTestId)){
            likes.add(likeTestId);
          }else{
            likes.remove(likeTestId);
          }
        },
        child: Row(
          children: [
            SizedBox(width: 5),
            likeButtonIcon,
            SizedBox(width: 3),
            Text(likes.length.toString())
          ],
        ),
      );
  }
  // A helper function to create the text that leads to the comments
  Widget _buildCommentButton(){

    try{
      return GestureDetector(
        onTap: (){

        },
        child: const ListTile(
            title: Text(" 3 comments on this post...")
        ),
      );
    }catch(e){
      print("Catch createCommentButtom: " + e.toString());
      return Container();
    }
  }


}
