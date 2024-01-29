import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TrustHospitalsView()
                .tabItem {
                    Label("Hospitals", systemImage: "plus.square")
                }
            
            SummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}

