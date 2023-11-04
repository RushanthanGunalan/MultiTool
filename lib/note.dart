import 'package:flutter/material.dart';

/*Referred code From Author nithinraaj27 "Youtube"
  Author - nithinraaj27
  Date - 06/02/2022
  Website - https://www.youtube.com/watch?v=PTLrex8tmig&t=1s
 */
class note extends StatefulWidget {
  const note({Key? key}) : super(key: key);

  @override
  _noteState createState() => _noteState();
}

class _noteState extends State<note> {
  String input = "not null";

  List notes = [];
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text("Notepad",
          style: TextStyle(
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            showDialog(
                context: context,
                builder: (BuildContext context)
                {
                  return AlertDialog( //Popup Box
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                    ),
                    title: const Text("Add Note"),
                    content: TextField(
                      onChanged: (String value){
                        input = value;
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                          onPressed: (){
                            setState(() {
                              notes.add(input); //Adding Notes
                            });
                            Navigator.of(context).pop();
                          },
                          child: const Text("Add "))
                    ],
                  );
                }
            );
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
          )
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
            itemCount: notes.length,
            itemBuilder: (BuildContext context,int index){
              return Dismissible(
                key: Key(notes[index]),
                child: Card(
                  elevation:  4,
                  child: ListTile(
                    title: Text(notes[index]),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete,
                          color: Colors.grey),
                      onPressed: (){
                        setState(() {
                          notes.removeAt(index);  //Remove notes
                        });
                      },
                    ),
                  ),
                ),);
            }),
      ),
    );
  }
}