import 'package:flutter/material.dart';
import 'package:informacion_animal/pagina_principal.dart';

class GestionErrores extends StatelessWidget {
  const GestionErrores({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestión de Errores'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  // nos ayuda a navegar a otra pantalla, en este caso a la pantalla de GestionErrores
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DashboardScreen()),
                );
              },
              child: const Text(
                'Inicio',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Secession Reporte de Errores
              _buildErrorReportSection(),
              const SizedBox(height: 16),
              // Sección Copia de Seguridad Local
              _buildLocalBackupSection(),
              const SizedBox(height: 16),
              // Sección Copia de Seguridad en la Nube
              _buildCloudBackupSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Reporte de errores
  Widget _buildErrorReportSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Reporte de errores',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(),
              children: const [
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Error Code'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Date'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('ID de Usuario Afectado'),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('001'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('2021-10-01'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Usuario A'),
                  ),
                ]),
                TableRow(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('002'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('2021-10-02'),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Usuario B'),
                  ),
                ]),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Descargar Reporte Errores'),
            ),
          ],
        ),
      ),
    );
  }

  // Copia de Seguridad Local
  Widget _buildLocalBackupSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Copia de Seguridad local',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Generar copia de seguridad local'),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text('Seleccionar Intervalo'),
              items:
                  <String>['Diario', 'Semanal', 'Mensual'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ubicación local de la Copia de seguridad',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  // Copia de Seguridad en la Nube
  Widget _buildCloudBackupSection() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Copia de Seguridad en la nube',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Generar copia de seguridad en la nube'),
            ),
            const SizedBox(height: 8),
            DropdownButton<String>(
              hint: const Text('Seleccionar Intervalo'),
              items:
                  <String>['Diario', 'Semanal', 'Mensual'].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) {},
            ),
            const SizedBox(height: 8),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Ubicación en la nube',
              ),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }
}
