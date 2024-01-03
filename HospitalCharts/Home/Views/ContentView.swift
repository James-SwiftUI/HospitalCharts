import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            TrustHospitalsView()
                .tabItem {
                    Label("Hospitals", systemImage: "plus.square")
                }
            
            DepartmentsView()
                .tabItem {
                    Label("Department", systemImage: "chart.bar")
                }
        }
    }
}

#Preview {
    ContentView()
}
