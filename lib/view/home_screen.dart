import 'package:flutter/material.dart';
import 'package:sqlite_crud/services/database_helper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('S Q L i t e   C R U D'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // create
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance
                  .insert({DatabaseHelper.columnName: 'Name1'});
            },
            child: const Text('INSERT'),
          ),

          const SizedBox(
            height: 10,
          ),

          // read
          ElevatedButton(
            onPressed: () async {
              var dbQuery = await DatabaseHelper.instance.queryDatabase();
              // ignore: avoid_print
              print(dbQuery);
            },
            child: const Text('READ'),
          ),

          const SizedBox(
            height: 10,
          ),

          // update
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance.update({
                DatabaseHelper.columnID: 2,
                DatabaseHelper.columnName: 'Name2'
              });
            },
            child: const Text('UPDATE'),
          ),

          const SizedBox(
            height: 10,
          ),

          // delete
          ElevatedButton(
            onPressed: () async {
              await DatabaseHelper.instance.deleteRecord(2);
            },
            child: const Text('DELETE'),
          ),
        ],
      )),
    );
  }
}
