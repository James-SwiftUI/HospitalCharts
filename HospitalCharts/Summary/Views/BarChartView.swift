import SwiftUI
import Charts

struct BarChartView: View {
    
    @State private var barSelection: String?
    
    let allPatientsSeen: [PatientsSeen] = [
        .init(total: 255, department: .cardiology),
        .init(total: 121, department: .gastroerolgy),
        .init(total: 89, department: .neurology),
        .init(total: 325, department: .opthalmology),
        .init(total: 73, department: .surgery)
    ]
    var body: some View {
      
        Chart{
            ForEach(allPatientsSeen.sorted(by: { $0.total > $1.total })){ item in
                BarMark(x:
                        .value(
                            "Department",
                            item.department.rawValue),
                            y: .value(
                                "Patients seen",
                                Int(item.total)
                            )
                    )
                    .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                
            }
            if let barSelection{
                RuleMark(x: .value("Department", barSelection))
                    .foregroundStyle(.gray.opacity(0.35))
                    .zIndex(-10)
                    .offset(yStart: 50)
                    .annotation(position: .top, spacing: 0, overflowResolution: .init(x: .fit, y: .disabled)){
                        if let theTotal = allPatientsSeen.findTotals(barSelection){
                            chartPopOverView(barSelection, Int(theTotal))
                        }
                    }
            }
            
            
        }
        .chartXSelection(value: $barSelection)
        .frame(height: 450)
        .padding(12)
            
        
    }
    @ViewBuilder
    func chartPopOverView(_ department: String, _ total: Int) -> some View{
        VStack(alignment: .leading, spacing: 6){
            Text("Patients Seen")
                .font(.title2)
            
            HStack(spacing: 4){
                Text("\(total)")
                    .fontWeight(.semibold)
                Text(" - \(department)")
                    
                    
            }
            
        }
        .foregroundStyle(.white)
        .font(.title3)
        .padding()
        .background(.thinMaterial.opacity(0.8), in: .rect(cornerRadius: 12))
    }
    
    /// Finds the department corresponding to a given range value.
    /// - Parameter rangeValue: The value used to find the corresponding department.
    func findDepartmentValue(_ rangeValue: Double) {
        // Start with an initial value of 0.0 to accumulate totals.
        var currentValue: Double = 0.0
        
        // Convert `allPatientsSeen` into an array of tuples, each containing a department name and a range.
        // This array is sorted by the total number of patients seen in descending order.
        // `compactMap` is used to transform each `patientSeen` into a tuple of department name and its range.
        let departmentRanges = allPatientsSeen.sorted { $0.total > $1.total }.compactMap { patientSeen -> (String, Range<Double>) in
            // Calculate the end of the current range based on the total number of patients seen.
            let rangeEnd = currentValue + patientSeen.total
            // Create a tuple with the department name and its corresponding range.
            let departmentRange = (patientSeen.department.rawValue, currentValue..<rangeEnd)
            
            // Update the current value for the next iteration.
            currentValue = rangeEnd
            
            return departmentRange
        }
        
        // Find the first department range tuple that contains the given range value.
        if let matchingDepartment = departmentRanges.first(where: { $0.1.contains(rangeValue) }) {
            // Update `barSelection` with the found department's name.
            barSelection = matchingDepartment.0
        }
    }

}

#Preview {
    BarChartView()
        .frame(height: 400)
}
