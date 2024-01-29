import SwiftUI

struct CommunityDetailView: View {
    
    let community: Community
    
    @State private var showCommunityChartView = false
    
    var body: some View {
    
            List{
                Section{
                    VStack(alignment: .leading, spacing: 8){
                        Text(community.name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .underline()
                        HStack{
                            
                            
                            
                            Text("\(community.wards.count) wards")
                                
                            Spacer()
                            Text("\(community.totalBeds) Beds")
                        }
                        .font(.body)
                        .fontWeight(.semibold)
                    }
                    .font(.title3)
                }header: {
                    Text("Hospital Information")
                }
                Section{
                    
                    ForEach(community.wards.sorted(by: { $0.key < $1.key }), id: \.key){ name, total in
                            
                        WardLink(name: name, total: total)
                    }
                      
                    
                }header: {
                    Text("Wards")
                }
                Section{
                
                    ForEach(community.totalSeenByDepartment.keys.sorted(by: { $0.hashValue < $1.hashValue }), id: \.self) { key in
                            
                            
                           
                        DepartmentLink(departmentName: key.displayName, totalSeen: community.totalSeenByDepartment[key] ?? 0)
                            
                    }
                    
            
                        Button{
                            showCommunityChartView.toggle()
                        }label: {
                            Text("View More")
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .buttonStyle(.plain)
                        .background(.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .foregroundColor(.white)

                }header: {
                    Text("Departments")
                }footer: {
                    Text("View patients seen by department")
                }
                .navigationTitle("Community Hosptial")
                .navigationBarTitleDisplayMode(.inline)
                .fullScreenCover(isPresented: $showCommunityChartView){
                    CommunityChartView(community: community)
                }
        }
    }
}

#Preview {
    CommunityDetailView(community: .example)
}


