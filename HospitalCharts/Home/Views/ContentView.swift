import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TrustHospitalsView()
                .tabItem {
                    Label("Hospitals", systemImage: "list.bullet.clipboard")
                }
            
            SummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }
            AandEView()

                .tabItem{
                    Label("Accident and Emergency", systemImage: "cross.fill")
                }
//            DonutChartView()
//                .tabItem{
//                    Label("Donut 🍩", systemImage: "circle")
//                }
           
        }
    }
}

#Preview {
    ContentView()
}

