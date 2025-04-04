import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/pdf_generator.dart';

abstract class InvoiceEvent {}

class GenerateInvoice extends InvoiceEvent {
  final List<Map<String, String>> items;
  GenerateInvoice(this.items);
}

abstract class InvoiceState {}

class InvoiceInitial extends InvoiceState {}

class InvoiceGenerated extends InvoiceState {
  final String filePath;
  InvoiceGenerated(this.filePath);
}

class InvoiceBloc extends Bloc<InvoiceEvent, InvoiceState> {
  InvoiceBloc() : super(InvoiceInitial()) {
    on<GenerateInvoice>((event, emit) async {
      final pdfPath = await PdfGenerator.createInvoice(event.items);
      emit(InvoiceGenerated(pdfPath));
    });
  }
}
