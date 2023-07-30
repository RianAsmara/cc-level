import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Service {

  Handler get handler {
    final router = Router();

    // GET
    router.get('/random-level', () {
      Random random = Random();
      var response = 0 + random.nextInt(100 - 0);
      return Response.ok(response.toInt());
    });

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }
}