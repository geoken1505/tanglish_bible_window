import 'package:flutter/material.dart';

class SlideShow extends StatelessWidget {
  const SlideShow({Key? key,required this.chapter,required this.verse}) : super(key: key);
final verse;
final chapter;
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child:
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover)
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,

        floatingActionButton: FloatingActionButton.extended(

          onPressed: (){
            Navigator.pop(context);

          },
          icon: Icon(Icons.arrow_back), label: Text(''),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[400],
            ),
            height: MediaQuery.of(context).size.height-150,
            width: MediaQuery.of(context).size.width-350,
            child:
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(verse.toString().toUpperCase(), style: TextStyle(fontSize: MediaQuery.of(context).size.width/47, fontWeight: FontWeight.bold), ),
                  SizedBox(height: 30,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: MediaQuery.of(context).size.width/2,),
                      Text(chapter, style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width/54),)
                    ],
                  )
                ],
              ),
            ),

          ),
        ),
    ),
      ),
    );
  }
}
