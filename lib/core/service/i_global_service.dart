abstract class IGlobalService {
  Future<String> trocarSenha(
      String email, String old_password, String new_password);
}
