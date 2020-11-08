import 'package:flutter/material.dart';
import 'Profile.dart';

void main() {
  runApp(MaterialApp(
    title: 'Navigation Basics',
    home: Home(),
  ));
}

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[800],
      ),
      appBar: AppBar(
        title: Text("Pharmacy App"),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 20),
              RaisedButton(
                onPressed: () {},
                color: Colors.red,
                padding: EdgeInsets.fromLTRB(20, 50, 20, 50),
                textColor: Colors.white,
                child: const Text('Beauty & Cosmetics',
                    style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Items()),
                  );
                },
                color: Colors.blue,
                padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                textColor: Colors.white,
                child:
                    const Text('Medications', style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 30),
              RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                color: Colors.green,
                textColor: Colors.white,
                child: const Text('Mom & Baby', style: TextStyle(fontSize: 20)),
              ),
            ]),
      ),
    ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          selectedItemColor: Colors.amber[800],
          currentIndex: 1,
        ),
        appBar: AppBar(
          title: Text("Pharmacy App"),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 20),
                RaisedButton.icon(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Category()));
                  },
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(60, 50, 50, 50),
                  textColor: Colors.white,
                  label: Text(
                    'Shop Now',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.shopping_cart_sharp, color: Colors.white),
                ),
                const SizedBox(height: 30),
                RaisedButton.icon(
                  onPressed: () {},
                  color: Colors.green,
                  padding: EdgeInsets.fromLTRB(50, 50, 50, 50),
                  textColor: Colors.white,
                  label: Text(
                    'Our Address',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                RaisedButton.icon(
                  onPressed: () {},
                  padding: EdgeInsets.fromLTRB(60, 50, 50, 50),
                  color: Colors.green,
                  textColor: Colors.white,
                  label: Text(
                    'Contact us',
                    style: TextStyle(color: Colors.white),
                  ),
                  icon: Icon(Icons.call, color: Colors.white),
                ),
              ]),
        ),
      ),
    );
  }
}

class Items extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        currentIndex: 1,
      ),
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
          Line(),
          Line(),
          Line(),
          Line(),
          Line(),
          Line(),
          Line(),
          Line(),
          Line(),
        ],
      )),
    );
  }
}

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.money_rounded),
            label: 'CheckOut',
          ),
        ],
        selectedItemColor: Colors.green[800],
        currentIndex: 1,
      ),
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          LineCart(),
          LineCart(),
        ],
      )),
      //row gdid ba3d el satr da
    );
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        margin: EdgeInsets.all(25.0),
        child: Row(
          children: [
            FlutterLogo(
              size: 60.0,
            ),
            Text('Paracitamol                                   '),
            Icon(
              Icons.add_to_queue,
              color: Colors.blue[500],
            ),
          ],
        ));
  }
}

class LineCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white24,
        margin: EdgeInsets.all(25.0),
        child: Row(
          children: [
            FlutterLogo(
              size: 60.0,
            ),
            Text('Paracitamol                                   '),
          ],
        ));
  }
}
