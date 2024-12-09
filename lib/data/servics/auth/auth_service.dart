import 'package:skillzy/data/repository/user_repository.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  // Sign in
  Future<AuthResponse> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _supabaseClient.auth
        .signInWithPassword(email: email, password: password);
  }

  // Sign up
  Future<AuthResponse> signUpWithEmailAndPassword(
      {required String email,
      required String password,
      required String username}) async {
    return await _supabaseClient.auth
        .signUp(email: email, password: password, data: {'username': username});
  }

  // Logout
  Future<void> signOut() async {
    await _supabaseClient.auth.signOut();
  }

  // Get current session
  Session? getCurrentSession() {
    final session = _supabaseClient.auth.currentSession;
    return session;
  }

  // Get current user email
  String? getCurrentUserEmail() {
    final session = _supabaseClient.auth.currentUser;
    return session?.email;
  }
}
