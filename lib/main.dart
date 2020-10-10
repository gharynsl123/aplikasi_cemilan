import 'package:aplikasi_cemilan/DetailPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() =>
    runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Dessert", style: TextStyle(fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,),
      ),
      body: _PageList(),
    );
  }
}

//for set up all text
final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: "arial");
//for set up the name
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
//for set up all the deskripsi
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
//for set up the stok
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w800);

// class LisPage
class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {
  List<String> judul = [
    "Berry Crumble",
    "Blue Berry Cake",
    "Coffe Ice Cream",
    "Cookie",
    "Lagsana"
  ];
  List<String> subJudul = [
    "Roti Yang Sangat Lembut Dan Pas Dengan Taburan Berry",
    "Cake Dengan Buah Berry Pilihan Dan Rasanya Sangat Lembut",
    "Sangat Cocok Untuk Para Anak mnuda Jaman Sekarang Ice Cream Yang sangat Lebut Dan Dingin  Cocok Dengan hawan Panas",
    "Di Buat Dengah Rasa Kasih Sayang Walaupun Sangat Simple",
    "Ditemani Oleh Minuman Akan Semakin Nikmat"
  ];
  List<String> gambar = [
    "assets/images/berrycrumble.jpg",
    "assets/images/blueberrycake.jpg",
    "assets/images/coffeicecrem.jpg",
    "assets/images/cookie.jpg",
    "assets/images/lagsana.jpg"
  ];
  List<String> jmlh = [
    "14 pcs",
    "Waktu Tersedia Terbatas",
    "45 Mangkuk",
    "18 Boxs",
    "25 Boxs"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: judul.length,
        itemBuilder: (BuildContext context, int index) {
          final title = judul[index].toString();
          final subTitle = subJudul[index].toString();
          final jumlah = jmlh[index].toString();
          final img = gambar[index].toString();
          return Container(
            height: 200.0,
            padding: EdgeInsets.all(5.0),
            child: GestureDetector(
              child: Stack(
                children: <Widget>[
                  backgroundImage(img),
                  Container(
                   child: topContent(title, subTitle, jumlah),
                  )
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => DetailPage(itemJudul: title,
                      itemSub: subTitle, qty: jumlah, itemImage: img)
                ));
              },
            ),
          );
        },
      ),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
            fit: BoxFit.fill,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.5), BlendMode.luminosity),
            image: AssetImage(gambar)),
      ),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
//      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: footerTextStyle,
          )
        ],
      ),
    );
  }
}
