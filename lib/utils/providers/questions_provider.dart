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

  Future<bool> submitAnswers(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/prep/createCardPost');
    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(
          {
            "age": 4,
            "bill": 8,
            "dining": 5,
            "grocery": 1,
            "installment": 5,
            "mile": 2,
            "online_shopping": 3,
            "other": 13,
            "point": 3,
            "sale_cashback": 1,
            "travel": 2
          },
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
