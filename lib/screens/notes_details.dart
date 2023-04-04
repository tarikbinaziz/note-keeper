import 'package:flutter/material.dart';

class NoteDetails extends StatelessWidget {
  NoteDetails({Key? key}) : super(key: key);

  var priority = ["high", 'low'];
  TextEditingController titleTextEditingController=TextEditingController();
  TextEditingController desTextEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            ListTile(
              title: DropdownButton(
                  items: priority.map((String stringItem) {
                    return DropdownMenuItem(
                        value: stringItem, child: Text(stringItem));
                  }).toList(),
                  onChanged: (value){}),
            ),
            TextField(
              controller: titleTextEditingController,
              onChanged: (val){},
              decoration: InputDecoration(
                hintText: "title"
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: desTextEditingController,
              onChanged: (val2){},
              decoration: InputDecoration(
                hintText: "description"
              ),
            ),
            Row(children: [
              ElevatedButton(onPressed: (){}, child: Text("Save")),
              ElevatedButton(onPressed: (){}, child: Text("Delete")),
            ],)


          ],
        ),
      ),
    );
  }
}
