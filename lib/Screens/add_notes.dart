import 'package:flutter/material.dart';
//import 'package:untitled/Models/notesOperation.dart';
import 'package:provider/provider.dart';
class AddNotes extends StatefulWidget {
  const AddNotes({Key? key}) : super(key: key);

  @override
  _AddNotesState createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  TextEditingController _title = TextEditingController();
  TextEditingController _notes = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: Colors.white,
                    iconSize: 30,
                  ),
                  Expanded(
                      child: Center(
                          child: Text(
                            'NOTES',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          )))
                ],
              ),
            ),
            Center(
              child:
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[500],
                    borderRadius: BorderRadius.circular(24)
                  ),
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height-200,
                  width: MediaQuery.of(context).size.width-300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 10.0),
                        child: TextField(
                          controller: _title,
                          decoration: InputDecoration(
                              labelText: 'TITLE HERE...',
                              labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.white)
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      Padding(

                        padding: const EdgeInsets.fromLTRB(100.0, 0.0, 100.0, 10.0),
                        child: TextField(
                          controller: _notes,
                          keyboardType: TextInputType.multiline,
                          decoration: InputDecoration(
                              labelText: 'NOTES HERE...',
                              labelStyle: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold, color: Colors.white)
                          ),
                        ),
                      ),
                      SizedBox(height: 50,),
                      ButtonTheme(
                        minWidth: 250.0,
                        height: 60.0,
                        child: RaisedButton(onPressed: (){

                        },
                        color: Colors.blue,
                          elevation: 5,
                          
                          child: Text('SUBMIT', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
                        ),
                      )
                    ],
                  ),

                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

