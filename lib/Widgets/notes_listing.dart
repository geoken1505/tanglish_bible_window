import 'package:flutter/material.dart';
import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class NotesListing extends StatefulWidget {
  const NotesListing({Key? key}) : super(key: key);

  @override
  _NotesListingState createState() => _NotesListingState();
}

class _NotesListingState extends State<NotesListing> {
  @override
  Widget build(BuildContext context) {
    ScrollController _semicircleController = ScrollController();
    String title;
    return Scaffold(
      backgroundColor: Colors.black87,
      body:
      DraggableScrollbar.semicircle(
        backgroundColor: Colors.white,
        controller:_semicircleController ,
        alwaysVisibleScrollThumb: true,
            child: ListView.builder(
              controller: _semicircleController,
                itemCount: 15,
                itemBuilder: (context,index){
              return
                Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(50.0,0.0, 50.0, 0.0),
                      child: Container(
                        //alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.white
                        ),
                        height: 250,
                        width: MediaQuery.of(context).size.width-100,
                        child:
                        Padding(
                          padding: const EdgeInsets.all(25.0),
                          child:
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(('TITLE'),style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),),
                                SizedBox(height: 15,),
                                Text(('TITLE'),style: TextStyle(color: Colors.grey[700], fontSize: 18, fontWeight: FontWeight.w700),),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(8.0,110,0.0,0.0),
                                  child:  Row(
                                    children: [
                                      Icon(Icons.watch_later, color: Colors.blue,),
                                      SizedBox(width: 8,),
                                      Text('30/11/2021', style: TextStyle(color: Colors.grey[900],fontSize: 14, fontWeight: FontWeight.bold),)
                                    ],
                                  ),

                                )
                              ],
                            ),
                          ),

                        ),


                      ),
                    ),
                  ],
                ),
              );
            }),
          )

    );
  }
}

class NotesCard extends StatelessWidget {
  const NotesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
