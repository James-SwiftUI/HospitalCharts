import Foundation

// Used in the WardChartView
// To build patients in and out of ward

struct PatientLog: Identifiable{
    var id = UUID()
    let days: Int
    
    let numderOfPatiens: Int
    let action: Action
    
    var actual: Int{
        action == .patientsOut ? -numderOfPatiens : numderOfPatiens
    }
    
    var theDay: String{
        switch days{
        case 1:
            return "Mon"
        case 2:
            return "Tue"
        case 3:
            return "Wed"
        case 4:
            return "Thu"
        case 5:
            return "Fri"
        case 6:
            return "Sat"
        case 7:
            return "Sun"
        default:
            return ""
        }
    }
    
    
}




enum Action{
    case patientsIn
    case patientsOut
}
