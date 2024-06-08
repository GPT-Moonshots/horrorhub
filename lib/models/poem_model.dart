class PoemModel {
  final String poemId;
  final String name;
  final String relationship;
  final String poemType;
  final String? language;
  String poem;

  PoemModel({
    required this.name,
    required this.relationship,
    required this.poemType,
    required this.poem,
    required this.poemId,
    required this.language,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'relationship': relationship,
      'poemType': poemType,
      'poem': poem,
      'poemId': poemId,
      'language': language ?? 'English'
    };
  }

  PoemModel.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        relationship = firestore['relationship'],
        poemType = firestore['poemType'],
        poemId = firestore['poemId'],
        poem = firestore['poem'],
        language = firestore['language'] ?? 'English';
}
