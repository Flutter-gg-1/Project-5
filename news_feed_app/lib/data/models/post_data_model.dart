class PostDataModel {
  final int id;
  final String category;
  final String author;
  late final String title;
  late final String summary;
  late final String content;
  final String date;
  final String minutes;
  final String image;

  PostDataModel({
    required this.id,
    required this.category,
    required this.author,
    required this.title,
    required this.summary,
    required this.content,
    required this.date,
    required this.minutes,
    required this.image,
  });

  factory PostDataModel.fromjson(Map<String, dynamic> map) {
    return PostDataModel(
      id: map['ID'],
      category: map['Category'],
      author: map['Author'],
      title: map['Title'],
      summary: map['Summary'],
      content: map['Content'],
      date: map['Date'], 
      minutes: map['Minutes'],
      image: map['Image'],
    );
  }

  Map<String, dynamic> tojson() {
    return {
      'ID': id,
      'Category': category,
      'Author': author,
      'Title': title,
      'Summary': summary,
      'Content': content,
      'Date': date, 
      'Minutes': minutes,
      'Image': image,
    };
  }
}