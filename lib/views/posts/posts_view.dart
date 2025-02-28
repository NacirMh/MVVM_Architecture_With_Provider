
import 'package:flutter/material.dart';
import 'package:mvvm_example/data/response/status.dart';
import 'package:mvvm_example/modelviews/posts_viewmodel.dart';
import 'package:provider/provider.dart';

class PostsView extends StatefulWidget {
  const PostsView({super.key});

  @override
  State<PostsView> createState() => _PostsViewState();
}

class _PostsViewState extends State<PostsView> {

   @override
  void initState() {
          Provider.of<PostsViewModel>(context, listen: false).fetchAllPosts();
    super.initState();
  }

   @override
  Widget build(BuildContext context) {
    //final vm = Provider.of<PostsViewModel>(context,listen: false);
    return Scaffold(
      appBar: AppBar(title: Text("test"),),
      body: Column(
        children: [
          Container(
            height: 500,
            child:Consumer<PostsViewModel>(builder: (context, vm, child) {
            switch(vm.postsList.status){
              case Status.loading :
                 return Center(child: CircularProgressIndicator());
              case Status.error: 
                 return Center(child: Text('${vm.postsList.message}' , style: TextStyle(color: Colors.red),));
              case Status.completed:
                  if(vm.postsList.data!.isEmpty){
                    return const Center(child:  Text('No data found'));
                  }
                 return ListView.builder(
                  itemCount: vm.postsList.data!.length,
                  itemBuilder: (context, index) {
                    final post = vm.postsList.data![index] ;
                    return Card(child: 
                       ListTile(
                        leading: Text('${post.id}'),
                        title: Text('${post.title}') ,
                        subtitle: Text('${post.body}'),
                       )
                    ,);
                  },);
                default:
                  return Container();
            }
          },) ,
          )
          
           
        ],
      ),
    );
  }
}
