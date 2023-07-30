import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'service.dart';

class Api {
  Future<Response> _levels(Request request) async {
    return Response.ok('[]');
  }
}