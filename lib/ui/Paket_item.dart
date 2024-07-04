import 'package:flutter/material.dart'; 
import '../model/Paket_laundry.dart';
import 'Paket_Detail.dart'; 

class PaketItem extends StatelessWidget { 
  final Paket paket; 

const PaketItem({super.key, required this.paket}); 

@override 
Widget build(BuildContext context) { 
  return GestureDetector( 
    child: Card( 
      child: ListTile( 
        title: Text("${paket.namaPaket}"), 
        ), 
      ), 
      onTap: () { 
        Navigator.push(context, 
        MaterialPageRoute(builder: (context) => PaketDetail(paket: paket)));
        }, 
      ); 
    } 
  }