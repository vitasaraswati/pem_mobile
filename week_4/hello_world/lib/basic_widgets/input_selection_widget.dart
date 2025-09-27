import 'package:flutter/material.dart';

class InputSelectionWidget extends StatefulWidget {
  const InputSelectionWidget({Key? key}) : super(key: key);

  @override
  State<InputSelectionWidget> createState() => _InputSelectionWidgetState();
}

class _InputSelectionWidgetState extends State<InputSelectionWidget> {
  // Controllers dan state variables
  TextEditingController namaController = TextEditingController();
  bool isChecked = false;
  bool isSwitched = false;
  double sliderValue = 20.0;
  String? selectedGender;
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input dan Selection Widget"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TextField
            const Text(
              "1. TextField",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: namaController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nama Lengkap',
                hintText: 'Masukkan nama lengkap Anda',
                prefixIcon: Icon(Icons.person),
              ),
            ),
            const SizedBox(height: 20),

            // Checkbox
            const Text(
              "2. Checkbox",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: const Text("Saya setuju dengan syarat dan ketentuan"),
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            const SizedBox(height: 20),

            // Radio Button
            const Text(
              "3. Radio Button",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                RadioListTile<String>(
                  title: const Text("Laki-laki"),
                  value: "Laki-laki",
                  groupValue: selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
                RadioListTile<String>(
                  title: const Text("Perempuan"),
                  value: "Perempuan",
                  groupValue: selectedGender,
                  onChanged: (String? value) {
                    setState(() {
                      selectedGender = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Switch
            const Text(
              "4. Switch",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SwitchListTile(
              title: const Text("Terima notifikasi"),
              value: isSwitched,
              onChanged: (bool value) {
                setState(() {
                  isSwitched = value;
                });
              },
            ),
            const SizedBox(height: 20),

            // Slider
            const Text(
              "5. Slider",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text("Umur:"),
            Slider(
              value: sliderValue,
              max: 100,
              min: 0,
              divisions: 100,
              label: sliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  sliderValue = value;
                });
              },
            ),
            Text("Umur: ${sliderValue.round()} tahun"),
            const SizedBox(height: 20),

            // Date Picker
            const Text(
              "6. Date Picker",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text("Tanggal Lahir: "),
                Text(
                  "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () async {
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (picked != null && picked != selectedDate) {
                      setState(() {
                        selectedDate = picked;
                      });
                    }
                  },
                  child: const Text("Pilih Tanggal"),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  // Tampilkan hasil input
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Data yang dimasukkan:"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nama: ${namaController.text}"),
                            Text("Setuju T&C: ${isChecked ? 'Ya' : 'Tidak'}"),
                            Text(
                              "Gender: ${selectedGender ?? 'Belum dipilih'}",
                            ),
                            Text(
                              "Notifikasi: ${isSwitched ? 'Aktif' : 'Nonaktif'}",
                            ),
                            Text("Umur: ${sliderValue.round()} tahun"),
                            Text(
                              "Tanggal Lahir: ${selectedDate.day}/${selectedDate.month}/${selectedDate.year}",
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Submit Data",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
  }
}