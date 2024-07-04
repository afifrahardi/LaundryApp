import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Laporan.dart';
import 'package:flutter_application_1/ui/Transaksi_page.dart';
import 'package:flutter_application_1/ui/paket_laundry_page.dart';
import '../ui/Beranda.dart';
import '../ui/Login.dart';
import '../ui/Member_page.dart';
import '../ui/Paket_page.dart';
import '../ui/Transaksi_page.dart';
import '../ui/paket_laundry_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Afif Rahardi Waspada"),
            accountEmail: Text("afifrahardiwaspada@admin.com"),
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 42, 76),
            ),
          ),  
            ListTile(
              leading: Icon(Icons.home),
              title: Text("Beranda"),
              onTap: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Beranda()));
                },
              ),
              ListTile(
                leading: Icon(Icons.people),
                title: Text("Member"),
                onTap: () {
                  Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageMember()));
                  },
                ),
                ListTile(
                  leading: Icon(Icons.money),
                  title: Text("Transaksi"),
                  onTap: () { Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PageTransaksi()));},
                ),
                ListTile(
                  leading: Icon(Icons.shopping_bag),
                  title: Text("Paket Laundry"),
                  onTap: () { Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PaketLaundryPage()));},
                ),
                ListTile(
                  leading: Icon(Icons.book_online_outlined),
                  title: Text("Laporan"),
                  onTap: () {
   },
                ),
                ListTile(
                  leading: Icon(Icons.logout_rounded),
                  title: Text("Keluar"),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                      (Route<dynamic> route) => false);
                    },
                  )
                ],
              ),
            );
          }
        }
