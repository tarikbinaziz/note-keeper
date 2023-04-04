import 'package:flutter/material.dart';
import 'package:note_keeper/screens/notes_details.dart';

class NotesListHome extends StatelessWidget {
   NotesListHome({Key? key}) : super(key: key);

  var count;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteDetails()));
      },child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: count,
          itemBuilder: (_,index){
          return Card(
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.yellow,
                child: Icon(Icons.keyboard_arrow_right),
              ),
              title: Text("dummy"),
              subtitle: Text("dummy"),
              trailing: Icon(Icons.delete,color: Colors.red,),
              onTap: (){},

            ),
          );
          }),
    );
  }
}
