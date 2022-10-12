class Offer {
  List<Data>? data;

  Offer({this.data});

  Offer.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? assetId;
  String? createdDate;
  String? currentPrice;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.assetId,
      this.createdDate,
      this.currentPrice,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    assetId = json['asset_Id'];
    createdDate = json['created_date'];
    currentPrice = json['current_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['asset_Id'] = this.assetId;
    data['created_date'] = this.createdDate;
    data['current_price'] = this.currentPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
