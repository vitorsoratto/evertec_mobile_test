class LoginModel {
  final String document;
  final String documentNumber;
  final String password;

  LoginModel(
      {this.document = '', this.documentNumber = '', this.password = ''});

  LoginModel.fromJson(Map<String, dynamic> json)
      : document = json['document'] ?? '',
        documentNumber = json['document_number'] ?? '',
        password = json['password'] ?? '';

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['document'] = document;
    data['document_number'] = documentNumber;
    data['password'] = password;
    return data;
  }
}
