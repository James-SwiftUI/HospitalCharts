import SwiftUI
import Charts

struct CommunityChartView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var actualName: CommunityDepartment?
    @State private var selectedDepartment: String?
    let community: Community
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Chart{
                    ForEach(community.totalSeenByDepartment.keys.sorted(by: { $0.hashValue < $1.hashValue }), id: \.self) { key in
                        BarMark(
                            x: .value(
                                "Department",
                                key.abbreviatedName
                            ),
                            y: .value(
                                "Patients Seen",
                                community.totalSeenByDepartment[key] ?? 0
                            )
                        )
                        .foregroundStyle(by: .value("Department", key.displayName))
                        .annotation{
                            Text("\(community.totalSeenByDepartment[key] ?? 0)")
                                .font(.caption)
                                .fontWeight(.semibold)
                        }
                    }
                }
                .frame(height: 400)
                .chartLegend(.hidden)
                .chartXSelection(value: $selectedDepartment)
                .onChange(of: selectedDepartment){ oldValue, newValue in
                    if let newValue{
                        departmentName(name: newValue)
                    }
                }
                if let actualName{
                    
                    VStack(spacing: 5){
                          
                        Text("\(actualName.displayName) Department")
                                    .font(.title3)
                                    .underline()
                        Text(actualName.description)

                    }
                    .padding(4)
                    .padding(.top, 10)
                    
                    
                }
                
            }
            .toolbar{
                ToolbarItem{
                    Button{
                        dismiss()
                    }label: {
                        Label("Close", systemImage: "x.circle.fill")
                    }
                    .imageScale(.large)

                }
            }
            .navigationTitle(community.name)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    
    func departmentName(name: String){
        if name == "MIU"{
            actualName = CommunityDepartment.MIU
        }else if name == "RHB"{
            actualName = CommunityDepartment.rehabilitation
        }else if name == "OTR"{
            actualName = CommunityDepartment.outreach
        }else if name == "GER"{
            actualName = CommunityDepartment.geriatric
        }else{
            actualName = nil
        }
    }
}

#Preview {
    CommunityChartView(community: .example)
}
