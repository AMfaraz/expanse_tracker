import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'dart:ui' as ui;
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';

//utils
import '../utils/colors.dart';

//widgets
import '../widgets/recent_expense_list.dart';
import '../widgets/expenses_screen_widgets/expense_pie_chart.dart';

class ExpensesScreen extends StatelessWidget {

  final GlobalKey pieChartKey=GlobalKey();

  ExpensesScreen({super.key});

  Future<void> downloadPieChartAsPdf(pieChart) async {
      // Capture the pie chart as an image
      ui.Image chartImage = await pieChart.capturePieChart();
      ByteData? byteData = await chartImage.toByteData(format: ui.ImageByteFormat.png);
      Uint8List imageBytes = byteData!.buffer.asUint8List();

      // Create a PDF
      final pdf = pw.Document();
      pdf.addPage(
        pw.Page(
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Image(
                pw.MemoryImage(imageBytes),
                fit: pw.BoxFit.contain,
              ),
            );
          },
        ),
      );

      // Save the PDF locally
  final directory = await getApplicationDocumentsDirectory();
  final file = File('${directory.path}/expense_pie_chart.pdf');
  await file.writeAsBytes(await pdf.save());

  // Share or open the file
  await Printing.sharePdf(
    bytes: await pdf.save(),
    filename: 'expense_pie_chart.pdf',
  );
    }

  @override
  Widget build(BuildContext context) {
    Rx<Widget> expensesWidget = RecentExpenseList(
      time: "month",
    ).obs;

    Rx<Widget> expensePieChart = ExpensePieChart(pieChartKey: pieChartKey,).obs;

    return Container(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          //pie chart
          // expensePieChart.value,

          Obx(() {
            return expensePieChart.value;
          }),

          //PDF download button
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: TextButton(
              onPressed: (){
                downloadPieChartAsPdf(expensePieChart.value);
              },
              child: const Text("PDF Download"),
            ),
          ),

          //heading
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: cardBackgroundColor,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Last Week
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "week",
                      );
                      expensePieChart.value = ExpensePieChart(
                        time: "week",
                        pieChartKey: pieChartKey,
                      );
                    },
                    child: const Text("Week")),

                //last Month
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "month",
                      );
                      expensePieChart.value = ExpensePieChart(
                        time: "month",
                        pieChartKey: pieChartKey,
                      );
                    },
                    child: const Text("Month")),

                //Year
                ElevatedButton(
                    onPressed: () {
                      expensesWidget.value = RecentExpenseList(
                        time: "year",
                      );
                      expensePieChart.value = ExpensePieChart(
                        pieChartKey: pieChartKey,
                        time: "year",
                      );
                    },
                    child: const Text("Year")),
              ],
            ),
          ),

          //expense list
          Expanded(
            child: Obx(() {
              return expensesWidget.value;
            }),
          ),
        ],
      ),
    );
  }
}
