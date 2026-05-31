import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:libgenius/Global/global.dart';

abstract class ApiService {
  Future hitAPI();
  Future hitMultipartAPI(String file);
  Future hitMultiImagesAPI(List file, String? imageKey);
}

class ApiResponse extends ApiService {
  String? type;
  String? _url;
  Map<String, String>? _body;
  Map? _body2;
  Map<String, String>? headers;

  set urlSetter(String url) {
    _url = url;
  }

  set bodySetter(Map<String, String>? body) {
    _body = body;
    _body2 = null;
    headers = null;
  }

  set bodySetter2(Map body) {
    _body2 = body;
    _body = null;
  }

  set typeSetter(String type) {
    this.type = type;
  }

  set headerSetter(Map<String, String> headers) {
    this.headers = headers;
  }

  @override
  Future hitAPI() async {
    try {
      if (type == 'get') {
        final response = await http.get(Uri.parse(_url!), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = response.body;
          return data;
        } else {
          return "error ${response.body}";
        }
      } else if (type == 'delete') {
        final response = await http.delete(Uri.parse(_url!), headers: headers);
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = response.body;
          return data;
        } else {
          return "error ${response.body}";
        }
      } else if (type == 'post') {
        final response = await http.post(
          Uri.parse(_url!),
          headers: headers ?? {},
          body: _body ?? jsonEncode(_body2),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = response.body;
          return data;
        } else {
          myPrint(response);
          return "error ${response.body}";
        }
      } else if (type == 'put') {
        final response = await http.put(
          Uri.parse(_url!),
          headers: headers ?? {},
          body: _body ?? jsonEncode(_body2),
        );
        if (response.statusCode == 200 || response.statusCode == 201) {
          final data = response.body;
          return data;
        } else {
          myPrint(response);
          return "error ${response.body}";
        }
      }
    } catch (e) {
      myPrint(e);
      throw Exception(e);
    }
  }

  @override
  Future hitMultipartAPI(file, {String? key}) async {
    try {
      var request = http.MultipartRequest('$type', Uri.parse('$_url'));
      request.fields.addAll(_body ?? {});
      request.headers.addAll(headers ?? {});
      if (file.isNotEmpty) {
        final ext = file.split('.').last.toLowerCase();
        final mimeTypes = {
          'jpg': 'image/jpeg',
          'jpeg': 'image/jpeg',
          'png': 'image/png',
          'gif': 'image/gif',
          'webp': 'image/webp',
        };
        final mimeType = mimeTypes[ext] ?? 'image/jpeg';
        request.files.add(
          await http.MultipartFile.fromPath(
            key ?? 'profile_picture',
            file,
            contentType: MediaType.parse(mimeType),
          ),
        );
      }
      http.StreamedResponse value = await request.send();
      final response = await http.Response.fromStream(value);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;
        return data;
      } else {
        myPrint(response);
        return "error ${response.body}";
      }
    } catch (e) {
      myPrint(e);
      throw Exception(e);
    }
  }

  @override
  Future hitMultiImagesAPI(List file, [String? imageKey]) async {
    try {
      var request = http.MultipartRequest('$type', Uri.parse('$_url'));
      request.fields.addAll(_body ?? {});
      request.headers.addAll(headers ?? {});

      if (file.isNotEmpty) {
        for (File value in file) {
          request.files.add(
            await http.MultipartFile.fromPath(
              imageKey ?? 'images[]',
              value.path,
            ),
          );
        }
      }

      http.StreamedResponse value = await request.send();
      final response = await http.Response.fromStream(value);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;
        return data;
      } else {
        myPrint(response);
        return "error ${response.body}";
      }
    } catch (e) {
      myPrint(e);
      throw Exception(e);
    }
  }

  Future hitMultipleImagesWithKeysAPI(Map<String, String> images) async {
    try {
      var request = http.MultipartRequest('$type', Uri.parse('$_url'));
      request.fields.addAll(_body ?? {});
      request.headers.addAll(headers ?? {});

      if (images.isNotEmpty) {
        for (var entry in images.entries) {
          String key = entry.key;
          String filePath = entry.value;

          if (filePath.isNotEmpty) {
            request.files.add(await http.MultipartFile.fromPath(key, filePath));
          }
        }
      }

      http.StreamedResponse value = await request.send();
      final response = await http.Response.fromStream(value);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = response.body;
        return data;
      } else {
        myPrint(response);
        return "error ${response.body}";
      }
    } catch (e) {
      myPrint(e);
      throw Exception(e);
    }
  }
}
