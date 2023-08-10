import 'package:supabase_flutter/supabase_flutter.dart';
import '../utils/constant.dart';

User? user = client.auth.currentUser;

Future<bool> signInEmailAndPassword(
  String email,
  String password,
) async {
  try {
    final AuthResponse response = await client.auth.signInWithPassword(
      email: email,
      password: password,
    );

    final userId = response.user?.id;

    if (userId != null) {
      return true;
    }

    if (userId == null) {
      throw const AuthException('Email/Password Salah');
    }

    print(response.session);
    print(response.user);

    return false;
  } catch (e) {
    return false;
  }
}

Future<bool> signUpEmailAndPassword(
  String email,
  String password,
  String name,
) async {
  try {
    final AuthResponse response = await client.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name,
        'email': email,
      },
    );

    final userId = response.user?.id;
    print(userId);
    print(response.user);

    if (userId != null) {
      return true;
    }
    if (userId == null) {
      throw const AuthException('Email sudah terdaftar');
    }

    return false;
  } catch (e) {
    print(e.toString());
    return false;
  }
}

Future<void> signOut() async {
  await client.auth.signOut();
  return;
}

Future<List<dynamic>?> getProjectData() async {
  try {
    final data = await client
        .from('project')
        .select('*')
        .order('id_project', ascending: true);

    if (data != null) {
      // print(data[0]['deadline']);
      return data;
    }
    return null;
  } catch (e) {
    print(e.toString());
  }
  return null;
}

Future<List<dynamic>?> getOneProject(int? id) async {
  try {
    final data = await client.from('project').select('*').eq('id_project', id);

    if (data != null) {
      print(data);
      return data;
    }
    return null;
  } catch (e) {
    print(e.toString());
  }
  return null;
}

Future<void> insertProjectData(
  String? name,
  String? desc,
  String? category,
  String? prioriry,
  String? deadline,
) async {
  await client.from('project').insert({
    'project_name': name,
    'description': desc,
    'category': category,
    'deadline': deadline,
    'priority': prioriry,
    'user_id': user?.id,
  });
}

Future<List<dynamic>?> getTask(int? id) async {
  try {
    final data = await client
        .from('task')
        .select('*')
        .eq('id_project', id)
        .order('id_project', ascending: true);

    if (data != null) {
      // print(data[0]['deadline']);
      return data;
    }
    return null;
  } catch (e) {
    print(e.toString());
  }
  return null;
}

Future<void> insertNewTask(
  String? name,
  String? deadline,
  String? status,
  int? projectId,
) async {
  final List<Map<String, dynamic>> data = await client.from('task').insert({
    'task_name': name,
    'deadline': deadline,
    'status': status,
    'id_project': projectId,
  }).select();

  print(data);
}
