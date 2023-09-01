import 'dart:convert';

import 'package:credit_card_recommendation_system/constants/questions.dart';
import 'package:credit_card_recommendation_system/constants/urls.dart';
import 'package:credit_card_recommendation_system/models/card_offers.dart';
import 'package:credit_card_recommendation_system/models/question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionsProvider with ChangeNotifier {
  final _questions = initial_questions;
  List<CardOffer> _sponsoredOffers = [];
  List<CardOffer> _activeOffers = [];

  List<Question> get questions {
    return [..._questions];
  }

  List<CardOffer> get sponsoredOffers {
    return [..._sponsoredOffers];
  }

  List<CardOffer> get activeOffers {
    return [..._activeOffers];
  }

  void updateSelectedAnswer(int questionIndex, int answerIndex) {
    _questions[questionIndex].selectedAnswerIndex = answerIndex;
    notifyListeners();
  }

  Map<String, dynamic> get requestParams {
    final initialFibonacci = [
      1,
      1,
      2,
      3,
      5,
      8,
      13,
      21,
      34,
    ];
    final coefficients = <int, int>{};

    for (int i = 0; i < _questions.length; i++) {
      final question = _questions[i];
      final selectedAnswerIndex = question.selectedAnswerIndex;
      final answerLength = question.answers.length;

      if (selectedAnswerIndex != null) {
        final reversedFibonacci = initialFibonacci
            .sublist(
              0,
              answerLength,
            )
            .reversed
            .toList();
        final coefficient = selectedAnswerIndex == -1
            ? 1
            : reversedFibonacci[selectedAnswerIndex];
        coefficients[i] = coefficient;
      } else {
        coefficients[i] = 1;
      }
    }

    final requestParams = {
      'age': questions[0].selectedAnswerIndex != null
          ? questions[0].selectedAnswerIndex! + 1
          : 1,
      'bill': coefficients[1],
      'dining': coefficients[2],
      'grocery': coefficients[3],
      'installment': coefficients[4],
      'mile': coefficients[5],
      'online_shopping': coefficients[6],
      'other': coefficients[7],
      'point': coefficients[8],
      'sale_cashback': coefficients[9],
      'travel': coefficients[10],
    };
    return requestParams;
  }

  Future<bool> submitAnswers() async {
    final url = Uri.parse('$baseUrl/prep/createCardPost');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          requestParams,
        ),
      );
      if (response.statusCode == 200) {
        //use CardOffer.fromJson to convert json to CardOffer
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        final sponsoredOffersData =
            responseData['sponsored_offers'] as List<dynamic>;
        final activeOffersData = responseData['active_offers'] as List<dynamic>;

        _sponsoredOffers = sponsoredOffersData
            .map(
              (offer) => CardOffer.fromJson(offer),
            )
            .toList();
        _activeOffers = activeOffersData
            .map(
              (offer) => CardOffer.fromJson(offer),
            )
            .toList();
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
