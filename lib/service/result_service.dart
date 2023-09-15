import 'package:sobatgizi/credentials/supabase_credentials.dart';

import '../model/Result.dart';

class ResultService {



  Future getResultData() async {
    List<Result> listResult = [];
    final response = await SupabaseCredentials.supabaseClient
        .from('hasil')
        .select();

    if(response[0]['Alternatif'] != null){
      for(var data in response){
        listResult.add(Result.fromJson(data));
      }
      return listResult;
    } else{
      return null;
    }

  }

}
