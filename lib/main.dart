import 'dart:html';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:hovering/hovering.dart';
import 'package:flutter_dropdown/flutter_dropdown.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'pinterstITW',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.purple[100],
        appBar: GFAppBar(
          leading: MaterialButton(
            hoverColor: Colors.blue[50],
            padding: EdgeInsets.all(8.0),
            textColor: Colors.white,
            splashColor: Colors.greenAccent,
            elevation: 8.0,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Images/25.png'),
                    fit: BoxFit.cover),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
              ),
            ),
            // ),
            onPressed: () {
              print('Tapped');
            },
          ),
          backgroundColor: Colors.transparent,
          title: Row(
            children: <Widget>[
              Container(
                  width: 80,
                  height: 50,
                  child: FlatButton(
                    onPressed: () {},
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 50,
                      child: Text(
                        "HOME",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    hoverColor: Colors.red[50],
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  )),
              Container(
                width: 80,
                height: 50,
                child: FlatButton(
                  onPressed: () {},
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 50,
                    child: Text(
                      "TODAY",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  hoverColor: Colors.red[50],
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
              ),
              Container(
                  width: 800,
                  alignment: Alignment.center,
                  child: HoverCrossFadeWidget(
                    firstChild: Opacity(
                      opacity: 0.9,
                      child: GFSearchBar(
                        searchBoxInputDecoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            hintText: "Search here ...",
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                        searchList: list,
                        searchQueryBuilder: (query, list) {
                          return list
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        },
                        overlaySearchListItemBuilder: (item) {
                          return Container(
                            color: Colors.grey[400],
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        },
                        onItemSelected: (item) {
                          setState(() {
                            print('$item');
                          });
                        },
                      ),
                    ),
                    secondChild: Opacity(
                      opacity: 1,
                      child: GFSearchBar(
                        searchBoxInputDecoration: InputDecoration(
                            fillColor: Colors.blueGrey[50],
                            filled: true,
                            hintText: "Search here ...",
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0)))),
                        searchList: list,
                        searchQueryBuilder: (query, list) {
                          return list
                              .where((item) => item
                                  .toLowerCase()
                                  .contains(query.toLowerCase()))
                              .toList();
                        },
                        overlaySearchListItemBuilder: (item) {
                          return Container(
                            color: Colors.grey[400],
                            padding: const EdgeInsets.all(20),
                            child: Text(
                              item,
                              style: const TextStyle(fontSize: 18),
                            ),
                          );
                        },
                        onItemSelected: (item) {
                          setState(() {
                            print('$item');
                          });
                        },
                      ),
                    ),
                    duration: Duration(milliseconds: 300),
                  )),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              onPressed: () {},
              child: Icon(Icons.add_a_photo),
              hoverColor: Colors.red[50],
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              hoverColor: Colors.red[50],
              onPressed: () {},
              child: Icon(Icons.message_rounded),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            FlatButton(
              hoverColor: Colors.red[50],
              onPressed: () {},
              child: Icon(Icons.person),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            HoverContainer(
              child: DropDownList2(),
            ),
            //Add a drop down here
          ],
        ),
        body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                Expanded(
                    child: StaggeredGridView.countBuilder(
                        itemCount: _imageList.length,
                        crossAxisCount: 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        itemBuilder: (context, index) => new Container(
                                child: HoverCrossFadeWidget(
                              firstChild: ImageCard(
                                imageData: _imageList[index],
                              ),
                              secondChild: ImageCard2(
                                imageData: _imageList[index],
                              ),
                              duration: Duration(milliseconds: 300),
                            )),
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1)))
              ])),
        ));
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        imageData.imageUrl,
        fit: BoxFit.cover,
      ),
    );
  }
}

class ImageCard2 extends StatelessWidget {
  const ImageCard2({this.imageData});

