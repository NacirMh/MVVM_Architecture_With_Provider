import 'package:flutter/material.dart';
import 'package:mvvm_example/configs/routes/routes_name.dart';
import 'package:mvvm_example/views/posts/posts_view.dart';

class Routes {

  static Route<dynamic>  generateRoute(RouteSettings settings){

    switch(settings.name){
      //case RoutesName.splash:
        //return MaterialPageRoute(builder: (BuildContext context) => const SplashView());

      //case RoutesName.home:
        //return MaterialPageRoute(builder: (BuildContext context) => const HomeView());

      //case RoutesName.login:
       // return MaterialPageRoute(builder: (BuildContext context) => const LoginView());
      case RoutesName.posts:
       return MaterialPageRoute(builder: (BuildContext context) => const PostsView());
      default:
        return MaterialPageRoute(builder: (_){
          return const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          );
        });

    }
  }
}