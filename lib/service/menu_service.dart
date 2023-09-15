
import 'package:sobatgizi/model/PaketMenu.dart';

import '../credentials/supabase_credentials.dart';

class MenuService {



  Future getMenuDetail({required int id}) async {
    final response = await SupabaseCredentials.supabaseClient
        .from('menu_package_info')
        .select().eq("id_menu", id);
    print(response[0]);
    if(response[0]['id_menu'] != null){
      return PaketMenu.fromJson(response[0]);
    } else{
      return null;
    }
  }

  Future getResultData() async {
    List<PaketMenu> listPaketMenu = [];
    final response = await SupabaseCredentials.supabaseClient
        .from('menu_package_info')
        .select();
    if (response[0]['id_menu'] != null) {
      for (var data in response) {
        listPaketMenu.add(PaketMenu.fromJson(data));
      }
      return listPaketMenu;
    } else {
      return null;
    }
  }

}