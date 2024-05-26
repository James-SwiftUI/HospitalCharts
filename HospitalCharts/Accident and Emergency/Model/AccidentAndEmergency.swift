import SwiftUI



struct AccidentAndEmergency: Identifiable{
    var id = UUID()
    
    
    var totalNumber: Int
    var date: Date
}




struct Attendance: Identifiable{
    var id = UUID()
    var month: String
    var attendence: AttendanceType
    var total: Int
    var color: String
    
    
}


enum AttendanceType: String, CaseIterable, Identifiable{
    var id: Self { return self }
    
    case ambulance = "Ambulance"
    case helicopter = "Helicopter"
    case walkin = "Walk In"
    case police = "Police"
    
    var color: Color{
        switch self{
            
        case .ambulance:
            .green
        case .helicopter:
            .red
        case .walkin:
            .orange
        case .police:
            .blue
        }
    }
    
    
    var colorName: String{
        switch self{
            
        case .ambulance:
            "Green"
        case .helicopter:
            "Red"
        case .walkin:
            "Orange"
        case .police:
            "Blue"
        }
    }
}
