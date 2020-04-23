import 'package:dio/dio.dart';

import '../../contract/crud.dart';

class ApiService extends Crud {
  static final String BASE_URL = "https://jsonplaceholder.typicode.com";

  var dio = Dio(BaseOptions(
    baseUrl: ApiService.BASE_URL,
    connectTimeout: 5000,
  ));

  Future<void> teste() async {
    Response response = await dio.get("/posts");
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
  }

  @override
  Future create(item) async {
    Response response = await dio.post(
      "$BASE_URL/posts",
      data: null,
      //headers: {"content-type": "application/json"},
    );
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future delete(item) async {
    Response response = await dio.delete("/posts/1");
    print(response.statusCode);
    print(response.statusMessage);
    print(response.data);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
//    final response = await client.delete(
//      "$baseUrl/api/profile/$id",
//      headers: {"content-type": "application/json"},
//    );

//  }
  }

  @override
  Future<List> findBy(String field, value) async {
    Response response = await dio.get("/posts?userId=1");
  }

  @override
  Future read(item) async {
    Response response = await dio.get("/posts");
  }

  @override
  Future update(item) async {
    Response response = await dio.put(
      "/posts",
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      },
    );

    //    final response = await client.put(
//      "$baseUrl/api/profile/${data.id}",
//      headers: {"content-type": "application/json"},
//      body: profileToJson(data),
//    );
//    if (response.statusCode == 200) {
//      return true;
//    } else {
//      return false;
//    }
  }

  @override
  Future<List> list() {
    // TODO: implement list
    return null;
  }

//  Client client = Client();
//
//  Future<List<Profile>> getProfiles() async {
//    final response = await client.get("$baseUrl/api/profile");
//    if (response.statusCode == 200) {
//      return profileFromJson(response.body);
//    } else {
//      return null;
//    }
//  }
//
//  Future<bool> createProfile(Profile data) async {
//    final response = await client.post(
//      "$baseUrl/api/profile",
//      headers: {"content-type": "application/json"},
//      body: profileToJson(data),
//    );
//    if (response.statusCode == 201) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//
//  Future<bool> updateProfile(Profile data) async {
//    final response = await client.put(
//      "$baseUrl/api/profile/${data.id}",
//      headers: {"content-type": "application/json"},
//      body: profileToJson(data),
//    );
//    if (response.statusCode == 200) {
//      return true;
//    } else {
//      return false;
//    }
//  }
//
//  Future<bool> deleteProfile(int id) async {
//    final response = await client.delete(
//      "$baseUrl/api/profile/$id",
//      headers: {"content-type": "application/json"},
//    );
//    if (response.statusCode == 200) {
//      return true;
//    } else {
//      return false;
//    }
//  }
}
