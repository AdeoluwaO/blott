class DigestNews {
  DigestNews({
    this.category,
    this.datetime,
    this.headline,
    this.id,
    this.image,
    this.related,
    this.source,
    this.summary,
    this.url,
  });

  final String? category;
  final DateTime? datetime;
  final String? headline;
  final int? id;
  final String? image;
  final String? related;
  final String? source;
  final String? summary;
  final String? url;

  DigestNews copyWith({
    String? category,
    DateTime? datetime,
    String? headline,
    int? id,
    String? image,
    String? related,
    String? source,
    String? summary,
    String? url,
  }) {
    return DigestNews(
      category: category ?? this.category,
      datetime: datetime ?? this.datetime,
      headline: headline ?? this.headline,
      id: id ?? this.id,
      image: image ?? this.image,
      related: related ?? this.related,
      source: source ?? this.source,
      summary: summary ?? this.summary,
      url: url ?? this.url,
    );
  }

  factory DigestNews.fromJson(Map<String, dynamic> json) {
    return DigestNews(
      category: json["category"],
      // datetime: DateTime.tryParse((json["datetime"] as int?).toString()),
      datetime: DateTime.fromMillisecondsSinceEpoch((json["datetime"] as int) * 1000),
      headline: json["headline"],
      id: json["id"],
      image: json["image"],
      related: json["related"],
      source: json["source"],
      summary: json["summary"],
      url: json["url"],
    );
  }

  Map<String, dynamic> toJson() => {
        "category": category,
        "datetime": datetime,
        "headline": headline,
        "id": id,
        "image": image,
        "related": related,
        "source": source,
        "summary": summary,
        "url": url,
      };
}
