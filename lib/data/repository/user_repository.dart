import 'package:supabase_flutter/supabase_flutter.dart';

class UserRepository {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Create or update user in the database
  Future<String> createUser(
      String userId, String username, String? firstname, String? lastname) async {

    final update = {
      'id': userId,
      'username': username,
      'firstname': firstname,
      'lastname': lastname,
      'created_at': DateTime.now().toIso8601String(),
    };

    await _supabaseClient.from('users').upsert(update);
    return username;
  }

  // Get the current user's username
  Future<String?> getCurrentUsername() async {
    final userId = _supabaseClient.auth.currentUser!.id;

    final data =
        await _supabaseClient.from('users').select().eq('id', userId).single();
    return data['username'];
  }
}
