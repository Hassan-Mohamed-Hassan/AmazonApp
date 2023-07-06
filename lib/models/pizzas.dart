class AllProducts {
  AllProducts({
    required this.status,
    required this.requestId,
    required this.data,
  });
  final String? status;
  final String? requestId;
  final Data? data;
  factory AllProducts.fromJson(Map<String, dynamic> json){
    return AllProducts(
      status: json["status"],
      requestId: json["request_id"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.totalProducts,
    required this.country,
    required this.products,
  });

  final int? totalProducts;
  final String? country;
  final List<Product> products;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      totalProducts: json["total_products"],
      country: json["country"],
      products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
    );
  }

}

class Product {
  Product({
    required this.asin,
    required this.productTitle,
    required this.productPrice,
    required this.productOriginalPrice,
    required this.currency,
    required this.productStarRating,
    required this.productNumRatings,
    required this.productUrl,
    required this.productPhoto,
    required this.productNumOffers,
    required this.productMinimumOfferPrice,
    required this.isBestSeller,
    required this.isPrime,
    required this.climatePledgeFriendly,
  });

  final String? asin;
  final String? productTitle;
  final String? productPrice;
  final String? productOriginalPrice;
  final String? currency;
  final String? productStarRating;
  final int? productNumRatings;
  final String? productUrl;
  final String? productPhoto;
  final int? productNumOffers;
  final String? productMinimumOfferPrice;
  final bool? isBestSeller;
  final bool? isPrime;
  final bool? climatePledgeFriendly;

  factory Product.fromJson(Map<String, dynamic> json){
    return Product(
      asin: json["asin"],
      productTitle: json["product_title"],
      productPrice: json["product_price"],
      productOriginalPrice: json["product_original_price"],
      currency: json["currency"],
      productStarRating: json["product_star_rating"]!=null?json["product_star_rating"]:'2',
      productNumRatings: json["product_num_ratings"],
      productUrl: json["product_url"],
      productPhoto: json["product_photo"],
      productNumOffers: json["product_num_offers"],
      productMinimumOfferPrice: json["product_minimum_offer_price"],
      isBestSeller: json["is_best_seller"],
      isPrime: json["is_prime"],
      climatePledgeFriendly: json["climate_pledge_friendly"],
    );
  }
  Map<String, dynamic> toJson() => {
    "asin": asin,
    "product_title": productTitle,
    "product_price": productPrice,
    "product_original_price": productOriginalPrice,
    "currency": currency,
    "product_star_rating": productStarRating,
    "product_num_ratings": productNumRatings,
    "product_url": productUrl,
    "product_photo": productPhoto,
    "product_num_offers": productNumOffers,
    "product_minimum_offer_price": productMinimumOfferPrice,
    "is_best_seller": isBestSeller,
    "is_prime": isPrime,
    "climate_pledge_friendly": climatePledgeFriendly,
  };


}
