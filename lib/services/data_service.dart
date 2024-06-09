import 'package:green_alert/main.dart';

class DataService {
  Future<List<Map<String, dynamic>>> getLast7Data() async {
    final response = await supabase
        .from('data_iot')
        .select('uv, ph, humidity')
        .order('created_at', ascending: false)
        .limit(7);

    return response;
  }
}
