import 'package:demo/main.dart';
import 'package:demo/comments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Comments comments = Comments();
//final List<bool> _isSelectedList = List.generate(comments.comments.length, (index) => false);
var favorites = <Comment>[];

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //app bar
        Material(
          elevation: 5.0,
          color: Colors.white,
          child: Container(
            height: 56.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: <Widget>[
                  //Profile icon
                  Container(
                    height: 40.0,
                    width: 40.0,
                    //color: Colors.blue,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),                      
                      child: Container(                        
                        child: Image.asset("assets/donald.png"),
                      ),
                    ),
                  ),
                  //Header text
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        'Home',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),                  
                ],
              ),
            ),
          ),
        ),        
        Expanded(
          child: Container(
            color: const Color(0xFFF5F5F5),
            child: AnimatedList(
              itemBuilder: (context, index, animation) {
                return _CommentView(context, index);
              },
              //separatorBuilder: (context, index) {
              //  return Divider(
              //    height: 5.0,
              //  );
              //},
              initialItemCount: comments.comments.length)
            )
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class _CommentView extends StatefulWidget {
  BuildContext _context;
  int _index;

  _CommentView(this._context, this._index);

  BuildContext get context => _context;

  @override
  __CommentViewState createState() => __CommentViewState();

  int get index => _index;
}

class __CommentViewState extends State<_CommentView> {
  BuildContext get _context => widget._context;
  int get _index => widget._index;  

  @override
  Widget build(BuildContext context) {    
    var appState = context.watch<MyAppState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        color: const Color(0xFFF5F5F5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  comments.comments[_index].userThumb,
                  height: 40,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          comments.comments[_index].userName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            comments.comments[_index].userMName,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        comments.comments[_index].commentText,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    comments.comments[_index].commentImage != ''
                        ? Material(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                comments.comments[_index].commentImage,
                                height: 150.0,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : SizedBox(height: 0.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 0.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.add_comment, 
                                  color: Colors.grey
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(comments.comments[_index].commentCount
                                      .toString()),
                                )
                              ],
                            ),
                          ),                          
                          Expanded(
                            child: Row(
                              children: <Widget>[                             
                                IconButton(
                                  icon: appState.favorites.contains(comments.comments[_index]) ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
                                  color: appState.favorites.contains(comments.comments[_index]) ?  Colors.red : Colors.grey,
                                  onPressed: () {                                    
                                    setState(() {                                      
                                      appState.toggleFavorite(comments.comments[_index]);
                                    });
                                  },                                  
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text((appState.favorites.contains(comments.comments[_index]) ? (comments.comments[_index].loveCount + 1).toString() : comments.comments[_index].loveCount.toString())),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Icon(
                              Icons.share,
                              color: Colors.grey,
                              size: 20.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
