class MindsetPrinciple {
  const MindsetPrinciple({
    required this.id,
    required this.title,
    required this.category,
    required this.shortDescription,
    required this.tips,
  });

  final String id;
  final String title;
  final String category;
  final String shortDescription;
  final List<String> tips;

  factory MindsetPrinciple.fromJson(Map<String, dynamic> json) {
    return MindsetPrinciple(
      id: json['id'] as String,
      title: json['title'] as String,
      category: json['category'] as String,
      shortDescription: json['shortDescription'] as String,
      tips: (json['tips'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'shortDescription': shortDescription,
      'tips': tips,
    };
  }
}
