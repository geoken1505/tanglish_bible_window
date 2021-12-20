import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:untitled/Screens/slideshow.dart';
import '../Models/notes_model.dart';
import '../db/database_provider.dart';
import '../main.dart';

class Verse extends StatelessWidget {
  const Verse({Key? key, required this.versebook}) : super(key: key);
  final versebook;
  @override
  Widget build(BuildContext context) {
    Future<List<Books>> ReadJsonData() async {
      final jsondata = await rootBundle.rootBundle
          .loadString('assets/json/$versebook.json'.replaceAll(' ', ''));
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => Books.fromJson(e)).toList();
    }
    ScrollController _semicircleController = ScrollController();
    final book = versebook;
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
                    book,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  )))
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height - 120,
              child: FutureBuilder(
                future: ReadJsonData(),
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(
                      child: Text("${data.error}"),
                    );
                  } else if (data.hasData) {
                    var items = data.data as List<Books>;
                    return 
                      DraggableScrollbar.semicircle(
                        backgroundColor: Colors.white,
                        controller:_semicircleController ,
                        alwaysVisibleScrollThumb: true,
                        child: ListView.builder(
                          controller: _semicircleController,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: ListTile(
                              onLongPress: () {
                                showModalBottomSheet(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(20),
                                          topLeft: Radius.circular(20)),
                                    ),
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              "COPY",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            leading: Icon(Icons.copy),
                                            onTap: () {
                                              FlutterClipboard.copy(items[index]
                                                          .tBook
                                                          .toString() +
                                                      versebook)
                                                  .then((value) =>
                                                      Navigator.pop(context));
                                            },
                                          ),
                                          Divider(),
                                          ListTile(
                                            title: Text(
                                              "SLIDESHOW",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            leading: Icon(Icons.slideshow),
                                            onTap: () {
                                              Navigator.pop(context);
                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => SlideShow(verse: items[index].tBook.toString(), chapter: versebook,)));
                                            },
                                          ),
                                          Divider(),
                                          ListTile(
                                            title: Text(
                                              "ADD TO NOTES",
                                              style: TextStyle(
                                                  color: Colors.grey[800],
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            leading: Icon(Icons.note_add),
                                            onTap: () {
                                              var note= NoteModel(id: DateTime.now().minute+DateTime.now().microsecond+DateTime.now().millisecond,
                                                  title: '$versebook', body: items[index].tBook.toString().toUpperCase(), creation_date: DateTime.now());
                                              DatabaseProvider.db.addNewNote(note);

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      );
                                    });
                              },
                              title: Text(
                                items[index].tBook.toString().toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                    ),
                      );
                    ;
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Books {
  String? tBook;
  String? eBook;
  String? id;

  Books(this.tBook, this.eBook, this.id);
  Books.fromJson(Map<String, dynamic> json) {
    id = json['Ebook'];
    tBook = json['Verses'];
    eBook == json['Ebook'];
  }
}
