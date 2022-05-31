import 'package:flutter/material.dart';
import 'package:random_numbers/models/number_list.dart';
import 'package:numberpicker/numberpicker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random number list',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<int> nums = [];
  int currentIntValue = 10000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paul\'s random number generator'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('How many random numbers do you want?'),
            const SizedBox(height: 10),
            _numberPicker(),
            const SizedBox(height: 10),
            _goButton(),
            const SizedBox(height: 40),
            _resultsBox(),
          ],
        ),
      ),
    );
  }

  _numberPicker() {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black38,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: NumberPicker(
        minValue: 0,
        maxValue: 20000,
        step: 100,
        itemCount: 3,
        value: currentIntValue,
        onChanged: (value) => setState(() => currentIntValue = value),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.black26),
        ),
      ),
    );
  }

  _goButton() {
    return ElevatedButton(
      child: const Text('Gimme random numbers!'),
      onPressed: () {
        setState(() {
          nums = NumberList.buildNumberList(limit: currentIntValue);
          nums.shuffle();
        });
      },
    );
  }

  _resultsBox() {
    return SizedBox(
      width: 140,
      height: 200,
      child: nums.isNotEmpty
          ? Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black38,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: ListView.separated(
                itemCount: nums.length,
                itemBuilder: (_, i) => _numberTile(nums[i]),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
              ),
            )
          : const Text('no results to show'),
    );
  }

  _numberTile(int i) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(i.toString()),
      ],
    );
  }
}
