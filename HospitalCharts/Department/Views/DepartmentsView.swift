import SwiftUI

struct DepartmentsView: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("Departments 📊")
                    .font(.largeTitle)
                Text("Performance 📈")
                    .font(.title)
            }
            .navigationTitle("Department Overview")
        }
    }
}

#Preview {
    DepartmentsView()
}
