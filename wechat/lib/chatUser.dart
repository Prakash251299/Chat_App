class ChatUser {
  ChatUser({
    required this.about,
    required this.name,
    // required this.about,
    // required this.name,
  });
  late final String about;
  late final String name;
  
  ChatUser.fromJson(Map<String, dynamic> json){
    about = json['about'] ?? '';
    name = json['name'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about;
    data['name'] = name;
    return data;
  }
}