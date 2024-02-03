import SwiftUI
import Charts

struct SummaryView: View {
    
    
    @State private var graphType: GraphType = .bar
    
    @State private var barSelection: String?
    @State private var pieSelection: Double?
    
    let allPatientsSeen: [PatientsSeen] = [
        .init(total: 255, department: .cardiology),
        .init(total: 121, department: .gastroerolgy),
        .init(total: 89, department: .neurology),
        .init(total: 325, department: .opthalmology),
        .init(total: 73, department: .surgery)
    ]
    
    var body: some View {
        NavigationStack {
            VStack{
                Picker("Select type of chart", selection: $graphType){
                    ForEach(GraphType.allCases, id: \.rawValue){ item in
                        Text(item.rawValue)
                            .tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                
                ZStack{
                    
                }
                
                Chart{
                    ForEach(allPatientsSeen.sorted(by: { graphType == .bar ? false : $0.total > $1.total })){ item in
                        if graphType == .bar{
                            
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
                            
                            
                        }else{
                            
                            SectorMark(angle: .value("All patients seen", item.total), innerRadius: .ratio(graphType == .donut ? 0.6 : 0),
                                           angularInset: graphType == .donut ? 4 : 1)
                                .cornerRadius(8)
                                .foregroundStyle(by: .value("All patients seen", item.department.rawValue))
                               
                            
                        }
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
                .chartAngleSelection(value: $pieSelection)
                .chartLegend(position: .bottom, alignment: graphType == .bar ? .leading : .center, spacing: 25)
                .frame(height: 450)
                .padding(.top, 15)
                .animation(.snappy, value: graphType)
                
                Spacer(minLength: 0)
            }
            .padding()
            .onChange(of: pieSelection, initial: false){ oldValue, newValue in
                if let newValue{
                    findDepartmentValue(newValue)
                }else{
                    barSelection = nil
                }
            }
            .navigationTitle("Trust Summary 📊")
        }
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
    
    
    
    func findDepartmentValue(_ rangeValue: Double){
        var initalValue: Double = 0.0
        let convertedArray = allPatientsSeen
            .sorted(by: { $0.total > $1.total})
            .compactMap { patientSeen -> (String, Range<Double>) in
                let rangeEnd = initalValue + patientSeen.total
                let tuple = (patientSeen.department.rawValue, initalValue..<rangeEnd)
                
                initalValue = rangeEnd
                
                return tuple
            }
        
        
        if let seen = convertedArray.first(where: {
            $0.1.contains(rangeValue)
        }){
            barSelection = seen.0
        }
    }
}

#Preview {
    SummaryView()
}


enum GraphType: String, CaseIterable{
        case bar = "Bar Chart"
        case pie = "Pie Chart"
        case donut = "Donut Chart"
}



struct PatientsSeen: Identifiable{
    var id = UUID()
    var total: Double
    var department: Department
}


enum Department: String, CaseIterable{
    case opthalmology = "Opthalmology"
    case cardiology = "Cardiology"
    case gastroerolgy = "Gastroerolgy"
    case surgery = "Surgery"
    case neurology = "Neurology"
}


extension [PatientsSeen]{
    func findTotals(_ on: String) -> Double?{
        if let theTotal = self.first(where: {
            $0.department.rawValue == on
        }){
            return theTotal.total
        }
        return nil
        
    }
}
