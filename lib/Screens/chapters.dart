import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:untitled/Screens/verse.dart';

import '../main.dart';

class Chapter extends StatelessWidget {
  final bookname;
  const Chapter({Key? key, this.bookname}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Future<List<Books>> ReadJsonData() async{
      final jsondata = await rootBundle.rootBundle.loadString('assets/json/$bookname.json'.replaceAll(' ', ''));
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => Books.fromJson(e)).toList();
    }
    ScrollController _semicircleController = ScrollController();

    final book = bookname;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        child:
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:   Row(
                children: <Widget>[
                  IconButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: '',)));
                  }, icon: Icon(Icons.arrow_back), color: Colors.white, iconSize: 30,),
                  Expanded( child: Center(child: Text(book, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)))
                ],
              ),
            ),
            Container(height: MediaQuery.of(context).size.height-120,
            child:
            FutureBuilder(

              future: ReadJsonData(),
              builder: (context, data){
                if(data.hasError){
                  return Center(child: Text("${data.error}", style: TextStyle(color: Colors.white),),);
                }
                else if (data.hasData){
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

                            child:
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Verse(versebook: items[index].tBook.toString(),)));

                              },
                              child: Container(
                                alignment: Alignment.centerLeft,
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child:
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>[
                                      SizedBox(width: 35,),
                                      Text(items[index].tBook.toString(), style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.black
                                      ),)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );;
                }
                else{
                  return Center(child: CircularProgressIndicator(),);
                }
              },

            ),
            )
          ],
        ),
      ),
    );
  }
}

class Books{
  String? tBook;
  String? eBook;
  String? id;

  Books(this.tBook, this.eBook, this.id);
  Books.fromJson(Map<String,dynamic> json){
    id=json['Ebook'];
    tBook=json['Chapters'];
    eBook==json['Ebook'];
  }


}