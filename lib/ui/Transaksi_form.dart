import 'package:flutter/material.dart';
import '../model/Transaksi.dart';
import 'Transaksi_detail.dart';

class TransaksiForm extends StatefulWidget {
  const TransaksiForm({Key? key}) : super(key: key);
  _TransaksiFormState createState() => _TransaksiFormState();
}

class _TransaksiFormState extends State<TransaksiForm> {
  final _formKey = GlobalKey<FormState>();
  final _batas_waktuCtrl = TextEditingController();
  final _status_bayarCtrl = TextEditingController();
  final _nama_memberCtrl = TextEditingController();
  final _pilih_paketCtrl = TextEditingController();
  final _isi_kuantitasCtrl = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            " Tambah Data Transaksi",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldBatasWaktu(),
              _fieldStatusBayar(),
              _fieldNamaMember(),
              _fieldPilihPaket(),
              _fieldIsiKuantitas(),

              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

_fieldBatasWaktu() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Batas Waktu:"),
      controller: _batas_waktuCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Batas Waktu';
        }
        return null;
      },
    );
  }

  _fieldStatusBayar() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Status Bayar:"),
      controller: _status_bayarCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Status Bayar';
        }
        return null;
      },
    );
  }

  _fieldNamaMember() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Member:"),
      controller: _nama_memberCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Nama Member';
        }
        return null;
      },
    );
  }

  _fieldPilihPaket() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Pilih Paket:"),
      controller: _pilih_paketCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Pilih Paket';
        }
        return null;
      },
    );
  }

  _fieldIsiKuantitas() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Isi Kuantitas:"),
      controller: _isi_kuantitasCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Isi Kuantitas';
        }
        return null;
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Transaksi transaksi = Transaksi(
            batas_waktu: _batas_waktuCtrl.text,
            status_bayar: _status_bayarCtrl.text,
            nama_member: _nama_memberCtrl.text,
            pilih_paket: _pilih_paketCtrl.text,
            isi_kuantitas: _isi_kuantitasCtrl.text,
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TransaksiDetail(transaksi: transaksi),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      child: const Text("Simpan", style: TextStyle(color: Colors.white)),
    );
  }
}