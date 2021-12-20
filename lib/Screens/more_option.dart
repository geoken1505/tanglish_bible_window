import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:untitled/Screens/contact.dart';
import 'package:untitled/Screens/privacy.dart';
import 'package:untitled/Screens/webview.dart';
import 'package:untitled/Screens/feedback.dart';
import 'package:untitled/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'notes.dart';

class MoreOptions extends StatefulWidget {
  const MoreOptions({Key? key}) : super(key: key);

  @override
  _MoreOptionsState createState() => _MoreOptionsState();
}

class _MoreOptionsState extends State<MoreOptions> {

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black12,
          body:  Container(
            child: Column(
              children: <Widget>[

                Container(height: MediaQuery.of(context).size.height-150, color: Colors.black26,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                        child: ListTile(
                          onTap: () async {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebviewApp()));
                          },
                          leading: Icon(Icons.info, color: Colors.white,),
                          title: Text('ABOUT US', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                        ),
                      ),
                      Divider(color: Colors.white, indent:50, endIndent: 50,),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ContactUs()));
                          },
                          leading: Icon(Icons.contact_mail, color: Colors.white,),
                          title: Text('CONTACT US', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                        ),
                      ),
                      Divider(color: Colors.white, indent:50, endIndent: 50,),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => FeedbackScreen()));
                          },
                          leading: Icon(Icons.feedback, color: Colors.white,),
                          title: Text('FEEDBACK', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                        ),
                      ),
                      Divider(color: Colors.white, indent:50, endIndent: 50,),
                      SizedBox(height: 8,),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25.0,0.0,0.0,0.0),
                        child: ListTile(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                          },
                          leading: Icon(Icons.policy, color: Colors.white,),
                          title: Text('PRIVACY POLICY', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),),
                        ),
                      ),
                      SizedBox(height: 100,),
                      Center(
                        child: Text('Version 1.0', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800, fontSize: 20),),
                      )
                    ],
                  ),
                ),

              ],
            ),
          )
      ),
    );
  }
}
