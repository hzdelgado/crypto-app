import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class FirebaseResponse {
  final String? status;
  final String? message;
  FirebaseResponse({
    this.status,
    this.message,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
    };
  }

  factory FirebaseResponse.fromMap(Map<String, dynamic> map) {
    return FirebaseResponse(
      status: map['status'] != null ? map['status'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FirebaseResponse.fromJson(String source) => FirebaseResponse.fromMap(json.decode(source) as Map<String, dynamic>);
}
