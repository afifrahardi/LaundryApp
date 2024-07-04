import 'package:flutter/material.dart';
import '/ui/Member_detail.dart';
import '../model/Member.dart';
import '../service/Paket_service.dart';


class MemberUpdateForm extends StatefulWidget {
  final Member member;

  const MemberUpdateForm({Key? key, required this.member}) : super(key: key);
  _MemberUpdateFormState createState() => _MemberUpdateFormState();
}

class _MemberUpdateFormState extends State<MemberUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _idCtrl = TextEditingController();
  final _jenis_kelaminCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tanggal_lahirCtrl = TextEditingController();
  final _nomor_teleponCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _idCtrl.text = widget.member.id;
      _jenis_kelaminCtrl.text = widget.member.jenis_kelamin;
      _namaCtrl.text = widget.member.nama;
      _tanggal_lahirCtrl.text = widget.member.tanggal_lahir;
      _nomor_teleponCtrl.text = widget.member.nomor_telepon;
      _alamatCtrl.text = widget.member.alamat;
      _emailCtrl.text = widget.member.email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Ubah Data Member",
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
      decoration: const InputDecoration(labelText: "Jenis kelamin:"),
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
          return 'PSilahkan Masukkan Nama';
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
      child:
          const Text("Simpan Perubahan", style: TextStyle(color: Colors.white)),
    );
  }
}