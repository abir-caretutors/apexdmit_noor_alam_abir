import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class CustomHorizontalDataTable extends StatelessWidget {
  final dynamic purchases;
  final double height;

  const CustomHorizontalDataTable({Key? key, this.purchases, required this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: height * 0.0005),
      child: Container(
        height: height * 0.6,
        width: double.infinity,
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 70,
          rightHandSideColumnWidth: 700,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          isFixedFooter: true,
          footerWidgets: _getFooterWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: purchases.value.materialPurchaseList?.data?.length ?? 0,
          rowSeparatorWidget: const Divider(
            color: Colors.black38,
            height: 1.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: const Color(0xFFFFFFFF),
          itemExtent: 55,
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('ID', 70),
      _getTitleItemWidget('Item Name', 100),
      _getTitleItemWidget('Store', 100),
      _getTitleItemWidget('Runners Name', 100),
      _getTitleItemWidget('Amount', 100),
      _getTitleItemWidget('Card Number', 100),
      _getTitleItemWidget('Transaction Date', 300),
    ];
  }

  List<Widget> _getFooterWidget() {
    return [
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
      SizedBox(),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      width: width,
      height: 56,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        color: Color(0xFF2567E8),
        borderRadius: (label=='ID') ? BorderRadius.only(
          topLeft: Radius.circular(12), // Adjust the radius as needed
        ) : null,
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );

  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
      width: 70,
      height: 52,
      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
      child: Text(purchases.value.materialPurchaseList!.data![index].id.toString()),
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    var purchase = purchases.value.materialPurchaseList!.data![index];
    return Row(
      children: <Widget>[
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.lineItemName),
        ),
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.store),
        ),
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.runnersName),
        ),
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.amount.toString()),
        ),
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 100,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.cardNumber),
        ),
        Container(
          color: (index % 2 != 0) ? Color(0xFFF5F7FA) : Colors.white,
          width: 300,
          height: 52,
          padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
          child: Text(purchase.transactionDate.toString()),
        ),
      ],
    );
  }
}
