import SwiftUI

struct TestingView: View {
    
    @State private var graphType: GraphType = .donut
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Select type of chart", selection: $graphType){
                    ForEach(GraphType.allCases, id: \.rawValue){ item in
                        Text(item.rawValue)
                            .tag(item)
                    }
                }
                .pickerStyle(.segmented)
                .labelsHidden()
                switch graphType {
                case .bar:
                    BarChartView()
                case .pie:
                    SectorChartView(graphType: $graphType)
                case .donut:
                    SectorChartView(graphType: $graphType)
                }
            }
            .animation(.snappy, value: graphType)
            .navigationTitle("Trust Summary 📊")
            .padding(.horizontal, 8)
            
        }
        
        
    }
}

#Preview {
    TestingView()
}
