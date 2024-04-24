
import 'package:demo/main.dart';
import 'package:demo/comments.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<Comment> comments = List.empty();
GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
//final List<bool> _isSelectedList = List.generate(comments.length, (index) => false);

class LikesPage extends StatefulWidget {  
  @override
  _LikesPage createState() => _LikesPage();
}

class _LikesPage extends State<LikesPage> {    

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    comments = appState.favorites;

    if (appState.favorites.isEmpty) {
          return Center(
            child: Text('No favorites yet.'),
          );
    }

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
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
                      child: Text(
                        'Favorites',
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
              key: _listKey,
              itemBuilder: (context, index, animation) {
                return buildItem(context, animation, index);
              },
              //separatorBuilder: (context, index) {
              //  return Divider(
              //    height: 5.0,
              //  );
              //},
              initialItemCount: appState.favorites.length)                          
            ) 
            
        )
      ],
    );
  }

  final Tween<Offset> _offset = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  Widget buildItem(context, Animation<double> animation, index) { 
    return SlideTransition( 
      position: animation.drive(_offset), 
      child: _TweetView(context, index), 
    ); 
  } 
}

// ignore: must_be_immutable
class _TweetView extends StatefulWidget {
  BuildContext _context;
  int _index;

  _TweetView(this._context, this._index);

  BuildContext get context => _context;

  @override
  __TweetViewState createState() => __TweetViewState();

  int get index => _index;
}

class __TweetViewState extends State<_TweetView> {
  BuildContext get _context => widget._context;
  int get _index => widget._index;  

  @override
  Widget build(BuildContext context) {    

    var appState = context.watch<MyAppState>();

    return _index < comments.length ? Padding(
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
                  comments[_index].userThumb,
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
                          comments[_index].userName,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Text(
                            comments[_index].userMName,
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
                        comments[_index].commentText,
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    comments[_index].commentImage != ''
                        ? Material(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                comments[_index].commentImage,
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
                                  child: Text(comments[_index].commentCount
                                      .toString()),
                                )
                              ],
                            ),
                          ),                          
                          Expanded(
                            child: Row(
                              children: <Widget>[                             
                                IconButton(
                                  icon: appState.favorites.contains(comments[_index]) ?  Icon(Icons.favorite) : Icon(Icons.favorite_border),
                                  color: appState.favorites.contains(comments[_index]) ?  Colors.red : Colors.grey,
                                  onPressed: () {      
                                    setState(() {                                      
                                      _listKey.currentState?.removeItem(_index, (context, animation) {
                                        return SizeTransition(
                                          sizeFactor: animation,
                                          child: Card(
                                              margin: EdgeInsets.all(10),
                                              color: Colors.red,
                                              child: ListTile()
                                        ),
                                       );
                                      },
                                      duration: const Duration(milliseconds: 500));
                                    });
                                    appState.toggleFavorite(comments[_index]);                   
                                  },                                  
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text((appState.favorites.contains(comments[_index]) ? (comments[_index].loveCount + 1).toString() : comments[_index].loveCount.toString())),
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
    ) : Padding(padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),);
  }
}
