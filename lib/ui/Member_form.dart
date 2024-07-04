import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Member.dart';
import '../model/Member.dart';
import '../service/Paket_service.dart';
import 'Member_detail.dart';

class MemberForm extends StatefulWidget {
  const MemberForm({Key? key}) : super(key: key);
  _MemberFormState createState() => _MemberFormState();
}

class _MemberFormState extends State<MemberForm> {
  final _formKey = GlobalKey<FormState>();
  final _idCtrl = TextEditingController();
  final _jenis_kelaminCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            " Tambah Data Member",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldID(),
              _fieldJenisKelamin(),
              _fieldNama(),
              _fieldTanggalLahir(),
              _fieldNomorTelepon(),
              _fieldAlamat(),
              _fieldEmail(),
              
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldID() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "ID:"),
      controller: _idCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan ID';
        }
        return null;
      },
    );
  }

  _fieldJenisKelamin() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Jenis Kelamin:"),
      controller: _jenis_kelaminCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Jenis Kelamin';
        }
        return null;
      },
    );
  }

  _fieldNama() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama:"),
      controller: _namaCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Nama';
        }
        return null;
      },
    );
  }

  _fieldTanggalLahir() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Tanggal Lahir:"),
      controller: _tanggal_lahirCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Tanggal Lahir';
        }
        return null;
      },
    );
  }

  _fieldNomorTelepon() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nomor Telepon:"),
      controller: _nomor_teleponCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Nomor Telepon';
        }
        return null;
      },
    );
  }

  _fieldAlamat() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Alamat:"),
      controller: _alamatCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Alamat';
        }
        return null;
      },
    );
  }

  _fieldEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email:"),
      controller: _alamatCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Silahkan Masukkan Email';
        }
        return null;
      },
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Member member = Member(
            id: _idCtrl.text,
            jenis_kelamin: _jenis_kelaminCtrl.text,
            nama: _namaCtrl.text,
            tanggal_lahir: _tanggal_lahirCtrl.text,
            nomor_telepon: _nomor_teleponCtrl.text,
            alamat: _alamatCtrl.text,
            email: _emailCtrl.text
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MemberDetail(member: member),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      child: const Text("Simpan", style: TextStyle(color: Colors.white)),
    );
  }
}