class Zekr {
  final String category;
  final String content;
  final String description;
  final String reference;
  final String count;

  Zekr({
    required this.category,
    required this.content,
    required this.description,
    required this.reference,
    required this.count,
  });

  factory Zekr.fromJson(Map<String, dynamic> json) {
    return Zekr(
      category: json['category'] ?? '',
      content: json['content'] ?? '',
      description: json['description'] ?? '',
      reference: json['reference'] ?? '',
      count: json['count'] ?? '1',
    );
  }
}
