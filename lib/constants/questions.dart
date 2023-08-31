import 'package:credit_card_recommendation_system/models/question.dart';

final initial_questions = [
  Question(
    id: 1,
    title: 'Hangi yaş aralığındasınız?',
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
    title: 'Aylık ortalama seyahatleriniz için ne kadar harcama yapıyorsunuz?',
    answers: [
      '0-1000 TL',
      '1000-5000 TL',
      '5000-15000 TL',
      '15000 TL Üstü',
    ],
  ),
];
