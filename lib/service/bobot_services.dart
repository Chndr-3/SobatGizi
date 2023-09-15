import '../credentials/supabase_credentials.dart';
import '../helper/user_info.dart';
import '../model/Bobot.dart';

class BobotServices {
  Future<bool> insertBobot(
      {required int kalori,
      required int protein,
      required int karbohidrat,
      required int lemak,required int jumlahMakan}) async {
    String? userId = await UsersInfo().getIdUser();
    final getResponse = await SupabaseCredentials.supabaseClient
        .from('preferensi_bobot')
        .select()
        .eq("id_pengguna", userId);
    print(getResponse);
    if (getResponse.length == 0) {

      final response = await SupabaseCredentials.supabaseClient
          .from('preferensi_bobot')
          .insert({
        'id_pengguna': userId,
        'bobot_kalori': kalori,
        'bobot_protein': protein,
        'bobot_karbohidrat': karbohidrat,
        'bobot_lemak': lemak,
        'jumlah_makan_harian' : jumlahMakan
      }).execute();
      print(response.data);
      if (response.status == 201) {
        return true;
      } else {
        return false;
      }
    } else {

      final editResponse = await SupabaseCredentials.supabaseClient
          .from('preferensi_bobot')
          .update({
            'bobot_kalori': kalori,
            'bobot_protein': protein,
            'bobot_karbohidrat': karbohidrat,
            'bobot_lemak': lemak,
        'jumlah_makan_harian' : jumlahMakan
          })
          .eq("id_pengguna", userId)
          .execute();
      print(editResponse.status);
      if (editResponse.status == 201) {
        return true;
      } else {
        return false;
      }
    }
  }

  Future<Bobot> getBobot() async {
    String? userId = await UsersInfo().getIdUser();
    final getResponse = await SupabaseCredentials.supabaseClient
        .from('preferensi_bobot')
        .select()
        .eq("id_pengguna", userId);
    if(getResponse[0] != null){
      return Bobot.fromJson(getResponse[0]);
    }
    return Bobot();
  }
}
