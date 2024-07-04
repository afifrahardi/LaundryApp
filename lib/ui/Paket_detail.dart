import 'package:flutter/material.dart';
import '../model/Paket_laundry.dart';
import 'Paket_update_form.dart';
import '../service/Paket_service.dart';
import 'Paket_page.dart';



class PaketDetail extends StatefulWidget {
final Paket paket;

 const PaketDetail({Key? key, required this.paket}) : super(key: key);
 _PaketDetailState createState() => _PaketDetailState();
 }

 class _PaketDetailState extends State<PaketDetail> {
 Stream<Paket> getData() async* {
 Paket data = await PaketService().getById(widget.paket.id.toString());
 yield data;
 }

 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: Text("Detail Paket")),
 body: StreamBuilder(
 stream: getData(),
 builder: (context, AsyncSnapshot snapshot) {
 if (snapshot.hasError) {
 return Text(snapshot.error.toString());
 }
 if (snapshot.connectionState != ConnectionState.done) {
 return Center(
 child: CircularProgressIndicator(),
 );
 }
 if (!snapshot.hasData &&
 snapshot.connectionState == ConnectionState.done) {
 return Text('Data Tidak Ditemukan');
 }
 return Column(
 children: [
 SizedBox(height: 20),
 Text(
 "Nama Paket : ${snapshot.data.namaPaket}",
 style: TextStyle(fontSize: 20),
 ),
 SizedBox(height: 20),
 Row(
 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
 children: [_tombolUbah(), _tombolHapus()],
 )
 ],
 );
 },
 ),
 );
 }

 _tombolUbah() {
 return StreamBuilder(
 stream: getData(),
 builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
 onPressed: () {
 Navigator.push(

 context,
 MaterialPageRoute(
 builder: (context) =>
 PaketUpdateForm(paket: snapshot.data)));
 },
 child: const Text("Ubah")));
 }

 _tombolHapus() {
 return ElevatedButton(
 onPressed: () {
 AlertDialog alertDialog = AlertDialog(
 content: const Text("Yakin ingin menghapus data ini?"),
 actions: [
 ElevatedButton(
 onPressed: (){
 Navigator.pop(context);
 Navigator.pushReplacement(context, MaterialPageRoute(builder:
(context) => PaketPage())); },
 child: const Text("YA"),
 ),
 ElevatedButton(
 onPressed: () {
 Navigator.pop(context);
 },
 child: const Text("Tidak"),
 
 )
 ],
 );
 showDialog(context: context, builder: (context) => alertDialog);
 },
 child: const Text("Hapus"));
 }
 }