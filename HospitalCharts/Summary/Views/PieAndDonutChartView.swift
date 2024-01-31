import SwiftUI
import Charts

struct PieAndDonutChartView: View {
    
    @State private var graphType: GraphType = .pie
    let allPatientsSeen: [PatientsSeen] = [
        .init(total: 255, department: .cardiology),
        .init(total: 121, department: .gastroerolgy),
        .init(total: 89, department: .neurology),
        .init(total: 325, department: .opthalmology),
        .init(total: 73, department: .surgery)
    ]
   
    
    var body: some View {
            
        Chart{
            ForEach(allPatientsSeen.sorted(by: {  $0.total > $1.total })){ item in
                
                SectorMark(angle: .value("All patients seen", item.total), innerRadius: .ratio(graphType == .donut ? 0.6 : 0),
                               angularInset: graphType == .donut ? 4 : 1)
                    .cornerRadius(8)
                    .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                
                
            }
        }
    }
}

#Preview {
    PieAndDonutChartView()
}


