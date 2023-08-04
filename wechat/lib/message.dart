import 'package:flutter/material.dart';

class Message {
  Message({
    // required this.type,
    required this.toId,
    required this.read,
    required this.sent,
    required this.msg,
    required this.fromid,
  });
  // late final String type;
  late final String toId;
  late final String read;
  late final String sent;
  late final String msg;
  late final String fromid;
  
  Message.fromJson(Map<String, dynamic> json){
    // type = json['type'].toString()==Type.image.name?Type.image:Type.text;
    // type = json['type'].toString()==Type.image.name?Type.image.name:Type.text.name;
    toId = json['toId'].toString();
    read = json['read'].toString();
    sent = json['sent'].toString();
    msg = json['msg'].toString();
    fromid = json['fromid'].toString();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    // _data['type'] = type;
    // _data['type'] = type;
    _data['toId'] = toId;
    _data['read'] = read;
    _data['sent'] = sent;
    _data['msg'] = msg;
    _data['fromid'] = fromid;
    return _data;
  }
}
// enum Type { text, image }