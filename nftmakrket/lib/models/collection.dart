class Collection {
  List<Data>? data;

  Collection({this.data});

  Collection.fromJson(Map<String, dynamic> json) {
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
  String? slug;
  String? name;
  String? imageUrl;
  String? description;
  String? discordUrl;
  String? twitterUsername;
  String? externalUrl;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.slug,
      this.name,
      this.imageUrl,
      this.description,
      this.discordUrl,
      this.twitterUsername,
      this.externalUrl,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    imageUrl = json['image_url'];
    description = json['description'];
    discordUrl = json['discord_url'];
    twitterUsername = json['twitter_username'];
    externalUrl = json['external_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['slug'] = this.slug;
    data['name'] = this.name;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    data['discord_url'] = this.discordUrl;
    data['twitter_username'] = this.twitterUsername;
    data['external_url'] = this.externalUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
