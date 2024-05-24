import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maristcommerce/BottomNavBar/custom_scaffold.dart';

class Merch extends StatefulWidget {
  const Merch({Key? key});

  @override
  State<Merch> createState() => _MerchState();
}

class _MerchState extends State<Merch> {
  List<String> imageUrls = [];
  List<String> titles = [
    'KEYCHAINS',
    'MUGS',
    'TUMBLRS',
    'UMBRELLA',
    'TOTEBAG',
  ];
  List<String> subtitles = [
    'Organic',
    'Original',
    'TUMBLRS',
    'UMBRELLA',
    'TOTEBAG',
  ];
  List<String> pricing = [
    '\₱120',
    '\₱199',
    '\₱649',
    '\₱499',
    '\₱249',
  ];

  bool _isDisposed = false;
  String searchText = '';

  @override
  void initState() {
    super.initState();
    fetchImages();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }

  Future<void> fetchImages() async {
    FirebaseStorage storage = FirebaseStorage.instance;
    for (int i = 1; i <= 5; i++) {
      try {
        Reference ref = storage.ref().child('m$i.jpg');
        String downloadUrl = await ref.getDownloadURL();
        if (!_isDisposed) {
          setState(() {
            imageUrls.add(downloadUrl);
          });
        }
      } catch (e) {
        if (!_isDisposed) {
          print('Error fetching image $i: $e');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: CustomScaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Color(0xFF00BE62)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Explore Our Upcoming Merch',
                        style: GoogleFonts.roboto(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'Discover a variety of products coming soon',
                        style: GoogleFonts.roboto(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Search ...',
                                  contentPadding: EdgeInsets.only(left: 15),
                                ),
                                onChanged: (value) {
                                  setState(() {
                                    searchText = value;
                                  });
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.search),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: imageUrls.length,
                  itemBuilder: (context, index) {
                    if (titles[index]
                        .toLowerCase()
                        .contains(searchText.toLowerCase())) {
                      return _buildMerchItem(
                        imageUrl: imageUrls[index],
                        title: titles[index],
                        subtitle: subtitles[index],
                        price: pricing[index],
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ],
          ),
        ),
        showBottomNavBar: true,
        initalIndex: 1,
      ),
    );
  }

  Widget _buildMerchItem({
    required String imageUrl,
    required String title,
    required String subtitle,
    required String price,
  }) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image.network(
                imageUrl,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: GoogleFonts.roboto(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    price,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
