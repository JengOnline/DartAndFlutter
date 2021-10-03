import 'package:daily_expenses/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // ignore: deprecated_member_use
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: const AppBarTheme(
          titleTextStyle: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 18),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: const TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            button: const TextStyle(color: Colors.white)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 1,
      ),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Froceries',
      amount: 16.53,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 2,
      ),
    ),
    Transaction(
      id: 't3',
      title: 'Food',
      amount: 20,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 3,
      ),
    ),
    Transaction(
      id: 't4',
      title: 'Taxi',
      amount: 10,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 4,
      ),
    ),
    Transaction(
      id: 't5',
      title: 'Party',
      amount: 30,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 5,
      ),
    ),
    Transaction(
      id: 't6',
      title: 'Movie',
      amount: 15,
      date: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day - 6,
      ),
    )
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          const Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime selectedDate) {
    final newTx = Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: DateTime.now().toString());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Personal Expenses',
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
          ]),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
