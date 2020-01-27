import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IMessage {
  int id;
  String to;
  String time;
  List<String> conversation;

  IMessage({this.id, this.to, this.time, this.conversation});
}

List message = [
  IMessage(id: 1, to: 'Sarah', time: '2 hours', conversation: [
    "Hello Jason, how are you, it's been a long time since we last met?",
    "Oh, hi Sarah I'm have got a new job now and is going great. How about you?",
    "Not too bad.",
    "How often do you eat at this cafe?",
    "This is my first time my friends kept telling me the food was great, so tonight I decided to try it. What have you been up to?",
    "I have been so busy with my new job that I have not had the time to do much else, but otherwise, me and the family are all fine.",
    "Well, I hope you and your family have a lovely meal.",
    "Yes you too."
  ]),
  IMessage(id: 1, to: 'Jenny', time: '4 days', conversation: [
    "Hello, my name is David It's nice to meet you.",
    "Hi, I'm Jenny. It's my please to meet you.",
    "Am sorry. what was your name again?",
    "Jenny.",
    "So Jenny, What do you do for a living?",
    "I work at the local school teaching English. what do you for a living?",
    "I'm also an English teacher, but am currently out of work.",
    "Sorry to hear that. It has been really nice talking to you.",
    "Yes. It was a great pleasure meeting you."
  ]),
  IMessage(id: 1, to: 'Bob', time: '1 week', conversation: [
    "Hi Jason, it's great to see you again.",
    "Wow, it's great seeing you,  How long has it been? It most be more than 6 months. I'm doing good. How about you?",
    "Not too bad.",
    "What movie are you and the family going to see?",
    "I came here to see the Simpsons movie. How about you?",
    "I'm going to watch Terminator 4."
  ])
];

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _buildAppBar(),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 10),
          Column(
            children: message.map((message) => Message(message)).toList(),
          )
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text('Messages'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.archive),
          onPressed: null,
        )
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}

class Message extends StatelessWidget {
  final IMessage _message;

  Message(this._message);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('1'),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('Message Deleted'),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              message.remove(_message);
            },
            textColor: Colors.white,
          ),
          backgroundColor: Colors.red,
        ));
      },
      background: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: Colors.red,
              child: Align(
                alignment: FractionalOffset.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(_message.to),
            Text(_message.time,
                style: TextStyle(fontSize: 13, fontStyle: FontStyle.italic))
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _message.conversation.last,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/talknaija/profile.jpeg'),
        ),
        onTap: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => Conversation(_message))),
      ),
    );
  }
}

class Conversation extends StatelessWidget {
  final IMessage message;

  const Conversation(this.message);

  Widget _buildConversationBox(BuildContext context, String message, bool me) {
    return Column(
      crossAxisAlignment:
          !me ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.5),
          decoration: BoxDecoration(
              color: !me
                  ? Theme.of(context).accentColor
                  : Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(.1),
                    offset: Offset(0, 15),
                    spreadRadius: -8,
                    blurRadius: 10)
              ]),
          child: Text(
            message,
            style: TextStyle(color: !me ? Colors.white : Colors.black54),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(message.to),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                children: message.conversation
                    .asMap()
                    .map((i, c) => MapEntry(
                        i, _buildConversationBox(context, c, i % 2 == 0)))
                    .values
                    .toList(),
              ),
            ),
            Container(
              height: 70,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type your message..',
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  )
                ],
              ),
            )
          ],
        ));
  }
}
