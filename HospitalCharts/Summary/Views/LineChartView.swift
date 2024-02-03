import SwiftUI
import Charts

struct LineChartView: View {
    var body: some View {
        Chart{
            Plot{
                LineMark(x: .value("Month", 1),
                         y: .value("Patients", 147))
                LineMark(x: .value("Month", 2),
                         y: .value("Patients", 424))
                LineMark(x: .value("Month", 3),
                         y: .value("Patients", 461))
                LineMark(x: .value("Month", 4),
                         y: .value("Patients", 348))
                LineMark(x: .value("Month", 5),
                         y: .value("Patients", 268))
                LineMark(x: .value("Month", 6),
                         y: .value("Patients", 626))
                LineMark(x: .value("Month", 7),
                         y: .value("Patients", 484))
                LineMark(x: .value("Month", 8),
                         y: .value("Patients", 472))
                LineMark(x: .value("Month", 9),
                         y: .value("Patients", 309))
                LineMark(x: .value("Month", 10),
                         y: .value("Patients", 447))
                LineMark(x: .value("Patients",11),
                         y: .value("Patients", 412))
                LineMark(x: .value("Month", 12),
                         y: .value("Patients", 325))
            }
            
            .lineStyle(StrokeStyle(lineWidth: 3))
            
        }
        .aspectRatio(1, contentMode: .fit)
    }
}

#Preview {
    LineChartView()
}
