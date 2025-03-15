

import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchfield/searchfield.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    var suggestions = [
      'United States', 'Germany', 'Canada', 'United Kingdom', 'France', 'Italy', 'Spain', 'Australia', 'India', 'China', 'Japan', 'Brazil', 'South Africa', 'Mexico', 'Argentina', 'Russia', 'Indonesia', 'Turkey', 'Saudi Arabia', 'Nigeria', 'Egypt',
    ];
    SearchFieldListItem<String> selectedValue = SearchFieldListItem<String>(
      'United States',
      item: 'United States',
    );
    FocusNode focus = FocusNode();

    return SafeArea(
        child: Scaffold(
          body: Column(
            children: [

              SizedBox(height: height * 0.04,),

              Padding(
                padding: EdgeInsets.only(left: width * 0.05, right: width * 0.05, ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Bounce(
                      duration: Duration(milliseconds: 300),
                      onPressed: (){

                      },
                      child: Container(
                        width: 40, // Small round size
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xFF2567E8), // Light background color
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    Text('Material Purchase', style: TextStyle(fontSize: height * 0.025),),

                    Icon(Icons.more_vert_sharp,),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04,),

              SearchField(
                onSearchTextChanged: (query) {
                  final filter = suggestions
                      .where((element) =>
                      element.toLowerCase().contains(query.toLowerCase()))
                      .toList();
                  return filter
                      .map((e) => SearchFieldListItem<String>(e,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(e,
                            style: TextStyle(fontSize: 24, color: Colors.red)),
                      )))
                      .toList();
                },
                selectedValue: selectedValue,
                onSuggestionTap: (x) {
                    selectedValue = x;
                },
                key: const Key('searchfield'),
                hint: 'Search by country name',
                itemHeight: 50,
                searchInputDecoration:
                SearchInputDecoration(hintStyle: TextStyle(color: Colors.red)),
                suggestionsDecoration: SuggestionDecoration(
                    padding: const EdgeInsets.all(4),
                    border: Border.all(color: Colors.red),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                suggestions: suggestions
                    .map((e) => SearchFieldListItem<String>(e,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text(e,
                          style: TextStyle(fontSize: 24, color: Colors.red)),
                    )))
                    .toList(),
                focusNode: focus,
                suggestionState: Suggestion.expand,
              ),

            ],
          ),
        )
    );
  }
}
