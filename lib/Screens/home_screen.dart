import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:untitled/Screens/chapters.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    Future<List<Books>> ReadJsonData() async{
      final jsondata = await rootBundle.rootBundle.loadString('assets/json/bible_index.json');
      final list = json.decode(jsondata) as List<dynamic>;
      return list.map((e) => Books.fromJson(e)).toList();
    }
    ScrollController _semicircleController = ScrollController();


    final sreenWidth = MediaQuery.of(context).size.width;

    var screenValue= sreenWidth/250;
    return Scaffold(
      backgroundColor: Colors.black87,
      body:
      FutureBuilder(

        future: ReadJsonData(),
        builder: (context, data){
          if(data.hasError){
            return Center(child: Text("${data.error}"),);
          }
          else if (data.hasData){
            var items = data.data as List<Books>;
            return
              DraggableScrollbar.semicircle(
                backgroundColor: Colors.white,
                controller:_semicircleController ,
                alwaysVisibleScrollThumb: true,
                child: GridView.builder(
                  controller: _semicircleController,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: screenValue.floor()),
                  itemCount: items.length,
                  itemBuilder: (context, index){return
                    Container(

                      alignment: Alignment.topLeft,
                      child: Row(
                        children: <Widget>[
                          SizedBox(
                            height: 50,
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Container(

                              height: 200,
                              width: 180,
                              decoration: BoxDecoration(
                                color: Colors.white,

                                borderRadius: BorderRadius.circular(20),
                              ),

                              child:
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Chapter(bookname: items[index].tBook.toString(),)));
                                },
                                borderRadius: BorderRadius.circular(20),
                                child:
                                Material(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 8,
                                  shadowColor: Colors.black12,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.white
                                    ),

                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image.asset('assets/images/bible.png', height: 120, width: 120,),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(items[index].tBook.toString(),
                                          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,
                                              color: Colors.grey[700]
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(items[index].id.toString(),
                                          style: TextStyle(fontWeight: FontWeight.w800,fontSize: 14,
                                              color: Colors.grey[600]
                                          ),
                                        ),

                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    );},




                ),
              );
          }
          else{
            return Center(child: CircularProgressIndicator(),);
          }
        },

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
    tBook=json['Tbook'];
    eBook==json['Ebook'];
  }


}
