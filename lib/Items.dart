import 'package:flutter/material.dart';
import 'main.dart';
import 'NavBar.dart';
import 'Cart.dart';

class Items extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavBar(1),
      appBar: AppBar(
        title: Text('Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_basket),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
            children: [
              Line(0),
              Line(1),
              Line(2),
              Line(3),
              Line(4),
              Line(5),
              Line(6),
              Line(7),
              Line(8),
            ],
          )),
    );
  }
}

class Line extends StatelessWidget {
  @override
  int id;
  Line(int id){
    this.id=id;
  }
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        margin: EdgeInsets.all(25.0),
        child: Row(
          children: [
            FlutterLogo(
              size: 60.0,
            ),
            Text('test $id                                   '),
            IconButton(
              onPressed: (){
             AddToCart(this);

              },
              icon: Icon(
                Icons.add_to_queue,
                color: Colors.black,

              ),

              color: Colors.blue[500],
            ),
          ],
        ));
  }
}
Map<int,int>SelectedItems=Map();
void AddToCart(Line L){
if(SelectedItems.containsKey(L.id))
{
  SelectedItems[L.id]=SelectedItems[L.id]+1;
}
else{

  SelectedItems[L.id]=1;

}

}