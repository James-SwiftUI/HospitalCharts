import SwiftUI
import Charts

struct AandEAttendanceByYearandMonth: View {
    
    let isThumbalView: Bool
    let frameHeight: CGFloat
    
    @State private var year: String = "2020"
    let years: [String] = ["2020", "2021", "2022", "2023"]
    
    @State private var selectedMonthOnChart: Date?
    
    var selectedMonthTotal: AccidentAndEmergency?{
        guard let selectedMonthOnChart else { return nil }
        return SelectedYearArray().first{
            Calendar.current.isDate(selectedMonthOnChart, inSameDayAs: $0.date)
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
                        .padding(.bottom, 60)
                    }
                    
                    
                    Chart{
                        
                        if let selectedMonthTotal{
                            RuleMark(x: .value("Selected Month", selectedMonthTotal.date, unit: .day))
                                .foregroundStyle(Color.secondary.opacity(0.3))
                                .offset(y: -10)
                                .annotation(position: .top,
                                            spacing: 0,
                                            overflowResolution: .init(x: .fit(to: .chart), y: .disabled)){ annotationView }
                                .zIndex(100)
                        }
                        
                        ForEach(SelectedYearArray()){ visits in
                            Plot{
                                LineMark(x: .value("Month", visits.date, unit: .day), y: .value("Patients", visits.totalNumber))
                                    .symbol(.circle)
                                
                            }
                            .interpolationMethod(.catmullRom)
                            .lineStyle(StrokeStyle(lineWidth: 3))
                        }
                        
                    }
                    .padding(.horizontal, 8)
                    .chartXSelection(value: $selectedMonthOnChart)
                    .chartYScale(domain: .automatic(includesZero: false))
//                    .chartYAxis{
//                        AxisMarks(values: [250, 350, 450, 550]){
//                            AxisGridLine()
//                        }
//                    }
                    .aspectRatio(1, contentMode: .fit)
                    .frame(height: frameHeight)
                    .padding(.horizontal, 20)
                }header: {
                    if !isThumbalView{
                        Divider()
                        Text("Total Attendance By Year")
                            .fontWeight(.semibold)
                        Divider()
                    }
                }
            }
        }
        
       
        
    }
    
    var annotationView: some View{
        VStack(alignment: .leading){
            Text("\(selectedMonthTotal?.totalNumber ?? 0) Patients")
            HStack{
                Text(selectedMonthTotal?.date ?? .now, format: .dateTime.month())
                Text(selectedMonthTotal?.date ?? .now, format: .dateTime.year())
            }
        }
        .padding(12)
        .background(.ultraThickMaterial,in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        .foregroundStyle(.white.opacity(0.8))
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
