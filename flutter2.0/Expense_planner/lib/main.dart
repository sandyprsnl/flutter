import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import './widgets/chart.dart';

import '../widgets/new_transaction.dart';
import '../widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //     [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(
      //   Platform.isIOS? CupertinoApp(
      //     title: 'Personal Expenses ',
      //   home: MyHomePage(),
      //   debugShowCheckedModeBanner: false,
      //   theme: CupertinoThemeData(
      //       barBackgroundColor: Colors.purple,
      //       primaryColor: Colors.amber,
      //       // errorColor: Colors.red,
      //       textTheme: CupertinoTextThemeData()
      //       .light().textTheme.copyWith(
      //             headline6: TextStyle(
      //                 fontFamily: 'OpenSans',
      //                 fontWeight: FontWeight.bold,
      //                 fontSize: 20),
      //             button: TextStyle(color: Colors.white),
      //           ),
      //       fontFamily: 'Quicksand',
      //       appBarTheme: AppBarTheme(
      //           textTheme: ThemeData.light().textTheme.copyWith(
      //               headline6: TextStyle(
      //                   fontFamily: 'OpenSans',
      //                   fontSize: 20,
      //                   fontWeight: FontWeight.bold)))),
      // )
      //   ) :
      MaterialApp(
    title: 'Personal Expenses ',
    home: MyHomePage(),
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        // errorColor: Colors.red,
        textTheme: ThemeData.light().textTheme.copyWith(
              headline6: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
              button: TextStyle(color: Colors.white),
            ),
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold)))),
  ));
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: 'New Shoes', amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 't2', title: 'New shirt', amount: 79.99, date: DateTime.now()),
  ];
  bool _showChart = false;
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(
      String txtitle, double txamount, DateTime choosenDate) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txtitle,
        amount: txamount,
        date: choosenDate);

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return GestureDetector(
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: NewTransaction(
            addtx: _addNewTransaction,
          ),
        );
      },
    );
  }

  void _deleteTransactions(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Show Chart',
            style: Theme.of(context).textTheme.headline1,
          ),
          Switch.adaptive(
            activeColor: Theme.of(context).accentColor,
            value: _showChart,
            onChanged: (value) {
              setState(() {
                _showChart = value;
              });
            },
          )
        ],
      ),
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(
                recentTransactions: _recentTransactions,
              ),
            )
          : txListWidget
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txListWidget) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                mediaQuery.padding.top) *
            0.3,
        child: Chart(
          recentTransactions: _recentTransactions,
        ),
      ),
      txListWidget
    ];
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final islandscape = mediaQuery.orientation == Orientation.landscape;

    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              children: <Widget>[
                CupertinoButton(
                  child: Icon(
                    CupertinoIcons.add,
                  ),
                  onPressed: () => _startNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text('Personal Expenses'),
            actions: <Widget>[
              IconButton(
                  onPressed: () => _startNewTransaction(context),
                  icon: Icon(
                    Icons.add,
                  ))
            ],
          );

    final txListWidget = Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) *
          0.7,
      child: TransactionsList(
          transaction: _userTransactions, deleteTx: _deleteTransactions),
    );
    final pagebody = SafeArea(
      child: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (islandscape)
                ..._buildLandscapeContent(mediaQuery, appBar, txListWidget),
              if (!islandscape)
                ..._buildPortraitContent(mediaQuery, appBar, txListWidget),
            ]),
      ),
    );
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: pagebody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: pagebody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _startNewTransaction(context),
                  ),
          );
  }
}
