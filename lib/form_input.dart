import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  String result = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? nama, religion, education, gender;
  bool? isChecked = false;
  List<String> religionOptions = [
    "Kristen",
    "Katolik",
    "Buddha",
    "Islam",
    "Kong Hu Cu",
    "Atheist"
  ];
  List<String> educationOptions = ["SD", "SMP", "SMA", "S1", "S2", "S3"];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        result = "Nama: $nama\n Agama: $religion\n Pendidikan: $education";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Aplikasi Form Input')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(labelText: "Nama"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    nama = newValue;
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "Agama"),
                  value: religion,
                  items: religionOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      religion = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "Pendidikan"),
                  value: education,
                  items: educationOptions.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      education = newValue;
                    });
                  },
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                    onPressed: _submitForm, child: const Text("Submit")),
                Text(
                  result,
                  style: const TextStyle(fontSize: 16),
                )
              ],
            ),
          ),
        ));
  }
}
