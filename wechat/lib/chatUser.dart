class ChatUser {
  ChatUser({
    required this.about,
    required this.name,
    required this.email,
    // required this.about,
    // required this.name,
  });
  late final String about;
  late final String name;
  late final String email;
  
  ChatUser.fromJson(Map<String, dynamic> json){
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about;
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}