class LoginModel {
  String? status;
  String? nome;
  String? token;
  int? id_aluno;

  LoginModel({this.status, this.nome, this.token});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    nome = json['nome'];
    token = json['token'];
    id_aluno = json['id_aluno'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['nome'] = this.nome;
    data['token'] = this.token;
    data['id_aluno'] = this.id_aluno;
    return data;
  }
}
