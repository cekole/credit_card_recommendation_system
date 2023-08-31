import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/models/question.dart';
import 'package:credit_card_recommendation_system/utils/providers/carousel_provider.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:credit_card_recommendation_system/widgets/custom_change_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    super.key,
    required this.question,
  });

  final Question question;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    question.title,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 20,
                        ),
                  ),
                ),
                const Divider(
                  color: kPrimaryColor,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: question.answers.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: kPrimaryColor,
                          ),
                        ),
                        child: ListTile(
                          title: Text(question.answers[index]),
                          leading: Radio(
                            value: index,
                            groupValue: 1,
                            onChanged: (value) {},
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Provider.of<QuestionsProvider>(context, listen: false)
                            .questions
                            .first ==
                        question
                    ? Spacer()
                    : CustomChangeButton(
                        title: 'Önceki Soru',
                        isForward: false,
                        question: question,
                      ),
                Spacer(),
                Provider.of<QuestionsProvider>(context, listen: false)
                            .questions[Provider.of<QuestionsProvider>(context,
                                    listen: false)
                                .questions
                                .length -
                            1] ==
                        question
                    ? CustomChangeButton(
                        title: 'Gönder',
                        isForward: true,
                        question: question,
                      )
                    : CustomChangeButton(
                        title: 'Sonraki Soru',
                        isForward: true,
                        question: question,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
