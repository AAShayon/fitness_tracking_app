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
