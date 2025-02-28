import 'package:mvvm_example/configs/app_urls.dart';
import 'package:mvvm_example/data/network/network_api_service.dart';
import 'package:mvvm_example/models/post_model.dart';
import 'package:mvvm_example/data/repositories/posts/post_repository.dart';

class ApiPostRepository extends PostRepository{
  final _apiServices = NetworkApiService();
  
  @override
  Future<List<PostModel>> getAllPosts() async {
     dynamic response = await _apiServices.getGetApiResponse(AppUrls.postsApi);
     return (response as List).map((post) => PostModel.fromJson(post)).toList();       
  }

  @override
  Future<PostModel> getPostById(int id) {
    // TODO: implement getPostById
    throw UnimplementedError();
  }
    
}