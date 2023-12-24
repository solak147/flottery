import 'package:flottery/controller/posts_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetX<PostsController>(
        init: PostsController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Posts'),
            ),
            body: controller.loading.value
                ? Center(child: CircularProgressIndicator())
                : ListView(
                    children: controller.posts
                        .map<Widget>((post) => ListTile(
                              leading: Text(post.id.toString()),
                              title: Text(post.title),
                              subtitle: Text(post.body),
                              trailing: Text('User ${post.userId}'),
                            ))
                        .toList(),
                  ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                controller.sendPost();
              },
            ),
          );
        });
  }
}

class Test2 extends StatelessWidget {
  final PostsController controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx(
        () => controller.loading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: controller.posts
                    .map<Widget>((post) => ListTile(
                          leading: Text(post.id.toString()),
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          trailing: Text('User ${post.userId}'),
                        ))
                    .toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.sendPost();
        },
      ),
    );
  }
}

class Test3 extends StatelessWidget {
  final PostsController controller = Get.put(PostsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: GetBuilder<PostsController>(
        builder: (pcs) => pcs.loading.value
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: pcs.posts
                    .map<Widget>((post) => ListTile(
                          leading: Text(post.id.toString()),
                          title: Text(post.title),
                          subtitle: Text(post.body),
                          trailing: Text('User ${post.userId}'),
                        ))
                    .toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.sendPost();
        },
      ),
    );
  }
}
