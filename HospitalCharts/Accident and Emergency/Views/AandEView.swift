import SwiftUI
import Charts

struct AandEView: View {
    @State private var year: String = ""
    @State var totalAandE: [AccidentAndEmergency] = populateAandEVisits()
    let years: [String] = ["2020", "2021", "2022", "2023"]
    var body: some View {
        NavigationStack{
            ScrollView{
                Section{
                    Picker("", selection: $year){
                        
                        ForEach(years, id: \.self){ year in
                            Text(year)
                                .tag(year)
                        }
                    }
                    .pickerStyle(.palette)
                    .onChange(of: year){
                        totalAandE = AandEView.populateAandEVisits()
                    }
                    Chart(totalAandE){ visits in
                        Plot{
                            LineMark(x: .value("Month", visits.month), y: .value("Patients", visits.totalNumber))
                            
                            PointMark(x: .value("Month", visits.month), y: .value("Patients", visits.totalNumber))
                            
                        }
                        
                        .lineStyle(StrokeStyle(lineWidth: 3))
                        
                        
                    }
                    .chartYAxis{
                        AxisMarks(values: [200, 300, 400, 500, 600]){
                            AxisGridLine()
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: 400)
                }header: {
                    Text("Total Attendance By year")
                        .fontWeight(.semibold)
                }
                
                Section{
                    AttendanceBarChartView()
                    
                    
                }header: {
                    Text("Attendance Type")
                        .fontWeight(.semibold)
                }
                
                
                
            }
        }
        
    }
    
    
    static func populateAandEVisits() -> [AccidentAndEmergency]{
        
        var total: [AccidentAndEmergency] = []
        
        for month in months {
            let randomPatients = Int.random(in: 300...500)
            total.append(AccidentAndEmergency(totalNumber: randomPatients, month: month))
        }
        
        return total
        
        
    }
}

#Preview {
    AandEView()
}
