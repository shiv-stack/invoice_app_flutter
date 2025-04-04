import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:open_file/open_file.dart';
import '../blocs/invoice_bloc.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  final List<Map<String, String>> items = [];
  final TextEditingController itemController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  void _addItem() {
    if (itemController.text.isNotEmpty && priceController.text.isNotEmpty) {
      setState(() {
        items.add({
          "item": itemController.text,
          "price": priceController.text,
        });
      });
      itemController.clear();
      priceController.clear();
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Invoice Generator')),
      body: BlocConsumer<InvoiceBloc, InvoiceState>(
        listener: (context, state) async {
          if (state is InvoiceGenerated) {
            _showSnackBar('Invoice saved at ${state.filePath}');
            await OpenFile.open(state.filePath);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(items[index]["item"]!),
                    subtitle: Text("Price: \$${items[index]["price"]}"),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: itemController,
                        decoration:
                            const InputDecoration(hintText: 'Item Name'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: priceController,
                        decoration: const InputDecoration(hintText: 'Price'),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _addItem,
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  final status = await Permission.storage.request();
                  if (status.isGranted) {
                    BlocProvider.of<InvoiceBloc>(context)
                        .add(GenerateInvoice(items));
                  } else {
                    _showSnackBar('Storage permission denied');
                  }
                },
                child: const Text('Generate Invoice'),
              ),
            ],
          );
        },
      ),
    );
  }
}
