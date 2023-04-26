// import 'dart:io';

// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pw;

// class PDFUtil {
//   static create(String path, String content) async {
//     final pdf = pw.Document();

//     pdf.addPage(pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         build: (pw.Context context) {
//           return pw.Center(
//             child: pw.Text(content),
//           ); // Center
//         })); //

//     // On Flutter, use the [path_provider](https://pub.dev/packages/path_provider) library:
// //   final output = await getTemporaryDirectory();
// //   final file = File("${output.path}/example.pdf");
//     final file = File(path);
//     await file.writeAsBytes(pdf.save());
//   }
// }
