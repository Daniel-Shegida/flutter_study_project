import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_msg/data/tcb.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final msgController = TextEditingController();
  final _controller = ScrollController();

  _buildMessage(String message) {
    return Container(
      margin: EdgeInsets.only(top: 8.0, left: 40.0, right: 40.0, bottom: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          topLeft: Radius.circular(15.0),
          bottomLeft: Radius.circular(15.0),
        ),
      ),
      child: Text(message),
    );
  }

  _buildMessageComposer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70,
      color: Theme.of(context).primaryColor,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              decoration: InputDecoration(hintText: 'Input a message'),
              controller: msgController,
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            iconSize: 25,
            color: Colors.white,
            onPressed: () {
              setState(() {
                AppDatabase().insertNewOrder(Message(
                  msg: msgController.text,
                ));
                msgController.clear();
                _controller.jumpTo(_controller.position.maxScrollExtent);
                FocusScope.of(context).unfocus();
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "study flutter project",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.grey[100],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  // child: ListView.builder(
                  //   reverse: false,
                  //   padding: EdgeInsets.only(top: 20.0),
                  //   itemCount: messages.length,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return _buildMessage(messages[index]);
                  //   },
                  // ),
                  child: StreamBuilder(
                    stream: AppDatabase().watchAllOrder(),
                    builder: (context, AsyncSnapshot<List<Message>> snapshot) {
                      return ListView.builder(
                        controller: _controller,
                        itemBuilder: (_, index) {
                          return _buildMessage(snapshot.data[index].msg);
                        },
                        itemCount: snapshot.data.length,
                      );
                    },
                  ),
                ),
              ),
            ),
            _buildMessageComposer(),
          ],
        ),
      ),
    );
  }
}
