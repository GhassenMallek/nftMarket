class Assets {
  List<Data>? data;

  Assets({this.data});

  Assets.fromJson(Map<String, dynamic> json) {
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
  String? tokenId;
  String? name;
  String? imageUrl;
  String? description;
  String? imageOriginalUrl;
  String? imagePreviewUrl;
  String? imageThumbnailUrl;
  String? ownership;
  String? tokenMetadata;
  String? externalUrl;
  String? collectionId;
  String? contract;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.tokenId,
      this.name,
      this.imageUrl,
      this.description,
      this.imageOriginalUrl,
      this.imagePreviewUrl,
      this.imageThumbnailUrl,
      this.ownership,
      this.tokenMetadata,
      this.externalUrl,
      this.collectionId,
      this.contract,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokenId = json['token_id'];
    name = json['name'];
    imageUrl = json['image_url'];
    description = json['description'];
    imageOriginalUrl = json['image_original_url'];
    imagePreviewUrl = json['image_preview_url'];
    imageThumbnailUrl = json['image_thumbnail_url'];
    ownership = json['ownership'];
    tokenMetadata = json['token_metadata'];
    externalUrl = json['external_url'];
    collectionId = json['collection_id'];
    contract = json['Contract'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token_id'] = this.tokenId;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['image_original_url'] = this.imageOriginalUrl;
    data['image_preview_url'] = this.imagePreviewUrl;
    data['image_thumbnail_url'] = this.imageThumbnailUrl;
    data['ownership'] = this.ownership;
    data['token_metadata'] = this.tokenMetadata;
    data['external_url'] = this.externalUrl;
    data['collection_id'] = this.collectionId;
    data['Contract'] = this.contract;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
