import 'dart:convert';

class GetMaterialResponse {
  String statusCode;
  String statusMessage;
  MaterialPurchaseList materialPurchaseList;

  GetMaterialResponse({
    required this.statusCode,
    required this.statusMessage,
    required this.materialPurchaseList,
  });

  GetMaterialResponse copyWith({
    String? statusCode,
    String? statusMessage,
    MaterialPurchaseList? materialPurchaseList,
  }) =>
      GetMaterialResponse(
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
        materialPurchaseList: materialPurchaseList ?? this.materialPurchaseList,
      );

  factory GetMaterialResponse.fromRawJson(String str) => GetMaterialResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetMaterialResponse.fromJson(Map<String, dynamic> json) => GetMaterialResponse(
    statusCode: json["status_code"],
    statusMessage: json["status_message"],
    materialPurchaseList: MaterialPurchaseList.fromJson(json["material_purchase_list"]),
  );

  Map<String, dynamic> toJson() => {
    "status_code": statusCode,
    "status_message": statusMessage,
    "material_purchase_list": materialPurchaseList.toJson(),
  };
}

class MaterialPurchaseList {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  MaterialPurchaseList({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  MaterialPurchaseList copyWith({
    int? currentPage,
    List<Datum>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    List<Link>? links,
    dynamic nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      MaterialPurchaseList(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        links: links ?? this.links,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );

  factory MaterialPurchaseList.fromRawJson(String str) => MaterialPurchaseList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MaterialPurchaseList.fromJson(Map<String, dynamic> json) => MaterialPurchaseList(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  String lineItemName;
  String store;
  String runnersName;
  double amount;
  String cardNumber;
  DateTime transactionDate;

  Datum({
    required this.id,
    required this.lineItemName,
    required this.store,
    required this.runnersName,
    required this.amount,
    required this.cardNumber,
    required this.transactionDate,
  });

  Datum copyWith({
    int? id,
    String? lineItemName,
    String? store,
    String? runnersName,
    double? amount,
    String? cardNumber,
    DateTime? transactionDate,
  }) =>
      Datum(
        id: id ?? this.id,
        lineItemName: lineItemName ?? this.lineItemName,
        store: store ?? this.store,
        runnersName: runnersName ?? this.runnersName,
        amount: amount ?? this.amount,
        cardNumber: cardNumber ?? this.cardNumber,
        transactionDate: transactionDate ?? this.transactionDate,
      );

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    lineItemName: json["line_item_name"],
    store: json["store"],
    runnersName: json["runners_name"],
    amount: json["amount"]?.toDouble(),
    cardNumber: json["card_number"],
    transactionDate: DateTime.parse(json["transaction_date"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "line_item_name": lineItemName,
    "store": store,
    "runners_name": runnersName,
    "amount": amount,
    "card_number": cardNumber,
    "transaction_date": transactionDate.toIso8601String(),
  };
}

class Link {
  String? url;
  String label;
  bool active;

  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  Link copyWith({
    String? url,
    String? label,
    bool? active,
  }) =>
      Link(
        url: url ?? this.url,
        label: label ?? this.label,
        active: active ?? this.active,
      );

  factory Link.fromRawJson(String str) => Link.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url,
    "label": label,
    "active": active,
  };
}
