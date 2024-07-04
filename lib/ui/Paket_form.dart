import 'package:flutter/material.dart';
import '../model/Paket_laundry.dart';
import '../service/Paket_service.dart';
import 'Paket_detail.dart';

class PaketForm extends StatefulWidget {
  const PaketForm({Key? key}) : super(key: key);
  _PaketFormState createState() => _PaketFormState();
  }
  
  class _PaketFormState extends State<PaketForm> {
    final _formKey = GlobalKey<FormState>();
    final _namaPaketCtrl = TextEditingController();
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Tambah Paket")),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [_fieldNamaPaket(), SizedBox(height: 20),
              _tombolSimpan()],
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
          await PaketService().simpan(paket).then((value) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => PaketDetail(paket: value)));
              });
            },
            child: const Text("Simpan"));
          }
        }