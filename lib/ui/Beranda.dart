import 'package:flutter/material.dart';
import '../widget/Sidebar.dart'; 

class Beranda extends StatelessWidget { 
  const Beranda({super.key}); 
 
 @override 
 Widget build(BuildContext context) { 
  return Scaffold( 
    drawer: Sidebar(),
    appBar: AppBar(
    title: Text("Beranda",
    style: TextStyle(color: Color.fromARGB(255, 0, 42, 76)),
    ),
    backgroundColor: Color.fromARGB(255, 0, 42, 76),
    iconTheme: IconThemeData(color: Colors.white),
    ),  
  body: Center(
    child: Text(
      "Selamat Datang Di Anna Laundry",
      style: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.bold,
        color: const Color.fromARGB(255, 0, 42, 76),
         ),
        ),
      ),
    );
  }
}  