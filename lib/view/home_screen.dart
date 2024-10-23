import 'package:flutter/material.dart';
import 'package:mvvm_learnig/data/response/status.dart';
import 'package:mvvm_learnig/model/movies_list.dart';
import 'package:mvvm_learnig/utility/routes/routes_name.dart';
import 'package:mvvm_learnig/utility/utils.dart';
import 'package:mvvm_learnig/view_model/home_view_view_model.dart';
import 'package:mvvm_learnig/view_model/services/splash_services.dart';
import 'package:mvvm_learnig/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewViewModel hvm = HomeViewViewModel();

  @override
  void initState() {
    hvm.fetchMoviesListApi();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    final userPreferences = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Cinema at Home'),
          automaticallyImplyLeading: false,
          actions: [
            PopupMenuButton(
                icon: Icon(Icons.more_vert),
                itemBuilder: (context) => [
                      PopupMenuItem(
                          child: InkWell(
                              onTap: () {
                                userPreferences.removeUser().then((value) {
                                  Navigator.pushNamed(context, RouteName.login);
                                });
                              },
                              child: Text('Log Out')))
                    ])
          ],
          centerTitle: true,
        ),
        body: ChangeNotifierProvider<HomeViewViewModel>(
          create: (BuildContext context) => hvm,
          child: Consumer<HomeViewViewModel>(
            builder: (context, value, _) {
              switch (value.moviesList.status) {
                case Status.LOADING:
                  return Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  return Center(child: Text(value.moviesList.message.toString()));
                case Status.COMPLETED:
                  return ListView.builder(
                    itemCount: value.moviesList.data!.movies!.length,
                    itemBuilder: (context, index) {
                      final movie = value.moviesList.data!.movies![index];
                      return Card(
                        elevation: 4.0,
                        margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Image at the top
                            Image.network(
                              movie.posterurl.toString(),
                              height: 300, // Adjust height as needed
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stack) {
                                return Container(
                                  height: 200, // Same height as image
                                  child: Center(child: Icon(Icons.error, color: Colors.red)),
                                );
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie.title.toString(),
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Story Line: " + movie.storyline.toString(),
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                              child: Row(
                                children: [
                                  Icon(Icons.star, color: Colors.yellowAccent),
                                  Text(
                                    Utils.averageRating(movie.ratings!).toStringAsFixed(1),
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                default:
                  return Container();
              }
            },
          ),
        )

    );
  }
}
