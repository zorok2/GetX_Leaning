import 'package:container_test/ProductPage.dart';
import 'package:container_test/yourcart_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        centerTitle: true,
        actions:  [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.menu),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(icon: const Icon(Icons.shopping_cart), onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const YourCartPage(),));
            },),
          ),
        ],
        title: const Text('MyShop'),
        ),
      drawer:  Drawer(
        child: ListView(
          children: [
            ListTile(title: Text('home'), leading: Icon(Icons.home),)
          ],
        ),
        ),
      body: ProductPage() ,
      );
  }
}
