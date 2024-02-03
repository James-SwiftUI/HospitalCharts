import SwiftUI
import Charts

struct DonutChartView: View {
   
    
    @State private var selectedNumberOfPatients: Int?
    // We found the value above no find the department below
    @State private var selectedDepartment: PatientsSeen?
    
    @State private var graphType: GraphType = .pie
    let allPatientsSeen: [PatientsSeen] = [
        .init(total: 325, department: .opthalmology),
        .init(total: 255, department: .cardiology),
        .init(total: 121, department: .gastroerolgy),
        .init(total: 89, department: .neurology),
        
        .init(total: 73, department: .surgery)
    ]
   
    
    var body: some View {
            
        NavigationStack {
            Chart{
                ForEach(allPatientsSeen.sorted(by: {  $0.total > $1.total })){ item in
                    
                    SectorMark(angle: .value("All patients seen", item.total), 
                               innerRadius: .ratio(0.6),
                               outerRadius: selectedDepartment?.department.rawValue == item.department.rawValue ? 175 : 150,
                               angularInset: 1
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
                        getSelectedDepartment(value: newValue)
                        print(selectedDepartment?.department.rawValue)
                    }
                }
            }
            .frame(height: 350)
            .padding(.top, 30)
            .chartBackground{ _ in
                VStack{
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
            Spacer()
            .navigationTitle("Donut Chart")
        }
        Spacer()
       
    }
    private func getSelectedDepartment(value: Int){
        var culmulativeTotal = 0
        let department = allPatientsSeen.first { department in
            culmulativeTotal += Int(department.total)
            if value <= culmulativeTotal{
                selectedDepartment = department
                return true
            }
            return false
        }
    }
}

#Preview {
    DonutChartView()
}


