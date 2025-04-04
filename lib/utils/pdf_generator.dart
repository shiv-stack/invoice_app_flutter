import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PdfGenerator {
  static Future<String> createInvoice(List<Map<String, String>> items) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Invoice', style: pw.TextStyle(fontSize: 40)),
              pw.SizedBox(height: 20),
              pw.Table.fromTextArray(
                headers: ['Item', 'Price'],
                data:
                    items.map((item) => [item["item"], item["price"]]).toList(),
              ),
            ],
          );
        },
      ),
    );

    final directory = await getExternalStorageDirectory();
    final path =
        '${directory!.path}/invoice_${DateTime.now().millisecondsSinceEpoch}.pdf';
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    return file.path;
  }
}
