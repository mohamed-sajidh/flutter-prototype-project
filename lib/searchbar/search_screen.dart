import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_widgets/searchbar/api_services.dart';
import 'package:testing_widgets/searchbar/movie_details_screen.dart';
import 'package:testing_widgets/searchbar/movie_recomentation_model.dart';
import 'package:testing_widgets/searchbar/search_model.dart';

const imageUrl = "https://image.tmdb.org/t/p/w500";

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  TextEditingController searchController = TextEditingController();

  ApiServices apiServices = ApiServices();

  late Future<MovieRecommendationModel> popularMovies;

  SearchModel? searchModel;

  //! passing the textfield data to getsearchmovie function and instantaniously passing result to model.
  void search(String query) {
    apiServices.getSarchedMovies(query).then((results) {
      setState(() {
        searchModel = results;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    popularMovies = apiServices.getPopularMovies();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //! Body
        body: SingleChildScrollView(
          child: Column(
            children: [
              //! Search Bar
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, top: 16),
                child: CupertinoSearchTextField(
                  padding: const EdgeInsets.all(15),
                  controller: searchController,
                  prefixIcon: const Icon(
                    size: 21,
                    Icons.search,
                    color: Colors.grey,
                  ),
                  suffixIcon: const Icon(
                    Icons.cancel,
                    color: Colors.grey,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  backgroundColor: Colors.grey.withOpacity(0.25),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      // perform noting
                    } else {
                      search(searchController.text);
                    }
                  },
                ),
              ),

              //! Show recommendation when search is empty
              searchController.text.isEmpty
                  ? FutureBuilder(
                      future: popularMovies,
                      builder: (context, snapshot) {
                        //! return the column if snapshot has recieved data else return a sizedbox
                        if (snapshot.hasData) {
                          //! storing data inside data
                          var data = snapshot.data?.results;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Top Searches",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: 22,
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    // navigate to movie-details screen
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ScreenMovieDetails(
                                                      movieId:
                                                          data[index].id)));
                                    },
                                    child: Container(
                                      height: 150,
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      //! displaying the image
                                      child: Row(
                                        children: [
                                          Image.network(
                                              "$imageUrl${data[index].posterPath}"),
                                          const SizedBox(width: 20),
                                          SizedBox(
                                              width: 260,
                                              child: Text(
                                                data[index].title,
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                              ))
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                itemCount: data!.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                              )
                            ],
                          );
                        } else {
                          return const Center(
                              child: CircularProgressIndicator(
                            color: Colors.grey,
                          ));
                        }
                      })
                  :
                  //! Grid items
                  searchModel == null
                      ? const SizedBox.shrink()
                      : GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: searchModel?.results.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 15,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: 1.2 / 2),
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => ScreenMovieDetails(
                                          movieId:
                                              searchModel!.results[index].id))),
                              child: Column(
                                children: [
                                  // shows netflix logo if backdroppath is null( ie, if api has no image)
                                  searchModel!.results[index].backdropPath ==
                                          null
                                      ? Image.asset(
                                          "assets/netflix.png",
                                          height: 170,
                                        )
                                      : CachedNetworkImage(
                                          imageUrl:
                                              "$imageUrl${searchModel!.results[index].backdropPath}",
                                          height: 170),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      searchModel!.results[index].originalTitle,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
