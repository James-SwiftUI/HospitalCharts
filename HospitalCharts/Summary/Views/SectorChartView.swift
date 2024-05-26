import SwiftUI
import Charts

struct SectorChartView: View {
   
    
    @State private var selectedNumberOfPatients: Int?
    // We found the value above no find the department below
    @State private var selectedDepartment: PatientsSeen?
    
    @Binding var graphType: GraphType
    
    
  
    
   
    
    var body: some View {
            
        NavigationStack {
            Chart{
                ForEach(MockData.allPatientsSeen.sorted(by: {  $0.total > $1.total })){ item in
                    SectorMark(angle: .value("All patients seen", item.total),
                               innerRadius: .ratio(graphType == .donut ? 0.6 : 0),
                               outerRadius: selectedDepartment?.department.rawValue == item.department.rawValue ? 175 : 150,
                               angularInset: graphType == .donut ? 4 : 1
                              )
                              .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                              .cornerRadius(8)
                    
                }
            }
            .chartAngleSelection(value: $selectedNumberOfPatients)
            .onChange(of: selectedNumberOfPatients) { oldValue, newValue in
                if let newValue{
                    // Culmative total
                    
                    print(newValue)
                    withAnimation {
                        //getSelectedDepartment(value: newValue)
                        //print(selectedDepartment?.department.rawValue)
                    }
                }
            }
            .frame(height: 350)
            .padding(.top, 30)
            .chartBackground{ _ in
                VStack{
                    if graphType == .donut{
                        Image(systemName: "cross.case.fill")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        if let selectedSegment = selectedDepartment{
                            VStack{
                                Text(selectedSegment.department.rawValue)
                                Text("\(Int(selectedSegment.total)) patients")
                            }
                            .font(.system(.headline, design: .rounded))
                            .foregroundStyle(.secondary)
                        }
                    }
                }
            }
            Spacer()
        }
        Spacer()
    }
}

#Preview {
    SectorChartView(graphType: .constant(.donut))
}


