import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/core/presentation/widgets/app_bar.dart';
import 'package:new_project/core/presentation/widgets/text_field.dart';

class SelectCountryScreen extends StatefulWidget {
  const SelectCountryScreen({super.key});

  @override
  State<SelectCountryScreen> createState() => _SelectCountryScreenState();
}

class _SelectCountryScreenState extends State<SelectCountryScreen> {
  List<dynamic> countries = [];
  List<dynamic> filteredCountries = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    String data = await rootBundle.loadString('assets/json/country.json'); // your JSON file
    countries = json.decode(data);
    filteredCountries = countries;
    setState(() {});
  }

  void filterCountries(String query) {
    if (query.isEmpty) {
      filteredCountries = countries;
    } else {
      filteredCountries = countries.where((country) {
        return country['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            CustomTextField(
              controller: searchController,
              prefix: Icon(Icons.search),
              onchanged: filterCountries,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredCountries.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredCountries[index]['name']),
                    onTap: () {
                      Navigator.pop(context, filteredCountries[index]['name']);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
