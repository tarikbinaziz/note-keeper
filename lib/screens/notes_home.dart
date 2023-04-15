import 'package:flutter/material.dart';
import 'package:note_keeper/model/note_model.dart';
import 'package:note_keeper/screens/notes_details.dart';
import 'package:note_keeper/utils/db_helper.dart';

class NotesListHome extends StatefulWidget {
   NotesListHome({Key? key}) : super(key: key);

  @override
  State<NotesListHome> createState() => _NotesListHomeState();
}

class _NotesListHomeState extends State<NotesListHome> {

  DatabaseHelper databaseHelper=DatabaseHelper();
     List<NoteModel>noteList=[];
  int count=0;

  @override
  Widget build(BuildContext context) {
    if(noteList== null){
      noteList= List<NoteModel>[];
    }
    
    navigateToDetails(String title){
      return Navigator.push(context, MaterialPageRoute(builder: (context)=>NoteDetails(title)));

    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        navigateToDetails("Add Note");
      },child: Icon(Icons.add),),
      body: ListView.builder(
        itemCount: 10,
          itemBuilder: (_,index){
          return Card(
            elevation: 2,
            color: Colors.white,
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor:getPriorityColor(noteList[index].priority!),
                child: getPriorityIcon(noteList[index].priority!),
              ),
              title: Text("dummy"),
              subtitle: Text("dummy"),
              trailing: GestureDetector(child: Icon(Icons.delete,color: Colors.red,),onTap: (){
                deleteNote(context, noteList[index]);
              },),
              onTap: (){
                navigateToDetails("Edit Note");
              },

            ),
          );
          }
          ),
    );
  }
  getPriorityColor(int priority){
    switch(priority){
      case 1:
        return Colors.red;
      break;
      case 2:
        return Colors.yellow;
      break;
      default:
        return Colors.yellow;
    }
  }

  getPriorityIcon(int priority){
    switch(priority){
      case 1:
        return Icon(Icons.play_arrow);
      break;
      case 2:
        return Icon(Icons.keyboard_arrow_right);
      break;
      default:
        return Icon(Icons.keyboard_arrow_right);
    }
  }

  deleteNote(BuildContext context,NoteModel note)async{
    int result=await databaseHelper.deleteNote(note.id!);
    if(result!=0){
      showSnackbar(context,"Succesfully deleted");
    }
}
  showSnackbar(BuildContext context, String text){
    final snackbar=SnackBar(content: Text(text));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }
}
