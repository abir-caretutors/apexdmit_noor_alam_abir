import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class MaterialPurchaseDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

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
                  _buildTextField("Items*"),
                  _buildTextField("Store*"),
                  _buildTextField("Runner's Name*"),
                  _buildTextField("Amount*"),
                  _buildTextField("Card No*"),
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

  Widget _buildTextField(String label) {
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
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2100),
                );
                if (pickedDate != null) {
                  print(pickedDate.toLocal().toString().split(' ')[0]);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

}
