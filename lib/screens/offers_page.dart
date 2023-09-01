import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/constants/image_paths.dart';
import 'package:credit_card_recommendation_system/screens/form_page.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:credit_card_recommendation_system/widgets/active_offers.dart';
import 'package:credit_card_recommendation_system/widgets/sponsored_offers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          title: Image.asset(
            logoPath,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height * 0.05,
          ),
        ),
        body: SafeArea(
          child: Consumer<QuestionsProvider>(
            builder: (context, questionsData, child) {
              if (questionsData.sponsoredOffers.isEmpty &&
                  questionsData.activeOffers.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Kredi kartı teklifiniz bulunmamaktadır.'),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  const Duration(milliseconds: 250),
                              pageBuilder: (context, _, __) => const FormPage(),
                              transitionsBuilder:
                                  (context, animation, _, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                        child: const Text('Teklif Almak İçin Tıklayın'),
                      ),
                    ],
                  ),
                );
              }
              final sponsoredOffers = questionsData.sponsoredOffers;
              final activeOffers = questionsData.activeOffers;
              return ListView(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SponsoredOffers(sponsoredOffers: sponsoredOffers),
                  //active offers
                  const SizedBox(
                    height: 20,
                  ),
                  ActiveOffers(activeOffers: activeOffers),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
