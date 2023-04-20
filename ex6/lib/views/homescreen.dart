
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../models/photo.dart';
import '../views_model/click_view_model.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FutureBuilder Example'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, "/addPhoto"),
        child: const Icon(Icons.add),
      ),
      body: Consumer<ClickViewModel>(
        builder: (context, viewModel, child) => FutureBuilder<List<Photo>>(
          future:
              Future.delayed(const Duration(seconds: 4), () => viewModel.items),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final post = snapshot.data?[index];
                    return displayFilm(post!);
                  },
                  separatorBuilder: (context, index) => const Divider());
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            } else {
              return Scaffold(
                body: Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.red,
                    size: 200,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget displayFilm(Photo films) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Image.network(
              films.thumbnail ,
              width: 150,
              height: 100,
            ),
          ),
          Expanded(
            flex: 7,
            child: Text(
              'ID: ${films.id} ${films.titre}',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
