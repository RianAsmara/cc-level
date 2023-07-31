import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

class Service {
  Handler get handler {
    final router = Router();

    // GET
    router.get('/level/<level>', (Request request, String level) {
      print(level);
      final htmlResponse = generateHTMLResponse(level);

      final headers = {'Content-Type': 'text/html'};
      return Response.ok(htmlResponse, headers: headers);
    });

    router.all('/<ignored|.*>', (Request request) {
      return Response.notFound('Page not found');
    });

    return router;
  }

  String generateHTMLResponse(String level) {
    return '''
    <!DOCTYPE html>
    <html>
    
    <head>
        <title>Level: $level</title>
    </head>
    
    <body>
        <h1>Level: $level</h1>
        <h2>Which one do you choose?</h2>
        <div style="
            margin: 2rem; 
            display: flex; 
            flex-direction: row;
            flex-direction: row;
            flex-wrap: wrap;
            ">
            <button id="win" style="
                border: none; 
                margin-right: 1rem;
                padding: 1rem; 
                background-color: green; 
                color: white; 
                font-weight: bolder;
                font-size: 1rem;
                ">Win</button>
                    <button id="lose" style="
                border: none; 
                padding: 1rem; 
                background-color: red; 
                color: white; 
                font-weight: bolder;
                font-size: 1rem;">Lose</button>
        </div>
    </body>
    
    </html>
  ''';
  }
}
