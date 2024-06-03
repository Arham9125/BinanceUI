import 'dart:convert';
import 'package:cryptocurrency/model/crypto.dart';
import 'package:cryptocurrency/screens/components/slider.dart';
import 'package:cryptocurrency/screens/tabs/24change.dart';
import 'package:cryptocurrency/screens/tabs/hot.dart';
import 'package:cryptocurrency/screens/tabs/markcap.dart';
import 'package:cryptocurrency/screens/tabs/pricecoin.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class HomeScr extends StatefulWidget {
  static const String apikey = "d4b26eec-5083-4517-bf8a-4ba1097ddd8e";
  static const String url =
      "https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=10&convert=USD";

  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {

  List<Coin> mlist = [];
  Future<List<Coin>> fetchCoins() async {
    final Map<String, String> headers = {
      'X-CMC_PRO_API_KEY': HomeScr.apikey,
      'Accepts': 'application/json'
    };

    final Uri uri = Uri.parse(HomeScr.url);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['data'];
      for(Map<String, dynamic> i in data){
mlist.add(Coin.fromJson(i));
      }
      return mlist;
    } else {
      throw Exception('Failed to load coins');
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Column(
            children: [
              FutureBuilder<List<Coin>>(
                future: fetchCoins(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No data available'));
                  }

                  List<Coin> coins = snapshot.data!;
                  List<Coin> sortedByPrice = List.from(coins)
                    ..sort((a, b) => b.price.compareTo(a.price));
                  List<Coin> sortedByChange = List.from(coins)
                    ..sort((a, b) => b.volume_change_24h.compareTo(a.volume_change_24h));
                  List<Coin> sortedByMarketCap = List.from(coins)
                    ..sort((a, b) => b.market_cap.compareTo(a.market_cap));
                      List<Coin> sortedByHighPricw = List.from(coins)
                    ..sort((a, b) => b.market_cap.compareTo(a.market_cap));

                  return Expanded(
                    child: Column(
                      children: [
                        // Total Balance and Deposit section
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                "Total Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  // toggle hide/show price functionality here
                                });
                              },
                              icon: Icon(Icons.hide_source_sharp),
                            ),
                          ],
                        ),
                        // Total Balance Value and Deposit Button
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                // your hide/show price logic here
                                "\$320.57",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                                onPressed: () {},
                                child: Text("Deposit"),
                              ),
                            ),
                          ],
                        ),
                        // Carousel Slider
                      MySlider(),
                     
                        // Tabs
                        TabBar(
                          labelColor: Colors.grey,
                          indicatorColor: Colors.yellow.shade900,
                          tabs: [
                            Tab(text: "Hot"),
                             Tab(text: "MarkCap"),
                            Tab(text: "Price"),
                           
                            Tab(text: "24h Change"),
                          ],
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Hot(coins: sortedByHighPricw),
                               MarkCap(coins: sortedByMarketCap),
                              PriceTab(coins: sortedByPrice),
                             
                              ChangeIn24(coins: sortedByChange),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}