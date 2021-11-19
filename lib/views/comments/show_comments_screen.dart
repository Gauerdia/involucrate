import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:involucrate/views/profile/comment_tile.dart';

class ShowCommentsScreen extends StatefulWidget {
  const ShowCommentsScreen({
    Key? key,
    required this.title
  }) : super(key: key);

  final String title;

  @override
  _ShowCommentsScreenState createState() => _ShowCommentsScreenState();
}

class _ShowCommentsScreenState extends State<ShowCommentsScreen> {

  List publicComments = [
    {"name": "Peter Zwegat", "imageUrl":"assets/images/profile1.jpg", "content":"I could make a cake!", "date": 1627137747159},
    {"name": "Lorenz Fischbaum", "imageUrl":"assets/images/profile2.jpg", "content":"I may contribute some chairs, if that helps", "date": 1627137943116},
    {"name": "Gertrude Meisacker", "imageUrl":"assets/images/profile_girl_1.jpg", "content":"I don't know what exactly I can do, but I am in love with the idea !", "date": 1627337747159},
  ];

  late Size screenSize;

  // A controller for the textfield to send a message
  TextEditingController _controller = TextEditingController();

  // A dynamic string to save, what the users types in to send it
  late String createChatMessageValue;

  @override
  Widget build(BuildContext context) {

    screenSize = MediaQuery.of(context).size;

    createChatMessageValue = "";

    return Scaffold(
      body: _buildMainColumn(),
      bottomSheet: _buildFooter(),
    );
  }

  Widget _buildMainColumn(){
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildPublicCommentsExample(),
        ],
      ),
    );
  }

  Widget _buildPublicCommentsExample(){

    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 32,left: 8),
              child: Text(widget.title,
                       style: const TextStyle(
                         fontSize: 30
                       ),
                     ),
              )
            ],
          ),

          for(var item in publicComments) CommentTile(name: item['name'], imageUrl: item['imageUrl'], content: item['content'], date: item['date']),
        SizedBox(height: 140,),
        ],
      ),
    );
  }

  Widget _buildFooter(){
    return Container(
      height: 120,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.25),
          border: const Border(
              top: BorderSide(
                  width: 1.0,
                  color: Colors.black
              )
          )
      ),
      child: Column(
        children: [
          SizedBox(height: 10.0),
          _buildWriteNewMessageRow(),
          _buildCreateCommentButton(),
        ],
      ),
    );
  }

  Widget _buildWriteNewMessageRow(){
    return Container(
      width: screenSize.width,
      // Row creating the search bar
      child: Align(
        alignment: FractionalOffset.bottomCenter,
        child: Row(
          children: [
            // Small image at the left
            const CircleAvatar(
              backgroundImage: AssetImage(
                  'assets/images/profile2.jpg'
              ),
              radius: 25.0,
            ),
            _buildTypeInCommentBar(),
          ],
        ),
      ),
    );
  }

  // Builds the textfield that allows to type in a new chat message
  Widget _buildTypeInCommentBar(){
    return Expanded(
      child: TextFormField(
        controller: _controller,
        decoration: const InputDecoration(
          /*
            prefixIcon: Icon(
              Icons.person,
              color: Colors.white,
            ),

           */
            border: OutlineInputBorder(
              // width: 0.0 produces a thin "hairline" border
              borderRadius: BorderRadius.all(Radius.circular(90.0)),
              borderSide: BorderSide.none,
              //borderSide: const BorderSide(),
            ),

            hintStyle: TextStyle(
                color: Colors.black,
                fontFamily: "WorkSansLight"),
            filled: true,
            fillColor: Colors.white60,
            hintText: 'Write a comment!'),
        onChanged: (text){
          createChatMessageValue = text;
        },
      ),
    );
  }
  // Creates the button to send the message
  Widget _buildCreateCommentButton(){
    return Align(
      alignment: Alignment(0.95,1),
      child: TextButton(
          onPressed: (){
            setState(() {
              dynamic temp = {"name": "Peter Zwegat", "imageUrl":"assets/images/profile1.jpg", "content":_controller.text, "date": DateTime.now().millisecondsSinceEpoch};
              publicComments.add(temp);
            });
          },
          style: TextButton.styleFrom(
            primary: Colors.white,
            backgroundColor: Colors.orangeAccent,
            onSurface: Colors.grey,
          ),
          child: Text("Send Message!")),
    );
  }

}
