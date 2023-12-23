import 'package:flutter_app/adapters/repository_adapter.dart';
import 'package:flutter_app/services/api/api_client.dart';
import 'package:flutter_app/services/firebase_service.dart';

class AuthRepository extends IAuthRepository {
  final ApiClient apiClient;
  final FirebaseService firebaseService;
  AuthRepository({
    required this.apiClient,
    required this.firebaseService,
  });
}
