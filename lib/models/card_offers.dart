class CardOffer {
  final int cardId;
  final int bankId;
  final String cardName;
  final double annualPayment;
  final double shoppingInterest;
  final double overdueInterest;
  final double cashAdvanceInterest;
  final String imgUrl;
  final String url;
  final int sponsored;
  final bool active;
  final List<dynamic> campaigns;
  final List<dynamic> categories;
  final double rating;

  CardOffer({
    required this.cardId,
    required this.bankId,
    required this.cardName,
    required this.annualPayment,
    required this.shoppingInterest,
    required this.overdueInterest,
    required this.cashAdvanceInterest,
    required this.imgUrl,
    required this.url,
    required this.sponsored,
    required this.active,
    required this.campaigns,
    required this.categories,
    required this.rating,
  });

  factory CardOffer.fromJson(Map<String, dynamic> json) {
    return CardOffer(
      cardId: json['card_id'],
      bankId: json['bank_id'],
      cardName: json['card_name'],
      annualPayment: json['annual_payment'],
      shoppingInterest: json['shopping_interest'],
      overdueInterest: json['overdue_interest'],
      cashAdvanceInterest: json['cash_advance_interest'],
      imgUrl: json['img_url'],
      url: json['url'],
      sponsored: json['sponsored'],
      active: json['active'],
      campaigns: json['campaigns'],
      categories: json['categories'],
      rating:
          json['rating'] is int ? json['rating'].toDouble() : json['rating'],
    );
  }
}
