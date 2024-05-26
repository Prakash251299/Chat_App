class ChatUser {
  ChatUser({
    required this.about,
    required this.name,
    required this.email,
    required this.image,
    // required this.about,
    // required this.name,
  });
  late final String about;
  late final String name;
  late final String email;
  late final String image;
  
  ChatUser.fromJson(Map<String, dynamic> json){
    about = json['about'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['about'] = about;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    return data;
  }
}