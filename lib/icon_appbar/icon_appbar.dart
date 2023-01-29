import 'package:app_provider/models/transacton_models.dart';
import 'package:app_provider/providers/transsaction.dart';
import 'package:app_provider/screen/form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class iconAppbar extends StatefulWidget {
  const iconAppbar({super.key});

  @override
  State<iconAppbar> createState() => _iconAppbarState();
}

class _iconAppbarState extends State<iconAppbar> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) {
          return transactionProvider();
        })
      ],
      child: MaterialApp(
        title: 'flutter_provider',
        debugShowCheckedModeBanner: false,
        home: MyHomePage(
          title: 'ແອບບັນຊີ',
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return formScreen();
                  },
                ),
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Consumer(builder: (context, transactionProvider provider, Widget) {
        var count = provider.Transactions.length;
        if (count <= 0) {
          return Center(
            child: Text(
              "ບໍ່ມີຂໍ້ມູນ",
              style: TextStyle(fontSize: 30),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: count,
            itemBuilder: (context, int index) {
              transactionModels data = provider.Transactions[index];
              return Card(
                //margin: EdgeInsets.all(8.0),
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                elevation: 3,
                child: ListTile(
                  leading: CircleAvatar(
                      radius: 20,
                      child: FittedBox(
                        child: Text(
                          NumberFormat.simpleCurrency(
                                  locale: 'en-US', decimalDigits: 0)
                              .format(data.amount.toDouble()),
                        ),
                      )),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.menu),
                  ),
                  title: Text(data.title),
                  subtitle: Text(
                    DateFormat("dd/mm/yyyy").format(data.date),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
