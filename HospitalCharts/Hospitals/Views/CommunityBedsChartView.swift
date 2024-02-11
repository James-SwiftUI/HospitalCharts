import SwiftUI
import Charts
struct CommunityBedsChartView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @Binding var wardName: String
    @Binding var beds: Int
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    ScrollView(.horizontal){
                        Chart{
                                ForEach(1...beds, id: \.self){ item in
                                    
                                    let randomNumber = Int.random(in: 1...3)

                                    BarMark(x: .value("Patient", "Bed \(item )"), y: .value("Stay Days", randomNumber * item))
                                        .foregroundStyle(by: .value("Patient", "Person \(item)"))
                                    RuleMark(y: .value("Long Stay", 14))
                                        .lineStyle(StrokeStyle(dash: [15.0, 5.0]))
                                        .foregroundStyle(.red
                                        )
                                        .annotation(position: .top, alignment: .leading){
                                            Text("Lengthy Stay")
                                                .textCase(.uppercase)
                                                .font(.headline)
                                                .foregroundStyle(.red)
                                        }
                                }
                            }
                            .chartPlotStyle{ plotArea in
                                plotArea
                                    .frame(width: 850, height: 350)
                            }
                            .padding()
                            .chartLegend(.hidden)
                    }
                }header: {
                    Text("Days Occupied By Patient")
                        .font(.title3)
                        .fontWeight(.semibold)
                }
            }
            .listStyle(.plain)
            .navigationTitle(wardName)
            .navigationBarTitleDisplayMode(.inline)
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
        }
        
    }
}

#Preview {
    CommunityBedsChartView(wardName: .constant("Dolphin Ward"),beds: .constant(20))
}
