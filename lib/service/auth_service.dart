
import 'package:sobatgizi/credentials/supabase_credentials.dart';
import 'package:sobatgizi/helper/user_info.dart';
import 'package:supabase/supabase.dart';


class AuthService {
  Future<bool> register({
    required String email,
    required String password,
  }) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient.auth
        .signUp(password: password, email: email);
    if (response.user != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login({required String email, required String password}) async {
    AuthResponse response = await SupabaseCredentials.supabaseClient.auth
        .signInWithPassword(password: password, email: email);
    await UsersInfo().setIdUser(
        SupabaseCredentials.supabaseClient.auth.currentUser!.id);
    if (response.user != null) {
      return true;
    } else {
      return false;
    }
  }
}