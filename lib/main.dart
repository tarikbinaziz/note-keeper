import 'package:flutter/material.dart';
import 'package:note_keeper/screens/notes_details.dart';

import 'screens/notes_home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NoteKeeper",
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home:
       // NoteDetails()
      NotesListHome(),
    );
  }
}




