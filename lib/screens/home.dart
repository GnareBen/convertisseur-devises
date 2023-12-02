import 'package:convertisseur/repositories/fetchrates.dart';
import 'package:convertisseur/widgets/dropdownbutton.dart';
import 'package:convertisseur/widgets/textformfield.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  RateRepository rateRepository = RateRepository();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _fromAmount = TextEditingController();
  final TextEditingController _toAmount = TextEditingController();

  final TextEditingController _fromCurrency = TextEditingController();
  final TextEditingController _toCurrency = TextEditingController();

  @override
  void initState() {
    _formKey = GlobalKey<FormState>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 32.0, left: 16.0, right: 16.0),

      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 240.0,
                  child: MyTextFormField(
                    controller: _fromAmount,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: MyDropdownButton(
                    label: 'from',
                    controller: _fromCurrency,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32.0),
            Row(
              children: [
                SizedBox(
                  width: 240.0,
                  child: MyTextFormField(
                    controller: _toAmount,
                  ),
                ),
                const SizedBox(width: 8.0),
                Expanded(
                  child: MyDropdownButton(
                    label: 'to',
                    controller: _toCurrency,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                  side: const BorderSide(color: Colors.transparent),
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    rateRepository
                        .fetchRates(_fromCurrency.text, _toCurrency.text,
                            double.parse(_fromAmount.text))
                        .then((value) {
                      setState(() {
                        _toAmount.text = value.toString();
                      });
                    });
                  }
                },
                child: const Text('Convertir'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
