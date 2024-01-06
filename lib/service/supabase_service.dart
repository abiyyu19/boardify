import 'dart:developer';

import 'package:boardify/models/project.dart';
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
      log('${response.session}');
      log('${response.user}');
      return true;
    }

    if (userId == null) {
      throw const AuthException('Email/Password Salah');
    }

    return false;
  } catch (e) {
    log(e.toString());
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

    if (userId != null) {
      log(userId);
      log('masuk yang ini loh ${response.user}');
      return true;
    }
    if (userId == null) {
      throw const AuthException('Email sudah terdaftar');
    }

    return false;
  } catch (e) {
    log(e.toString());
    return false;
  }
}

Future<bool> editProfile(
  String name,
  String email,
  String password,
) async {
  try {
    final UserResponse response = await client.auth.updateUser(
      UserAttributes(
        email: email,
        password: password,
        data: {
          'name': name,
          'email': email,
        },
      ),
    );

    final userId = response.user?.id;

    if (userId != null) {
      log(userId);
      log('masuk yang ini loh ${response.user}');
      return true;
    }
    if (userId == null) {
      throw const AuthException('ahahaha');
    }

    return false;
  } catch (e) {
    log(e.toString());
    return false;
  }
}

Future<void> signOut() async {
  await client.auth.signOut();
  return;
}

Future<List<dynamic>?> getProjectData() async {
  try {
    final data = await client.from('project').select(
        '''*, task:id_project (*) ''').order('id_project', ascending: true);

    log('haha3');

    if (data != null) {
      final project = Project.fromJson(data[0]);
      log('haha1 ${project.projectName}');
      // log('$data');
      return data;
    }
    return null;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<List<dynamic>?> getOneProject(int? id) async {
  try {
    final data = await client.from('project').select('*').eq('id_project', id);

    if (data != null) {
      log('satu proyek $data');
      return data;
    }
    return null;
  } catch (e) {
    log(e.toString());
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
  try {
    await client.from('project').insert({
      'project_name': name,
      'description': desc,
      'category': category,
      'deadline': deadline,
      'priority': prioriry,
      'user_id': user?.id,
    });
  } catch (e) {
    print(e.toString());
  }
}

Future<void> editProject(
  String? projectName,
  String? description,
  String? category,
  String? deadline,
  String? priority,
  int? projectId,
) async {
  try {
    await client.from('project').update(
      {
        'project_name': projectName,
        'description': description,
        'category': category,
        'deadline': deadline,
        'priority': priority,
      },
    ).match(
      {
        'id_project': projectId,
      },
    );
  } catch (e) {
    print(e.toString());
  }
}

Future<void> deleteProject(
  int? projectId,
) async {
  try {
    await client.from('project').delete().match({'id_project': projectId});
  } catch (e) {
    print(e.toString());
  }
}

Future<List<dynamic>?> getTask(int? id) async {
  try {
    final data = await client
        .from('task')
        .select('*')
        .eq('id_project', id)
        .order('status_level', ascending: true)
        .order('deadline', ascending: true);

    if (data != null) {
      // print(data[0]['deadline']);
      return data;
    }
    return null;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<List<dynamic>?> getAllTask() async {
  try {
    final data = await client
        .from('task')
        .select('''
    *,
    project:id_project ( * )
  ''')
        .order('status_level', ascending: true)
        .order('deadline', ascending: true);

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

Future<List<dynamic>?> getAllTaskWaiting() async {
  try {
    final data = await client
        .from('task')
        .select('''*, project:id_project ( * )''')
        .eq('status', 'Menunggu')
        .order('status_level', ascending: true)
        .order('deadline', ascending: true);

    if (data != null) {
      log('haha2 $data');
      return data;
    }
    return null;
  } catch (e) {
    log(e.toString());
  }
  return null;
}

Future<List<dynamic>?> getAllTaskDoing() async {
  try {
    final data = await client
        .from('task')
        .select('''*, project:id_project ( * )''')
        .eq('status', 'Dikerjakan')
        .order('status_level', ascending: true)
        .order('deadline', ascending: true);

    if (data != null) {
      log('$data');
      return data;
    }
    return null;
  } catch (e) {
    print(e.toString());
  }
  return null;
}

Future<List<dynamic>?> getTaskDoneOneProject() async {
  try {
    final data = await client
        .from('task')
        .select(
          '*',
        )
        .eq('status', 'Dikerjakan');

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

Future<List<dynamic>?> getOneTask(int? id) async {
  try {
    final data = await client.from('task').select('*').eq('id_task', id);

    if (data != null) {
      // print(data[0]['deadline']);
      // log('$data');
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
  int statusLevel;
  if (status == 'Menunggu') {
    statusLevel = 1;
  } else if (status == 'Dikerjakan') {
    statusLevel = 2;
  } else {
    statusLevel = 3;
  }
  try {
    await client.from('task').insert({
      'task_name': name,
      'deadline': deadline,
      'status': status,
      'id_project': projectId,
      'status_level': statusLevel,
    });
  } catch (e) {
    print(e.toString());
  }
}

Future<void> editTask(
  String? name,
  String? deadline,
  String? status,
  int? projectId,
  int? taskId,
) async {
  int statusLevel;
  if (status == 'Menunggu') {
    statusLevel = 1;
  } else if (status == 'Dikerjakan') {
    statusLevel = 2;
  } else {
    statusLevel = 3;
  }
  try {
    await client.from('task').update(
      {
        'task_name': name,
        'deadline': deadline,
        'status': status,
        'id_project': projectId,
        'status_level': statusLevel,
      },
    ).match(
      {
        'id_task': taskId,
      },
    );
  } catch (e) {
    print(e.toString());
  }
}

Future<void> deleteTask(
  int? taskId,
) async {
  try {
    await client.from('task').delete().match({'id_task': taskId});
  } catch (e) {
    print(e.toString());
  }
}
