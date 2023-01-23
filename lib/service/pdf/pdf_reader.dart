import 'dart:developer';
import 'dart:html' as html;
import 'dart:typed_data';
import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:legalaid/service/formservice/form_service.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';

import '../../component/form/data/form_answers.dart';

class LegalAidPdfReader {
  Future<void> readPdfForApplicant(List<FormAnswers> answers) async {
    PdfDocument document = PdfDocument();
    final PdfPage page = document.pages.add();
// Create a PDF grid class to add tables.
    final PdfGrid grid = PdfGrid();
// Specify the grid column count.
    grid.columns.add(count: 2);
// Add a grid header row.
    final PdfGridRow headerRow = grid.headers.add(1)[0];
    headerRow.cells[0].value = 'Question';
    headerRow.cells[1].value = 'Answer';
// Set header font.
    headerRow.style.font =
        PdfStandardFont(PdfFontFamily.helvetica, 10, style: PdfFontStyle.bold);
// Add rows to the grid.
    PdfGridRow row = grid.rows.add();
    var mapFromList = groupBy(answers,(FormAnswers obj) => obj.pdfId);
    mapFromList.forEach((key, value) {
      var valueString = value.map((e) => e.answer).join("");
      if(valueString.isNotEmpty){
        var keyForPdf = key;
        FormService.questionTitleMap.forEach((keyFromService, valueFromService) {
            if(keyFromService.toLowerCase() == key.toLowerCase()){
              keyForPdf = valueFromService;
            }
        });
        row.cells[0].value = keyForPdf;
        row.cells[1].value = value.map((e) => e.answer).join("");
        row = grid.rows.add();
      }

    });
// Set grid format.
    grid.style.cellPadding = PdfPaddings(left: 5, top: 5);
// Draw table in the PDF page.
    grid.draw(
        page: page,
        bounds: Rect.fromLTWH(
            0, 0, page.getClientSize().width, page.getClientSize().height));
    Uint8List uploadfile = Uint8List.fromList(document.saveSync());
    final blob = html.Blob([uploadfile]);
    log("blob is $blob");
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.document.createElement('a') as html.AnchorElement
      ..href = url
      ..style.display = 'none'
      ..download = 'answers.pdf';
    html.document.body?.children.add(anchor);
    anchor.click();
  }
}
