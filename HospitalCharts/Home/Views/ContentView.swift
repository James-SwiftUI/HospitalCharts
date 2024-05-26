import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TrustHospitalsView()
                .tabItem {
                    Label("Hospitals", systemImage: "list.bullet.clipboard")
                }
            HomeSummaryView()
                .tabItem {
                    Label("Summary", systemImage: "chart.bar")
                }
            AndEHomeView(hostpitalType: "Red Robin")

                .tabItem{
                    Label("Accident and Emergency", systemImage: "cross.fill")
                }
        }
    }
}

#Preview {
    ContentView()
}

