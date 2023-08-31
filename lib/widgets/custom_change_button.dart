import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/models/question.dart';
import 'package:credit_card_recommendation_system/screens/offers_page.dart';
import 'package:credit_card_recommendation_system/utils/providers/carousel_provider.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class CustomChangeButton extends StatelessWidget {
  const CustomChangeButton({
    super.key,
    required this.title,
    required this.isForward,
    required this.question,
  });

  final String title;
  final bool isForward;
  final Question question;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final questionsData =
            Provider.of<QuestionsProvider>(context, listen: false);
        final carouselData =
            Provider.of<CarouselProvider>(context, listen: false);

        if (isForward) {
          if (questionsData.questions[questionsData.questions.length - 1] ==
              question) {
            questionsData.submitAnswers({}).then((value) {
              if (value) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      titleTextStyle: Theme.of(context).textTheme.titleLarge,
                      title: const Text('Başarılı'),
                      content: const Text('Cevaplarınız başarıyla kaydedildi'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/home');
                          },
                          child: const Text('Ana Sayfaya Dön'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              PageRouteBuilder(
                                transitionDuration:
                                    const Duration(milliseconds: 250),
                                pageBuilder: (context, _, __) =>
                                    const OffersPage(),
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
                          child: const Text('Teklifleri Gör'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                //error dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Error'),
                      content: const Text('Something went wrong'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              }
              //success dialog
            });
          } else {
            carouselData.nextPage();
          }
        } else {
          carouselData.previousPage();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: kButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              !isForward
                  ? const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  : const SizedBox(),
              Text(
                title,
                style: TextStyle(color: Colors.white),
              ),
              isForward
                  ? const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
