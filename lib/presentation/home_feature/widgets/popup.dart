import 'dart:ui';
import 'package:apexdmit_noor_alam_abir/data/local/local_storage.dart';
import 'package:apexdmit_noor_alam_abir/domain_infrastructure/home/home_dom_i.dart';
import 'package:apexdmit_noor_alam_abir/presentation/home_feature/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';


class MaterialPurchaseDialog extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final item = useState('');
    final store = useState('');
    final runner_name = useState('');
    final amount = useState('');
    final card_no = useState('');
    final date = useState('${DateFormat('yyyy-MM-dd').format(DateTime.now())}');
    TextEditingController controller = TextEditingController();
    controller.text = date.value;


    Widget _buildDateField(BuildContext context) {
      return Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center, // Align items in the center
          children: [
            // Label with fixed width
            SizedBox(
              width: 120, // Adjust width to match other labels
              child: Text(
                "Date*",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(width: 10), // Space between label and text field
            // Expandable TextField
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  suffixIcon: Icon(Icons.calendar_month_outlined), // Calendar icon
                ),
                readOnly: true,
                controller: controller,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.tryParse(date.value),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    //print(pickedDate.toLocal().toString().split(' ')[0]);
                    String formattedDate = DateFormat('MM-dd-yyyy').format(pickedDate);
                    controller.text = formattedDate;
                    date.value = formattedDate;
                  }
                },
              ),
            ),
          ],
        ),
      );
    }


    return Stack(
      children: [
        // Blurred Background
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            color: Colors.black.withOpacity(0.2),
          ),
        ),
        // Dialog Box with Max Width Constraint
        Align(
          alignment: Alignment.center,
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: 600, // Max width for large screens
              ),
              //padding: EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Section
                  Container(
                    height: height * 0.06,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xFF2567E8),
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    child: Center(
                      child: Text(
                        "Material Purchase",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: height * 0.02,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _buildTextField("Items*", (String value) {
                    item.value = value;
                  }),
                  _buildTextField("Store*", (String value) {
                    store.value = value;
                  }),
                  _buildTextField("Runner's Name*", (String value) {
                    runner_name.value = value;
                  }),
                  _buildTextField("Amount*", (String value) {
                    amount.value = value;
                  }),
                  _buildTextField("Card No*", (String value) {
                    card_no.value = value;
                  }),
                  _buildDateField(context),
                  SizedBox(height: height * 0.02),
                  // Save Button
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Bounce(
                        duration: Duration(milliseconds: 300),
                        onPressed: (){
                          Map<String, dynamic> jsonBody = {
                            "material_purchase": [
                              {
                                "line_item_name": item.value,
                                "store": store.value,
                                "runners_name": runner_name.value,
                                "amount": amount.value,
                                "card_number": card_no.value,
                                "transaction_date": date.value
                              }
                            ]
                          };
                          Home_Dom_I().addProducts(
                              GetUserLocalStorageV2().token().toString(),
                              context,
                              jsonBody
                          ).then((onValue){
                            Navigator.of(context).pop();
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => HomePage()),
                            );
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFF2567E8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: width * 0.2,
                          height: width * 0.1,
                          child: Center(
                            child: Text('Save', style: TextStyle(color: Colors.white),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextField(String label, VoidCallback? onTap(String value)) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center, // Align text and field in the center
        children: [
          // Label with fixed width
          SizedBox(
            width: 120, // Adjust this width based on your needs
            child: Text(
              label,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 10), // Space between label and text field
          // Expandable TextField
          Expanded(
            child: TextField(
              onChanged: (value) => onTap(value),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
            ),
          ),
        ],
      ),
    );
  }


}
