import 'dart:io';

import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/constants/image_paths.dart';
import 'package:credit_card_recommendation_system/models/card_offers.dart';
import 'package:credit_card_recommendation_system/utils/helper/build_card_bottom_sheet.dart';
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
                  buildCardBottomSheet(context, index, sponsoredOffers);
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.star,
                                    size: 16,
                                    color: kPrimaryColor,
                                  ),
                                  Text(
                                    sponsoredOffers[index]
                                        .rating
                                        .toStringAsFixed(1),
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          fontSize: 14,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                          //rating
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
