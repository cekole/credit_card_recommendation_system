import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/constants/image_paths.dart';
import 'package:credit_card_recommendation_system/models/card_offers.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

Future<dynamic> buildCardBottomSheet(
    BuildContext context, int index, List<CardOffer> cardOffers) {
  return showModalBottomSheet(
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
                    cardOffers[index].imgUrl,
                  ),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            ListTile(
              title: Text(
                cardOffers[index].cardName,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Text(
                'Yıllık Ücret: ${cardOffers[index].annualPayment} TL',
              ),
            ),
            //categories
            ListTile(
              title: Text(
                'Kategoriler',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 16,
                    ),
              ),
              subtitle: Wrap(
                children: cardOffers[index]
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        '${cardOffers[index].rating.toStringAsFixed(1)}%',
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        '${cardOffers[index].shoppingInterest}%',
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        '${cardOffers[index].overdueInterest}%',
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
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14,
                            ),
                      ),
                      Text(
                        '${cardOffers[index].cashAdvanceInterest}%',
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
                  Uri.parse(cardOffers[index].url),
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      appBar: AppBar(
                        backgroundColor: gradientColors[0],
                        title: Image.asset(
                          logoPath,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.height * 0.05,
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
}
