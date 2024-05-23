import 'package:flutter/material.dart';
import 'package:maristcommerce/BottomNavBar/custom_scaffold.dart';
import 'package:maristcommerce/product_shop/product_detail.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CardItem> cardItems = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    cardItems = [
      CardItem(
          title: 'Shirt 1',
          pricing: '\₱850',
          images: ['images/1.jpg', 'images/1.jpg', 'images/1.jpg']),
      CardItem(
          title: 'Shirt 2',
          pricing: '\₱850',
          images: ['images/2.jpg', 'images/2.jpg', 'images/2.jpg']),
      CardItem(
          title: 'Shirt 3',
          pricing: '\₱850',
          images: ['images/3.jpg', 'images/3.jpg', 'images/3.jpg']),
      CardItem(
          title: 'Shirt 4',
          pricing: '\₱850',
          images: ['images/4.jpg', 'images/4.jpg', 'images/4.jpg']),
      CardItem(
          title: 'Shirt 5',
          pricing: '\₱850',
          images: ['images/5.jpg', 'images/5.jpg', 'images/5.jpg']),
    ];
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
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 16.0),
                      child: Text(
                        'HOMEPAGE',
                        style: GoogleFonts.spaceMono(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.all(16.0),
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search merchandise',
                                hintStyle: GoogleFonts.spaceMono(
                                  fontSize: 12.0,
                                  color: Colors.grey,
                                ),
                                border: InputBorder.none,
                                icon: Icon(Icons.search),
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
                            icon: Icon(Icons.filter_list),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: cardItems
                      .where((cardItem) => cardItem.title
                          .toLowerCase()
                          .contains(searchText.toLowerCase()))
                      .map((cardItem) {
                    return buildCard(cardItem);
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
        showBottomNavBar: true,
        initalIndex: 0,
      ),
    );
  }

  Widget buildCard(CardItem cardItem) {
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProductDetail()));
      },
      child: Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF7ED957),
                Color(0xFF00BE62),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                ),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                  child: PageView.builder(
                    itemCount: cardItem.images.length,
                    onPageChanged: (int index) {
                      setState(() {
                        cardItem.currentIndex = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Image.asset(
                        cardItem.images[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(cardItem.images.length,
                      (int circleIndex) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.0),
                      child: CircleAvatar(
                          radius: 4,
                          backgroundColor: circleIndex == cardItem.currentIndex
                              ? Colors.blue
                              : Colors.white),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    cardItem.title,
                    style: GoogleFonts.spaceMono(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    cardItem.pricing,
                    style: GoogleFonts.spaceMono(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem {
  final String title;
  final String pricing;
  final List<String> images;
  int currentIndex;

  CardItem(
      {required this.title,
      required this.pricing,
      required this.images,
      this.currentIndex = 0});
}
