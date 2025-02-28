import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example/data/response/api_response.dart';
import 'package:mvvm_example/models/post_model.dart';
import 'package:mvvm_example/data/repositories/posts/api_post_repository.dart';
import 'package:mvvm_example/data/repositories/posts/post_repository.dart';

class PostsViewModel with ChangeNotifier{
  PostRepository postRepository = ApiPostRepository();

  final String _title = "Posts";
  String get title => _title;
 
  ApiResponse<List<PostModel>> postsList = ApiResponse.loading();

 setMoviesList(ApiResponse<List<PostModel>> response){
    postsList = response ;
    notifyListeners();
  }
  Future fetchAllPosts() async{
    setMoviesList(ApiResponse.loading());

    postRepository.getAllPosts().then((value){
      print(value);
      setMoviesList(ApiResponse.completed(value));
    }).onError((error, stackTrace){
      if (kDebugMode) {
        print(error);
        print(stackTrace);
      }
      setMoviesList(ApiResponse.error(error.toString()));
    });  
  }
}