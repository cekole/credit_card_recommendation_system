import 'package:flutter/material.dart';
import 'package:credit_card_recommendation_system/constants/colors.dart';
import 'package:credit_card_recommendation_system/models/question.dart';
import 'package:credit_card_recommendation_system/utils/providers/carousel_provider.dart';
import 'package:credit_card_recommendation_system/utils/providers/questions_provider.dart';
import 'package:credit_card_recommendation_system/widgets/custom_change_button.dart';
import 'package:provider/provider.dart';

class QuestionCard extends StatefulWidget {
  const QuestionCard({
    Key? key,
    required this.question,
  }) : super(key: key);

  final Question question;

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    final questionsData = Provider.of<QuestionsProvider>(context);
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
                    widget.question.title,
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
                    itemCount: widget.question.answers.length,
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
                          title: Text(widget.question.answers[index]),
                          leading: Radio(
                            toggleable: true,
                            fillColor: MaterialStateProperty.all(kPrimaryColor),
                            value: index,
                            groupValue: widget.question.selectedAnswerIndex,
                            onChanged: (value) {
                              if (value == null) {
                                questionsData.updateSelectedAnswer(
                                    widget.question.id - 1, -1);
                              } else {
                                questionsData.updateSelectedAnswer(
                                    widget.question.id - 1, value as int);
                              }
                            },
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
                        widget.question
                    ? Spacer()
                    : CustomChangeButton(
                        title: 'Önceki Soru',
                        isForward: false,
                        question: widget.question,
                      ),
                Spacer(),
                Provider.of<QuestionsProvider>(context, listen: false)
                            .questions[Provider.of<QuestionsProvider>(context,
                                    listen: false)
                                .questions
                                .length -
                            1] ==
                        widget.question
                    ? CustomChangeButton(
                        title: 'Gönder',
                        isForward: true,
                        question: widget.question,
                      )
                    : CustomChangeButton(
                        title: 'Sonraki Soru',
                        isForward: true,
                        question: widget.question,
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
