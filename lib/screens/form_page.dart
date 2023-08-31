import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/constants/image_paths.dart';
import 'package:credit_card_recommendation_system/utils/providers/carousel_provider.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:credit_card_recommendation_system/widgets/question_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    final questionsData =
        Provider.of<QuestionsProvider>(context, listen: false);
    final carouselData = Provider.of<CarouselProvider>(context, listen: false);
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
          child: CarouselSlider.builder(
            controller: carouselData.carouselController,
            slideTransform: CubeTransform(),
            itemCount: questionsData.questions.length,
            slideBuilder: (index) {
              return QuestionCard(
                question: questionsData.questions[index],
              );
            },
            slideIndicator: CircularSlideIndicator(
              currentIndicatorColor: kPrimaryColor,
              indicatorBackgroundColor: Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
