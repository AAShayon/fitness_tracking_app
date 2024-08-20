// import 'package:flutter/material.dart';
// import 'package:fitness_tracking_app/utils/constant/colors.dart';
// import 'package:fitness_tracking_app/modules/home/view/home.dart';
// import 'package:fitness_tracking_app/modules/activity/view/activity.dart';
// import 'package:fitness_tracking_app/modules/statistics/view/statistics.dart';
// import 'package:fitness_tracking_app/modules/profile/view/profile.dart';
//
// class CustomSearchDelegate extends SearchDelegate {
//   // Sample data to search from
//   List searchTerms = ['Home', 'Activity', 'Statistics', 'Profile'];
//
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     // Clear the search query
//     return [
//       IconButton(
//         onPressed: () {
//           query = ''; // Clear the search field
//         },
//         icon: const Icon(Icons.clear),
//       ),
//     ];
//   }
//
//   @override
//   Widget? buildLeading(BuildContext context) {
//     // Leading icon for back navigation
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null); // Close the search
//       },
//     );
//   }
//
//   @override
//   Widget buildResults(BuildContext context) {
//     // Show results based on the search query
//     List matchQuery = [];
//     for (var item in searchTerms) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(matchQuery[index]),
//           onTap: () {
//             navigateToScreen(context, matchQuery[index]);
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget buildSuggestions(BuildContext context) {
//     // Show suggestions while the user types
//     List matchQuery = [];
//     for (var item in searchTerms) {
//       if (item.toLowerCase().contains(query.toLowerCase())) {
//         matchQuery.add(item);
//       }
//     }
//
//     return ListView.builder(
//       itemCount: matchQuery.length,
//       itemBuilder: (context, index) {
//         return ListTile(
//           title: Text(matchQuery[index]),
//           onTap: () {
//             navigateToScreen(context, matchQuery[index]);
//           },
//         );
//       },
//     );
//   }
//
//   void navigateToScreen(BuildContext context, String screen) {
//     if (screen == 'Home') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Home()),
//       );
//     } else if (screen == 'Activity') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Activity()),
//       );
//     } else if (screen == 'Statistics') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Statistics()),
//       );
//     } else if (screen == 'Profile') {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => const Profile()),
//       );
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:fitness_tracking_app/modules/activity/view/activity.dart';
import 'package:fitness_tracking_app/modules/home/view/home.dart';
import 'package:fitness_tracking_app/modules/profile/view/profile.dart';
import 'package:fitness_tracking_app/modules/statistics/view/statistics.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<String> suggestions = [
    'Home',
    'Activity',
    'Statistics',
    'Profile',
  ];

  final Map<String, Widget> screens = {
    'Home': const Home(),
    'Activity': const Activity(),
    'Statistics': const Statistics(),
    'Profile': const Profile(),
  };

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (screens.containsKey(query)) {
      return screens[query]!;
    } else {
      return Center(
        child: Text('No results found for "$query"'),
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final filteredSuggestions = suggestions.where((suggestion) {
      return suggestion.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: filteredSuggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSuggestions[index]),
          onTap: () {
            query = filteredSuggestions[index];
            showResults(context); // Navigate to the selected screen
          },
        );
      },
    );
  }
}
