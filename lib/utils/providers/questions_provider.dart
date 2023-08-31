import 'dart:convert';

import 'package:credit_card_recommendation_system/constants/urls.dart';
import 'package:credit_card_recommendation_system/models/question.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class QuestionsProvider with ChangeNotifier {
  final _questions = [
    Question(
      id: 1,
      title: 'Yaşınız',
      answers: [
        '25 Altı',
        '25-35',
        '36-45',
        '45 Üstü',
      ],
    ),
    Question(
      id: 2,
      title:
          'Aylık fatura harcamalarınızı (kamu hizmetleri, kira vb.) nasıl derecelendirirsiniz?',
      answers: [
        'Düşük',
        'Orta',
        'Yüksek',
      ],
    ),
    Question(
      id: 3,
      title:
          'Ortalama olarak aylık  dışarıda yemek yemek için ne kadar harcama yapıyorsunuz?',
      answers: [
        '0-1000 TL',
        '1000-5000 TL',
        '5000-15000 TL',
        '15000 TL Üstü',
      ],
    ),
    Question(
      id: 4,
      title: 'Aylık ortalama alışveriş için ne kadar harcama yapıyorsunuz?',
      answers: [
        '0-1000 TL',
        '1000-5000 TL',
        '5000-15000 TL',
        '15000 TL Üstü',
      ],
    ),
    Question(
      id: 5,
      title: 'Ne sıklıkla taksitli ödemeler yapıyorsunuz?',
      answers: [
        'Hiç',
        'Bazen',
        'Sık Sık',
        'Her Zaman',
      ],
    ),
    Question(
      id: 6,
      title: 'Uçak mil veya seyahat ödülleri size ne kadar önemli geliyor?',
      answers: [
        'Önemli Değil',
        'Biraz Önemli',
        'Çok Önemli',
      ],
    ),
    Question(
      id: 7,
      title:
          'Aylık olarak internet üzerinden alışverişe ne kadar harcama yapıyorsunuz?',
      answers: [
        '0-1000 TL',
        '1000-5000 TL',
        '5000-15000 TL',
        '15000 TL Üstü',
      ],
    ),
    Question(
      id: 8,
      title:
          'Yukarıda belirtilmeyen kategoriler dışında aylık ortalama ne kadar harcama yapıyorsunuz?',
      answers: [
        '0-1000 TL',
        '1000-5000 TL',
        '5000-15000 TL',
        '15000 TL Üstü',
      ],
    ),
    Question(
      id: 9,
      title: 'Kredi kartından hangi tür avantaj en çok ilginizi çekiyor?',
      answers: [
        'Puanlar ve Ödüller',
        'Nakit Para İadesi ve İndirimler',
        'Seyahat Avantajları',
      ],
    ),
    Question(
      id: 10,
      title: 'Kredi kartı seçerken en çok dikkat ettiğiniz özellik hangisi?',
      answers: [
        'Yıllık Ücret',
        'Faiz Oranı',
        'Kredi Limiti',
        'Kartın Markası',
      ],
    ),
    Question(
      id: 11,
      title:
          'Aylık ortalama seyahatleriniz için ne kadar harcama yapıyorsunuz?',
      answers: [
        '0-1000 TL',
        '1000-5000 TL',
        '5000-15000 TL',
        '15000 TL Üstü',
      ],
    ),
  ];

  Map<String, dynamic> _cardOffers = {};

  List<Question> get questions {
    return [..._questions];
  }

  Map<String, dynamic> get cardOffers {
    return {..._cardOffers};
  }

  Future<bool> submitAnswers(Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl/prep/createCardPost');
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
      _cardOffers = json.decode(response.body);
      notifyListeners();
      return true;
    }
    return false;
  }
}
