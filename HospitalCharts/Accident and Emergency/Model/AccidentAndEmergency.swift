import SwiftUI



struct AccidentAndEmergency: Identifiable{
    var id: String{
        month
    }
    var totalNumber: Int
    var month: String
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
            .yellow
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
            "Yellow"
        case .police:
            "Blue"
        }
    }
}
