import 'package:app_provider/models/transacton_models.dart';
import 'package:app_provider/providers/transsaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class formScreen extends StatefulWidget {
  const formScreen({super.key});

  @override
  State<formScreen> createState() => _formScreenState();
}

class _formScreenState extends State<formScreen> {
  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ບັນຊີເງິນຝາກ"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  controller: titleController,
                  autofocus: true,
                  decoration: new InputDecoration(labelText: "ຊື່ລາຍການ"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter The Value";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: amountController,
                  decoration: new InputDecoration(labelText: "ຈໍານວເງິນ"),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter The valuse";
                    }
                    return null;
                  },
                ),
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var title = titleController.text;
                      var amout = amountController.text;

                      transactionModels statment = transactionModels(
                          title: title,
                          amount: double.parse(amout),
                          date: DateTime.now());

                      var provider = Provider.of<transactionProvider>(context,
                          listen: false);
                      provider.addTransaction(statment);
                      Navigator.pop(context);
                    }
                  },
                  child: Text(
                    "ເພີ່ມຂໍ້ມູນ",
                  ),
                )
              ],
            )),
      ),
    );
  }
}
