import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';


class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  @override
  //Reads the Json key that enables dialogflow agent from custom chatbot
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text('MultiBot'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Column(
        children: [
          Expanded(child: MessagesScreen(messages: messages)),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            color: Colors.grey,
            child: Row(
              children: [
                Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        hintText: "Enter Your Message",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        )
                      ),
                      controller: _controller,
                      style: const TextStyle(color: Colors.white),
                    )),
                IconButton(
                    onPressed: () {
                      sendMessage(_controller.text);
                      _controller.clear();
                    },
                    color: Colors.white,
                    icon: const Icon(Icons.send))
              ],
            ),
          )
        ],
      ),
    );
  }


  sendMessage(String text) async {
    if (text.isEmpty) {
      if (kDebugMode) {
        print('Message is empty');
      }
//User sends message
    } else {
      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });
//Dialog Flowtter will detect the Intent from User Message and Respond
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));
      if (response.message == null) return;
      setState(() {
        addMessage(response.message!);
      });
    }
  }

//Handles both User Message and The Dialogflow Bot Message
  addMessage(Message message, [bool userMessage = false]) {
    messages.add({'message': message,
                  'UserMessage': userMessage});
  }
}

class MessagesScreen extends StatefulWidget {
  final List messages;
  const MessagesScreen({Key? key, required this.messages}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}


class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: widget.messages[index]['UserMessage']
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(
                            20,
                          ),
                          topRight: const Radius.circular(20),
                          bottomRight: Radius.circular(
                              widget.messages[index]['UserMessage'] ? 0 : 20),
                          topLeft: Radius.circular(
                              widget.messages[index]['UserMessage'] ? 20 : 0),
                        ),
                        color: widget.messages[index]['UserMessage']
                            ? Colors.grey
                            : Colors.white),
                    constraints: BoxConstraints(maxWidth: w * 2 / 3),
                    child:
                    Text(widget.messages[index]['message'].text.text[0])),
              ],
            ),
          );
        },
        separatorBuilder: (_, i) => const Padding(padding: EdgeInsets.only(top: 10)),
        itemCount: widget.messages.length);
  }
}