import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  final biodata = <String, String>{};
  HomePage({super.key}) {
    biodata["name"] = "Kobo Kanaeru";
    biodata["phone"] = "087837123646";
    biodata["email"] = "codedimas@gmail.com";
    biodata["image"] = "assets/kobo.jpg";
    biodata["hobby"] = "Main hujan-hujanan";
    biodata["addr"] = "Semarang";
    biodata["desc"] =
        "Kobo Kanaeru (こぼ・かなえる) adalah YouTuber virtual wanita asal Indonesia yang berafiliasi dengan agensi hololive, yang memulai debutnya sebagai bagian dari kelompok VTuber hololive cabang Indonesia (ID) generasi ketiga bersama Vestia Zeta dan Kaela Kovalskia.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aplikasi Biodata")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            16,
          ),
          child: Column(
            children: [
              TeksKotak(label: biodata["name"] ?? ""),
              const SizedBox(
                height: 4,
              ),
              Image.asset("assets/kobo.jpg"),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  BtnContact(
                    color: Colors.green,
                    icon: Icons.alternate_email_rounded,
                    uri: "mailto:${biodata["email"]}",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BtnContact(
                    color: Colors.blue,
                    icon: Icons.mark_email_unread,
                    uri: "https://wa.me/${biodata["phone"]}",
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  BtnContact(
                    color: Colors.purple,
                    icon: Icons.phone,
                    uri: "tel:${biodata["phone"]}",
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              TextAttribute(
                title: "Hobby",
                value: biodata["hobby"] ?? "",
              ),
              TextAttribute(
                title: "Alamat",
                value: biodata["addr"] ?? "",
              ),
              const SizedBox(
                height: 16,
              ),
              const TeksKotak(label: "Deskripsi"),
              const SizedBox(
                height: 4,
              ),
              Text(
                biodata["desc"] ?? "",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TeksKotak extends StatelessWidget {
  final String _label;
  const TeksKotak({
    super.key,
    required String label,
  }) : _label = label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      color: Colors.black,
      child: Text(
        _label,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    );
  }
}

class TextAttribute extends StatelessWidget {
  final String _title;
  final String _value;
  const TextAttribute({
    super.key,
    required String title,
    required String value,
  })  : _title = title,
        _value = value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 100,
          child: Text(
            "- $_title",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        Expanded(
          child: Text(
            ": $_value",
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}

class BtnContact extends StatelessWidget {
  final Color _color;
  final IconData _icon;
  final String _uri;
  const BtnContact({
    super.key,
    required Color color,
    required String uri,
    required IconData icon,
  })  : _color = color,
        _icon = icon,
        _uri = uri;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _launch(_uri);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _color,
          foregroundColor: Colors.white,
        ),
        child: Icon(
          _icon,
        ),
      ),
    );
  }

  Future _launch(String uri) async {
    print("launch");
    try {
      await launchUrl(Uri.parse(uri));
    } catch (e) {
      debugPrint("$e");
      throw Exception("Tidak dapat memanggil: $uri");
    }
  }
}
