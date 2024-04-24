

import 'package:demo/comments.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {

  final Comment comment;
  Profile(this.comment);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: <Widget> [
            Stack(
              children: <Widget> [
                Image.asset("assets/disneyback2.jpg"),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(60),
                  child: Hero(
                    tag: comment.userThumb, 
                    child: Container(
                    height: 100.0,
                    width: 100.0,
                    //color: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200.0),
                      child: Container(                        
                        child: Image.network(
                        comment.userThumb,
                        height: 200,
                      ),
                      ),
                    ),
                    )
                  ),
                ),
              ],
            ),
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            comment.userName,
                            style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                    Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            comment.commentText,
                            style: TextStyle(fontSize: 16.0),
                          ),
                          ),                                            
                  ]
            ),
          ]
        )  
      ),      
    );
  }
}