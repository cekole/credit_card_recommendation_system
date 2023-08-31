import 'dart:io';

import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/models/card_offers.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SponsoredOffers extends StatelessWidget {
  const SponsoredOffers({
    super.key,
    required this.sponsoredOffers,
  });

  final List<CardOffer> sponsoredOffers;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Sponsorlu Teklifler',
            style: TextStyle(
              color: kPrimaryColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: sponsoredOffers.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            Container(
                              margin: const EdgeInsets.all(8.0),
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    sponsoredOffers[index].imgUrl,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                            ListTile(
                              title: Text(
                                sponsoredOffers[index].cardName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                              subtitle: Text(
                                'Yıllık Ücret: ${sponsoredOffers[index].annualPayment} TL',
                              ),
                            ),
                            //categories
                            ListTile(
                              title: Text(
                                'Kategoriler',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                              subtitle: Wrap(
                                children: sponsoredOffers[index]
                                    .categories
                                    .map<Widget>(
                                      (category) => Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Chip(
                                          label: Text(category),
                                        ),
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.1,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        'Eşleşme Yüzdesi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        '${sponsoredOffers[index].rating.toStringAsFixed(1)}%',
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Alışveriş Faizi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        '${sponsoredOffers[index].shoppingInterest}%',
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Gecikme Faizi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        '${sponsoredOffers[index].overdueInterest}%',
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                        'Nakit Avans Faizi',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              fontSize: 14,
                                            ),
                                      ),
                                      Text(
                                        '${sponsoredOffers[index].cashAdvanceInterest}%',
                                        style: const TextStyle(
                                          color: kPrimaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                final _controller = WebViewController();
                                _controller.loadRequest(
                                  Uri.parse(sponsoredOffers[index].url),
                                );
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Scaffold(
                                      appBar: AppBar(
                                        backgroundColor: gradientColors[0],
                                        title: Text(
                                          sponsoredOffers[index]
                                              .cardName
                                              .split(' ')[0],
                                        ),
                                      ),
                                      body: WebViewWidget(
                                        controller: _controller,
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: const Text('Başvur'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Image.network(
                              sponsoredOffers[index].imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                sponsoredOffers[index].cardName,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      fontSize: 16,
                                    ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
