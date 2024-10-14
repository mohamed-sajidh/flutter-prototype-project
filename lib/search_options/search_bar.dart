// // import 'package:flutter/material.dart';

// // class CustomSearchDelegate extends SearchDelegate {
// //   List<String> searchResults = [
// //     'Apple',
// //     'Banana',
// //     'Mango',
// //     'Orange',
// //     'Pineapple',
// //   ];

// //   @override
// //   List<Widget> buildActions(BuildContext context) {
// //     return [
// //       IconButton(
// //         icon: const Icon(Icons.clear),
// //         onPressed: () {
// //           query = '';
// //         },
// //       ),
// //     ];
// //   }

// //   @override
// //   Widget buildLeading(BuildContext context) {
// //     return IconButton(
// //       icon: const Icon(Icons.arrow_back),
// //       onPressed: () {
// //         close(context, null);
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildResults(BuildContext context) {
// //     if (query.isEmpty) {
// //       return Center(
// //         child: Text('No results to show'),
// //       );
// //     }

// //     List<String> matchQuery = searchResults.where((item) {
// //       return item.toLowerCase().contains(query.toLowerCase());
// //     }).toList();

// //     return ListView.builder(
// //       itemCount: matchQuery.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(matchQuery[index]),
// //           onTap: () {
// //             close(context, matchQuery[index]); // Return selected item
// //           },
// //         );
// //       },
// //     );
// //   }

// //   @override
// //   Widget buildSuggestions(BuildContext context) {
// //     if (query.isEmpty) {
// //       return Container();
// //     }

// //     List<String> suggestions = searchResults.where((element) {
// //       return element.toLowerCase().contains(query.toLowerCase());
// //     }).toList();

// //     return ListView.builder(
// //       itemCount: suggestions.length,
// //       itemBuilder: (context, index) {
// //         return ListTile(
// //           title: Text(suggestions[index]),
// //           onTap: () {
// //             query = suggestions[index];
// //             showResults(context);
// //           },
// //         );
// //       },
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:testing_widgets/search_options/search_services.dart';

// class CustomSearchDelegate extends SearchDelegate {
//   // final Dio _dio = Dio();

//   // API endpoint
//   final String searchApiUrl = 'https://api.example.com/search';

//   @override
//   List<Widget> buildActions(BuildContext context) {
//     return [
//       IconButton(
//         icon: const Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//         },
//       ),
//     ];
//   }

//   @override
//   Widget buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   // You can handle results like this, or customize it further if needed
//   @override
//   Widget buildResults(BuildContext context) {
//     if (query.isEmpty) {
//       return const Center(
//         child: Text('No results to show'),
//       );
//     }
//     // Call the API and show the results
//     return FutureBuilder(
//       future: fetchSearchResults(query), // Fetch search results from API
//       builder: (context, AsyncSnapshot<List<String>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error fetching results'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No results found'));
//         } else {
//           final results = snapshot.data!;
//           return ListView.builder(
//             itemCount: results.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(results[index]),
//                 onTap: () {
//                   close(context, results[index]); // Return selected item
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query.isEmpty) {
//       return const Center(
//         child: Text(
//           'Press the search icon to start searching',
//           style: TextStyle(fontSize: 16, color: Colors.grey),
//         ),
//       );
//     }

//     return FutureBuilder(
//       future: SearchServices.fetchSearchSuggestions(query),
//       builder: (context, AsyncSnapshot<List<String>> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return const Center(child: CircularProgressIndicator());
//         } else if (snapshot.hasError) {
//           return const Center(child: Text('Error fetching suggestions'));
//         } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//           return const Center(child: Text('No suggestions found'));
//         } else {
//           final suggestions = snapshot.data!;
//           return ListView.builder(
//             itemCount: suggestions.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(suggestions[index]),
//                 onTap: () {
//                   query = suggestions[index];
//                   showResults(context);
//                 },
//               );
//             },
//           );
//         }
//       },
//     );
//   }
// }
