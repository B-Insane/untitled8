import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ReportsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Realizar Informes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Ventas Semanales por Categoría',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Expanded(
              child: BarChart(
                BarChartData(
                  barGroups: getBarGroups(),
                  titlesData: FlTitlesData(
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                      interval: 50,
                    ),
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (value) => const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 14),
                      getTitles: (value) {
                        switch (value.toInt()) {
                          case 0:
                            return 'Lun';
                          case 1:
                            return 'Mar';
                          case 2:
                            return 'Mié';
                          case 3:
                            return 'Jue';
                          case 4:
                            return 'Vie';
                          case 5:
                            return 'Sáb';
                          case 6:
                            return 'Dom';
                          default:
                            return '';
                        }
                      },
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      tooltipBgColor: Colors.blueAccent,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        String weekDay;
                        switch (group.x.toInt()) {
                          case 0:
                            weekDay = 'Lun';
                            break;
                          case 1:
                            weekDay = 'Mar';
                            break;
                          case 2:
                            weekDay = 'Mié';
                            break;
                          case 3:
                            weekDay = 'Jue';
                            break;
                          case 4:
                            weekDay = 'Vie';
                            break;
                          case 5:
                            weekDay = 'Sáb';
                            break;
                          case 6:
                            weekDay = 'Dom';
                            break;
                          default:
                            weekDay = '';
                        }
                        return BarTooltipItem(
                          '$weekDay: ${rod.y.round()} ventas',
                          TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<BarChartGroupData> getBarGroups() {
    List<BarChartGroupData> barGroups = [];
    // Aquí puedes obtener tus datos de ventas semanales por categoría
    // Por ahora, vamos a simular datos de ventas aleatorios
    List<double> salesData = [100, 150, 200, 180, 250, 300, 270];
    for (int i = 0; i < salesData.length; i++) {
      barGroups.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              y: salesData[i],
              colors: [Colors.blueAccent], // Utiliza Colors para definir el color
            ),
          ],
        ),
      );
    }
    return barGroups;
  }
}







