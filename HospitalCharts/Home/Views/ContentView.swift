import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TrustHospitalsView()
                .tabItem {
                    Label("Hospitals", systemImage: "list.bullet.clipboard")
                }
            
            TestingView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }
            AndEHomeView(hostpitalType: "Red Robin")

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

