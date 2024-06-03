import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    return   CarouselSlider(
                          items: [
                            Card(
                              color: Colors.grey.shade800,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Refer Friends & Earn BTC ",
                                      style: TextStyle(color: Colors.grey.shade400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Earn Upto 0.18 BTC Free ",
                                          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                        ),
                                        Image.asset(
                                          "images/bitcoin.png",
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Card(
                              color: Colors.grey.shade800,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "New User Zone",
                                      style: TextStyle(color: Colors.grey.shade400),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Unlock 100 USDT Welcome Rewards",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Image.asset(
                                          "images/usdt.png",
                                          height: 40,
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                          options: CarouselOptions(
                            height: 140.0,
                            enlargeCenterPage: true,
                          ),
                        )
                     
                     ;
  }
}