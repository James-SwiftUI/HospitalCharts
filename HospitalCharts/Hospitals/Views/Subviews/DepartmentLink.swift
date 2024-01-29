import SwiftUI

struct DepartmentLink: View {

    let departmentName: String
    let totalSeen: Int
    
    var body: some View {
        HStack{
            Text(departmentName)
            Spacer()
            Text("\(totalSeen)")
                .fontWeight(.semibold)
        }
    }
}
#Preview {
    DepartmentLink(departmentName: "Cardiolgy", totalSeen: 20)
}
