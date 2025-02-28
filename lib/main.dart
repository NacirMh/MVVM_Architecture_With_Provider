import 'package:flutter/material.dart';
import 'package:mvvm_example/configs/routes/routes.dart';
import 'package:mvvm_example/configs/routes/routes_name.dart';
import 'package:mvvm_example/modelviews/posts_viewmodel.dart';
import 'package:mvvm_example/views/posts/posts_view.dart';
import 'package:provider/provider.dart';

main() => runApp(
  MultiProvider(
      providers: [
        // Add more ViewModels here
        ChangeNotifierProvider(create: (context) => PostsViewModel()),
      ],
      child: App(),
    )
);

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsView(),
      // this is the initial route indicating from where our app will start
      initialRoute: RoutesName.posts,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}