  final ImageData imageData;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(
              imageData.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  child: FlatButton(
                    hoverColor: Colors.red[50],
                    onPressed: () {},
                    child: Icon(
                      Icons.save_alt_rounded,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: FlatButton(
                    hoverColor: Colors.red[50],
                    onPressed: () {},
                    child: Icon(
                      Icons.link_rounded,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: FlatButton(
                    hoverColor: Colors.red[50],
                    onPressed: () {},
                    child: Icon(
                      Icons.share_rounded,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: FlatButton(
                    hoverColor: Colors.red[50],
                    onPressed: () {},
                    child: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    ),
                    shape: CircleBorder(
                        side: BorderSide(color: Colors.transparent)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ImageData {
  final String id;
  final String imageUrl;

  const ImageData({
    @required this.id,
    @required this.imageUrl,
  });
}

const _imageList = [
  ImageData(
    id: 'id-001',
    imageUrl: 'assets/Images/1.jpg',
  ),
  ImageData(
    id: 'id-002',
    imageUrl: 'assets/Images/5.jpg',
  ),
  ImageData(
    id: 'id-004',
    imageUrl: 'assets/Images/4.jpg',
  ),
  ImageData(
    id: 'id-005',
    imageUrl: 'assets/Images/30.jpg',
  ),
  ImageData(
    id: 'id-003',
    imageUrl: 'assets/Images/3.png',
  ),
  ImageData(
    id: 'id-006',
    imageUrl: 'assets/Images/6.jpg',
  ),
  ImageData(
    id: 'id-007',
    imageUrl: 'assets/Images/7.jpg',
  ),
  ImageData(
    id: 'id-008',
    imageUrl: 'assets/Images/8.jpg',
  ),
  ImageData(
    id: 'id-009',
    imageUrl: 'assets/Images/9.jpg',
  ),
  ImageData(
    id: 'id-010',
    imageUrl: 'assets/Images/10.jpg',
  ),
  ImageData(
    id: 'id-011',
    imageUrl: 'assets/Images/2.png',
  ),
  ImageData(
    id: 'id-012',
    imageUrl: 'assets/Images/12.jpg',
  ),
  ImageData(
    id: 'id-013',
    imageUrl: 'assets/Images/13.jpg',
  ),
  ImageData(
    id: 'id-014',
    imageUrl: 'assets/Images/14.png',
  ),
  ImageData(
    id: 'id-015',
    imageUrl: 'assets/Images/15.png',
  ),
  ImageData(
    id: 'id-016',
    imageUrl: 'assets/Images/16.png',
  ),
  ImageData(
    id: 'id-017',
    imageUrl: 'assets/Images/17.png',
  ),
  ImageData(
    id: 'id-018',
    imageUrl: 'assets/Images/18.jpg',
  ),
  ImageData(
    id: 'id-019',
    imageUrl: 'assets/Images/19.png',
  ),
  ImageData(
    id: 'id-020',
    imageUrl: 'assets/Images/20.jpg',
  ),
  ImageData(
    id: 'id-021',
    imageUrl: 'assets/Images/21.png',
  ),
  ImageData(
    id: 'id-022',
    imageUrl: 'assets/Images/22.png',
  ),
  ImageData(
    id: 'id-023',
    imageUrl: 'assets/Images/23.png',
  ),
  ImageData(
    id: 'id-024',
    imageUrl: 'assets/Images/11.jpg',
  ),
  ImageData(
    id: 'id-025',
    imageUrl: 'assets/Images/1.gif',
  ),
  ImageData(
    id: 'id-026',
    imageUrl: 'assets/Images/2.gif',
  ),
  ImageData(
    id: 'id-027',
    imageUrl: 'assets/Images/3.gif',
  ),
  ImageData(
    id: 'id-028',
    imageUrl: 'assets/Images/4.gif',
  ),
];

List list = [
  "Anime",
  "Memes",
  "Quotes",
  "Cars",
];

class DropDownList extends StatefulWidget {
  @override
  _DropDownListState createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: DropdownButton<String>(
          focusColor: Colors.white,
          value: _chosenValue,
          //elevation: 5,
          style: TextStyle(color: Colors.white),
          iconEnabledColor: Colors.black,
          items: <String>[
            'HOME',
            'Today',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          hint: Text(
            "HOME",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
          ),
          onChanged: (String value) {
            setState(() {
              _chosenValue = value;
            });
          },
        ));
  }
}

class DropDownList2 extends StatefulWidget {
  @override
  _DropDownList2State createState() => _DropDownList2State();
}

class _DropDownList2State extends State<DropDownList2> {
  String _chosenValue;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      focusColor: Colors.white,
      value: _chosenValue,
      //elevation: 5,
      style: TextStyle(color: Colors.white),
      iconEnabledColor: Colors.black,
      items: <String>[
        'Add another account',
        'Unlock Buisness tools',
        ' ',
        'More Options',
        'Settings',
        'Tune your home feed',
        'Install the Windows App',
        'Get Help -->',
        'See terms and Privacy -->',
        'Logout',
      ].map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: TextStyle(color: Colors.black),
          ),
        );
      }).toList(),
      hint: Text(
        "Accounts",
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
      ),
      onChanged: (String value) {
        setState(() {
          _chosenValue = value;
        });
      },
    );
  }
}
