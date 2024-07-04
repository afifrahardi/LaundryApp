import 'package:flutter/material.dart';
import '../model/Paket_laundry.dart';
import '../service/Paket_service.dart';
import '/ui/Paket_detail.dart';

class PaketUpdateForm extends StatefulWidget {
final Paket paket;

const PaketUpdateForm({Key? key, required this.paket}) : super(key: key);
_PaketUpdateFormState createState() => _PaketUpdateFormState();
 }

 class _PaketUpdateFormState extends State<PaketUpdateForm> {
 final _formKey = GlobalKey<FormState>();
 final _namaPaketCtrl = TextEditingController();
 Future<Paket> getData() async {
 Paket data = await PaketService().getById(widget.paket.id.toString());
 setState(() {
 _namaPaketCtrl.text = data.namaPaket;
 });
 return data;
 }

@override
 void initState() {
 super.initState();
 getData();
 }
 
@override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(title: const Text("Ubah Paket")),
 body: SingleChildScrollView(
 child: Form(
 key: _formKey,
 child: Column(
 children: [_fieldNamaPaket(), SizedBox(height: 20), _tombolSimpan()],
 ),
),
),
);
}

_fieldNamaPaket() {
 return TextField(
 decoration: const InputDecoration(labelText: "Nama Paket"),
 controller: _namaPaketCtrl,
 );
 }

_tombolSimpan() {
 return ElevatedButton(
 onPressed: () async {
 Paket paket = new Paket(namaPaket: _namaPaketCtrl.text);
 String id = widget.paket.id.toString();
 await PaketService().ubah(paket, id).then((value) {
 Navigator.pop(context);
 Navigator.pushReplacement(
 context,
 MaterialPageRoute(
 builder: (context) => PaketDetail(paket: value)));
 });
 },
 child: const Text("Simpan Perubahan"));
 }
}