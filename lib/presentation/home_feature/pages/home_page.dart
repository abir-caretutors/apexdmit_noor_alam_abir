

import 'dart:ui';

import 'package:apexdmit_noor_alam_abir/data/local/local_storage.dart';
import 'package:apexdmit_noor_alam_abir/data/remote/responses/get_material_response.dart';
import 'package:apexdmit_noor_alam_abir/domain_infrastructure/home/home_dom_i.dart';
import 'package:apexdmit_noor_alam_abir/presentation/auth_feature/pages/login_page.dart';
import 'package:apexdmit_noor_alam_abir/presentation/home_feature/widgets/popup.dart';
import 'package:apexdmit_noor_alam_abir/presentation/home_feature/widgets/table.dart';
import 'package:data_table_2/data_table_2.dart';
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
    final purchases = useState(GetMaterialResponse(statusCode: '', statusMessage: '', materialPurchaseList: null));

    print(GetUserLocalStorageV2().token());
    var suggestions = [
      'United States', 'Germany', 'Canada', 'United Kingdom', 'France', 'Italy', 'Spain', 'Australia', 'India', 'China', 'Japan', 'Brazil', 'South Africa', 'Mexico', 'Argentina', 'Russia', 'Indonesia', 'Turkey', 'Saudi Arabia', 'Nigeria', 'Egypt',
    ];
    SearchFieldListItem<String> selectedValue = SearchFieldListItem<String>(
      'United States',
      item: 'United States',
    );
    FocusNode focus = FocusNode();

    useEffect(() {
      Future.microtask(() {
         Home_Dom_I().getProducts(GetUserLocalStorageV2().token().toString(), context).then((onValue){
           purchases.value = onValue;
           print(purchases);
         });
      });
      return null;
    },[]);

    void _showPopup(BuildContext context) {
      showDialog(
        context: context,
        builder: (context) => MaterialPurchaseDialog(),
      );
    }

    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(

            backgroundColor: Color(0xFF2567E8),
              onPressed: (() => _showPopup(context)),
            child: Icon(Icons.add_circle, color: Colors.white,),
          ),
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
                        width: 30, // Small round size
                        height: 30,
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

                    Bounce(
                      duration: Duration(milliseconds: 300),
                        onPressed: () async{
                          showDialog(
                            context: context,
                            barrierDismissible: false, // Optional: Close the dialog only by interacting with the menu
                            builder: (BuildContext context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0), // Apply blur
                                child: GestureDetector(
                                  onTap: () {
                                    // Close the dialog when tapping outside
                                    Navigator.pop(context);
                                  },
                                  child: SizedBox(),
                                ),
                              );
                            },
                          );
                          showMenu(
                            color: Color(0xFF2567E8),
                            context: context,
                            position: RelativeRect.fromLTRB(200, 100, 0, 0),
                            items: [
                              PopupMenuItem<String>(
                                value: 'Option 1',
                                onTap: (){
                                  Navigator.pop(context);
                                  SetUserLocalStorageV2().clearUser();
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(builder: (context) => LoginPage()),
                                  );
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Icon(Icons.logout_outlined, color: Colors.white,),
                                      Text(' Logout', style: TextStyle(color: Colors.white),),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );

                        },
                        child: Icon(Icons.more_vert_sharp,)
                    ),
                  ],
                ),
              ),

              SizedBox(height: height * 0.04,),

              Padding(
                padding: EdgeInsets.only(left: height * 0.04, right: height * 0.04),
                child: SearchField(

                  onSearchTextChanged: (query) {
                    final filter = purchases.value.materialPurchaseList!.data!
                        .where((element) =>
                        element.lineItemName.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                    return filter
                        .map((e) => SearchFieldListItem<String>(e.lineItemName,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(e.lineItemName,
                              style: TextStyle(fontSize: 24, color: Color(0xFF2567E8))),
                        )))
                        .toList();
                  },
                  selectedValue: selectedValue,
                  onSuggestionTap: (x) {
                      selectedValue = x;
                  },
                  key: const Key('searchfield'),
                  hint: 'Search by Item Name',
                  itemHeight: 50,
                  searchInputDecoration:
                  SearchInputDecoration(
                      hintStyle: TextStyle(color: Color(0xFF2567E8)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                  suggestionsDecoration: SuggestionDecoration(
                      padding: const EdgeInsets.all(4),
                      border: Border.all(color: Color(0xFF2567E8)),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  suggestions: purchases.value.materialPurchaseList!.data!
                      .map((e) => SearchFieldListItem<String>(e.lineItemName,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(e.lineItemName,
                            style: TextStyle(fontSize: 24, color: Color(0xFF2567E8))),
                      )))
                      .toList(),
                  focusNode: focus,
                  suggestionState: Suggestion.expand,
                ),
              ),

              SizedBox(height: height * 0.05,),

              Padding(
                padding: EdgeInsets.only(left: height * 0.01,),
                child: Container(
                  height: height * 0.6,
                  width: double.infinity,
                  //color: Colors.grey,
                  child: CustomHorizontalDataTable(
                    purchases: purchases, // Provide the data for purchases
                    height: MediaQuery.of(context).size.height, // Pass the height for sizing
                  ),
              ),),

            ],
          ),
        )
    );
  }
}
