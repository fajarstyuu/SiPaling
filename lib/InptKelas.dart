import 'package:flutter/material.dart';

class Inptkelas extends StatefulWidget {
  const Inptkelas({super.key});

  @override
  State<Inptkelas> createState() => _InptkelasState();
}

class _InptkelasState extends State<Inptkelas> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: height * 0.5,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 45, 136),
              ),
              child: Container(
                padding: const EdgeInsets.only(
                  left: 120,
                  right: 120,
                  top: 120,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rencana Akademik",
                        style: TextStyle(
                          fontSize: 52,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.only(
                          left: 35,
                          right: 35,
                        ),
                        child: Center(
                          child: DropdownButton(
                            value: selectedValue,
                            hint: const Text("Pilih program Studi"),
                            items: const [
                              DropdownMenuItem(
                                value: "S1 Informatika",
                                child: Text("S1 Informatika"),
                              ),
                              DropdownMenuItem(
                                value: "S1 Kimia",
                                child: Text("S1 Kimia"),
                              ),
                              DropdownMenuItem(
                                value: "S1 Matematika",
                                child: Text("S1 Matematika"),
                              ),
                            ],
                            onChanged: (newValue) {
                              setState(() {
                                selectedValue = newValue;
                              });
                            },
                            // Mengatur warna teks dalam DropdownButton
                            style: const TextStyle(
                                color: Colors.black, fontSize: 16),
                            // Mengatur warna latar belakang dropdown
                            dropdownColor: Colors.white,
                            // Mengatur warna ikon
                            iconEnabledColor: Colors.black,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              //container 2
              width: width,
              margin: const EdgeInsets.only(
                bottom: 40,
                left: 120,
                right: 120,
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RencanaAkademik(
                    title: "Semester Ganjil - 2024",
                    child: CoursePanel(
                      title: "Auga",
                      child: ProyekTable(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RencanaAkademik extends StatefulWidget {
  final String title;
  final Widget child;

  const RencanaAkademik({
    required this.title,
    required this.child,
    super.key,
  });

  @override
  State<RencanaAkademik> createState() => _RencanaAkademikState();
}

class _RencanaAkademikState extends State<RencanaAkademik> {
  bool isExpanded = false; // Status ekspansi untuk panel ini

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (panelIndex, isExpanded) {
        setState(() {
          this.isExpanded = isExpanded; // Mengubah status ekspansi
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          },
          body: widget.child,
          isExpanded: isExpanded, // Mengaitkan status ekspansi
        )
      ],
    );
  }
}

class CoursePanel extends StatefulWidget {
  final String title;
  final Widget child;

  const CoursePanel({required this.title, required this.child, super.key});

  @override
  CoursePanelState createState() => CoursePanelState();
}

class CoursePanelState extends State<CoursePanel> {
  bool isExpanded = false; // Status ekspansi untuk panel ini

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 1,
      expandedHeaderPadding: EdgeInsets.zero,
      expansionCallback: (index, expanded) {
        setState(() {
          isExpanded = expanded; // Mengubah status ekspansi
        });
      },
      children: [
        ExpansionPanel(
          headerBuilder: (context, isExpanded) {
            return ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            );
          },
          body: widget.child,
          isExpanded: isExpanded, // Mengaitkan status ekspansi
        ),
      ],
    );
  }
}

class ProyekTable extends StatelessWidget {
  const ProyekTable({super.key});
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(color: Colors.grey),
      columnWidths: const <int, TableColumnWidth>{
        0: FixedColumnWidth(50.0),
        1: FlexColumnWidth(),
        2: FixedColumnWidth(100.0),
        3: FixedColumnWidth(100.0),
      },
      children: [
        TableRow(
          decoration: BoxDecoration(color: Colors.grey.shade200),
          children: [
            _buildTableHeader("Kelas"),
            _buildTableHeader("Jadwal"),
            _buildTableHeader("Kuota"),
            _buildTableHeader("Ruang"),
          ],
        ),
        _buildTableRow("A", "Senin, 07.00 - 09.30", "50", "E101"),
        _buildTableRow("B", "Senin, 09.40 - 12.10", "50", "E101"),
        _buildTableRow("C", "Selasa, 09.40 - 12.10", "50", "E101"),
        _buildTableRow(
            "D", "Selasa, 13.00 - 15.30", "Masukkan Kuota Kelas", "Pilih Ruang",
            isEditable: true),
      ],
    );
  }

  TableRow _buildTableRow(
      String kelas, String jadwal, String kuota, String ruang,
      {bool isEditable = false}) {
    return TableRow(
      children: [
        _buildTableCell(kelas),
        _buildTableCell(jadwal),
        isEditable
            ? TextField(
                decoration: InputDecoration(
                  hintText: kuota,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
              )
            : _buildTableCell(kuota),
        isEditable
            ? DropdownButton<String>(
                isExpanded: true,
                items: ["E101", "E102", "E103"]
                    .map((room) => DropdownMenuItem(
                          value: room,
                          child: Text(room),
                        ))
                    .toList(),
                onChanged: (value) {
                  // Logic untuk pilih ruang
                },
                hint: Text(ruang),
              )
            : _buildTableCell(ruang),
      ],
    );
  }

  Widget _buildTableHeader(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildTableCell(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(text),
    );
  }
}
