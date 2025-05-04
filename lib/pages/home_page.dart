import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/pages/cart_page.dart';
import 'package:shopping_app/pages/product_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentpage = 0;
  final user = FirebaseAuth.instance.currentUser!;

  List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false, 
      drawer: Drawer(
        // ✅ Sidebar
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text(
                'Welcome ${user.email}',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Log out'),
              onTap: () {
                FirebaseAuth.instance.signOut();
                Navigator.pop(context); 
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          "Our Collection",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        leading: Builder(
          // ✅ Needed to access Scaffold context
          builder:
              (context) => IconButton(
                icon: Icon(Icons.menu),
                onPressed:
                    () =>
                        Scaffold.of(
                          context,
                        ).openDrawer(), // Open drawer manually
              ),
        ),
      ),
      body: IndexedStack(
        // Preserves state between tabs
        index: currentpage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentpage = value;
          });
        },
        currentIndex: currentpage,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
    );
  }
}
