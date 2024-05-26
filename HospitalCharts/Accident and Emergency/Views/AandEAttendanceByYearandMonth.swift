import SwiftUI
import Charts

struct AandEAttendanceByYearandMonth: View {
    
    let isThumbalView: Bool
    let frameHeight: CGFloat
    
    @State private var year: String = "2020"
    let years: [String] = ["2020", "2021", "2022", "2023"]
    
    @State private var selectedMonthOnChart: String?
    
    var selectedMonthTotal: AccidentAndEmergency?{
        guard let selectedMonthOnChart else { return nil }
        
        return SelectedYearArray().first{
            $0.month == selectedMonthOnChart
        }
        
    }
    
    var body: some View {
        NavigationStack{
            ScrollView{
                Section{
                    
                    if !isThumbalView{
                        Picker("", selection: $year){
                            
                            ForEach(years, id: \.self){ year in
                                Text(year)
                                    .tag(year)
                            }
                        }
                        .pickerStyle(.palette)
                    }
                    
                    
                    Chart{
                        
                        if let selectedMonthTotal{
                            RuleMark(x: .value("Selected Month", selectedMonthTotal.month))
                                .foregroundStyle(Color.secondary.opacity(0.3))
                                .offset(y: -10)
                        }
                        
                        ForEach(SelectedYearArray()){ visits in
                            Plot{
                                LineMark(x: .value("Month", visits.month), y: .value("Patients", visits.totalNumber))
                                    .symbol(.circle)
                                
                            }
                            .interpolationMethod(.catmullRom)
                            .lineStyle(StrokeStyle(lineWidth: 3))
                        }
                        
                        
                        
                        
                    }
                    .chartXSelection(value: $selectedMonthOnChart)
                    .chartYScale(domain: .automatic(includesZero: false))
                    .chartYAxis{
                        AxisMarks(values: [250, 350, 450, 550]){
                            AxisGridLine()
                        }
                    }
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: frameHeight)
                }header: {
                    if !isThumbalView{
                        Divider()
                        Text("Total Attendance By Year")
                            .fontWeight(.semibold)
                        Divider()
                    }
                    
                    VStack{
                        if let selectedMonthTotal{
                           
                                VStack(alignment: .leading){
                                    Text("\(selectedMonthOnChart ?? "")")
                                    Text(selectedMonthTotal.year)
                                    Text(selectedMonthTotal.id)
                                    Text("\(selectedMonthTotal.totalNumber)")
                                }
                                
                        }
                    }
                    
                    
                    
                }
            }
        }
        
    }
    
    
    func SelectedYearArray() -> [AccidentAndEmergency]{
        switch year{
        case "2020":
            return MockData.AandE2020
        case "2021":
            return MockData.AandE2021
            
        case "2022":
            return MockData.AandE2022
            
        case "2023":
            return MockData.AandE2023
        default:
            return []
        }
        
    }
}

#Preview {
    AandEAttendanceByYearandMonth(isThumbalView: false, frameHeight: 400.0)
}
