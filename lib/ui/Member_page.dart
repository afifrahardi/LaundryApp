import 'package:flutter/material.dart';
import '../model/Member.dart';
import '../service/Paket_service.dart';
import 'Member_detail.dart';
import 'Member_form.dart';
import 'Member_item.dart';
import '../widget/sidebar.dart';

class PageMember extends StatefulWidget {
  const PageMember({super.key});

  @override
  _PageMemberState createState() => _PageMemberState();
}

class _PageMemberState extends State<PageMember> {
  final List<Member> _member = [
    Member(
      id: '1',
      jenis_kelamin: 'Perempuan',
      nama: 'Marshella Putri',
      tanggal_lahir: '2003-08-12',
      nomor_telepon: '0854672334987',
      alamat: 'Sleman',
      email: 'marshella08@gmail.com'
    ),
    Member(
      id: '2',
      jenis_kelamin: 'Laki-Laki',
      nama: 'Alvaro Narendra',
      tanggal_lahir: '2002-02-12',
      nomor_telepon: '085036485927',
      alamat: 'Bantul',
      email: 'narendra12@gmail.com'
    ),
    Member(
      id: '3',
      jenis_kelamin: 'Laki-Laki',
      nama: 'Areksa Adelio',
      tanggal_lahir: '2000-07-03',
      nomor_telepon: '085946728109',
      alamat: 'Kulon Progo',
      email: 'adelio17@gmail.com'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Data Member",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            GestureDetector(
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: ((context) => MemberForm())));
              },
            )
          ],
          backgroundColor: const Color.fromARGB(255, 0, 42, 76)),
      body: ListView.builder(
        itemCount: _member.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
            title: Text(_member[index].nama),
            subtitle: Text('Jenis kelamin : ${_member[index].jenis_kelamin}'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MemberDetail(member: _member[index]),
                ),
              );
            },
          ));
        },
      ),
    );
  }
}
