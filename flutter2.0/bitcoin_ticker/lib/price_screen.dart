import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './coin_data.dart';
import './networking/network.dart';
import './coin_card.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  State<PriceScreen> createState() => _PriceSCreenState();
}

class _PriceSCreenState extends State<PriceScreen> {
  String selectedCountry = "USD";
  Map<String, String> coindata = {};
  bool isWaiting = false;

  DropdownButton<String> getAndroidDropDown() {
    List<DropdownMenuItem<String>> currencydropdownItems = [];
    for (String currency in coinList) {
      var newitem = DropdownMenuItem(value: currency, child: Text(currency));
      currencydropdownItems.add(newitem);
    }

    return DropdownButton<String>(
      value: selectedCountry,
      items: currencydropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCountry = value!;
          setdata(cryptoname: value);
        });
      },
    );
  }

  CupertinoPicker getIosDropDown() {
    List<Widget> currencydropdownItem = [];
    for (String currency in coinList) {
      var newitem = Text(currency);
      currencydropdownItem.add(newitem);
    }
    return CupertinoPicker(
        itemExtent: 32.0,
        onSelectedItemChanged: (itemIndex) {
          selectedCountry = cryptoList[itemIndex];
        },
        children: currencydropdownItem);
  }

  @override
  void initState() {
    super.initState();
    setdata(cryptoname: selectedCountry);
  }

  void setdata({required String cryptoname}) async {
    isWaiting = true;
    try {
      var network = Network(countryname: selectedCountry);
      var getcoindata = await network.getData();
      isWaiting = false;
      setState(() {
        coindata = getcoindata;
      });
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BitCoin Ticker'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                CoinCard(
                  countryName: selectedCountry,
                  currencyName: ' BTC',
                  currencyvalue: isWaiting ? '?' : coindata['BTC'].toString(),
                ),
                CoinCard(
                  countryName: selectedCountry,
                  currencyName: ' ETH',
                  currencyvalue: isWaiting ? '?' : coindata['ETH'].toString(),
                ),
                CoinCard(
                  countryName: selectedCountry,
                  currencyName: ' LTC',
                  currencyvalue: isWaiting ? '?' : coindata['LTC'].toString(),
                ),
              ],
            ),
            Container(
              height: 150.0,
              width: double.infinity,
              color: Colors.lightBlueAccent,
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Platform.isIOS ? getIosDropDown() : getAndroidDropDown(),
            )
          ],
        ),
      ),
    );
  }
}
