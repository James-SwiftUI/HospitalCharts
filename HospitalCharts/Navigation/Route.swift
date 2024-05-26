import Foundation
import SwiftUI

enum Route: Hashable{
    case hospitalItem(item: any HospitalItem)
    case chart(ward: String)
    case department(community: Community)
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.hashValue)
    }
    
    static func == (lhs: Route, rhs: Route) -> Bool {
        switch (lhs, rhs) {
            case (.hospitalItem(let lhsItem), .hospitalItem(let rhsItem)):
                return lhsItem.id == rhsItem.id
            case (.chart, .chart):
                return true
            case(.department, .department):
                return true
            default:
                return false
        }
    }
    
    
    var body: some View{
        Text("GOODBYE")
    }
    
}
