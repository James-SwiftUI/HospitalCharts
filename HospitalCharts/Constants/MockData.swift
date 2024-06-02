import Foundation

struct MockData{
    
    static let acuteHospitals: [Acute] = [
        Acute(name: "Red Robin General Hospital", description: "Red Robin General Hospital stands as a beacon of medical excellence and compassionate care. Established in 1952, this hospital has grown from a modest community facility to one of the largest healthcare providers in the region. Renowned for its cutting-edge research and state-of-the-art facilities,  offers a wide range of services from emergency care to specialized treatments in cardiology and neurology.", wards: ["Ash Ward": 20, "Oak Ward": 22, "Elm Ward": 18, "Elder Ward" : 13,"Hazel Ward" : 17, "Hawthorn Ward": 19, "Larch Ward" : 15, "Maple Ward": 16, "Olive Ward" : 21], totalSeenByDepartment:  [.AandE: 890, .cardiology: 350, .ent: 912, .surgery: 52]),
        Acute(name: "Pheasant Hill Regional Hospital", description: "Located on the scenic outskirts, Pheasant Hill Regional Hospital serves as a crucial healthcare hub for the surrounding rural communities. Opened in 1978, the hospital is perched atop a gentle hill, offering picturesque views of the neighboring countryside. It is particularly celebrated for its outstanding maternity services and orthopedic care. The hospital prides itself on its community-focused approach, emphasizing patient-centered care in a family-friendly atmosphere. Its modern facilities are equipped to handle a broad spectrum of medical issues, ensuring comprehensive care in a tranquil setting.", wards: ["Apple Ward": 24, "Beech Ward": 20, "Birch Ward": 22, "Yew Ward": 18, "Pine Ward" : 17, "Spruce Ward": 19, "Sycamore Ward": 20,"Willow Ward" : 28], totalSeenByDepartment: [.AandE: 890, .cardiology: 350, .ent: 912, .surgery: 52])
    ]
    
    
    
    static let communityHospitals: [Community] = [
        Community(name: "Kingfisher Community Hospital", description: "", wards: ["Daffodil Ward": 18, "Primrose Ward": 22], totalSeenByDepartment: [.MIU : 310, .geriatric : 287, .outreach : 128, .rehabilitation : 185]),
        Community(name: "Nightingale Cottage Hospital", description: "", wards: ["Bluebell Ward": 17, "Snowdrop Ward": 19], totalSeenByDepartment: [.MIU : 482, .geriatric : 252, .outreach : 176, .rehabilitation : 98]),
        Community(name: "Heron Park Hospital", description: "", wards: ["Foxglove Ward": 21, "Poppy Ward":18], totalSeenByDepartment: [.MIU : 453, .geriatric : 193, .outreach : 248, .rehabilitation : 68]),
        Community(name: "Kestral Ridge Health Centre", description: "", wards: ["Heather Ward": 23, "Honeysuckle": 22], totalSeenByDepartment: [.MIU : 579, .geriatric : 303, .outreach : 250, .rehabilitation : 96]),
        Community(name: "Skylark View Community Hospital", description: "", wards: ["Gorse Ward": 16, "Pansy Ward": 20], totalSeenByDepartment: [.MIU : 636, .geriatric : 348, .outreach : 94, .rehabilitation : 108]),
        Community(name: "The Sunrise Centre", description: "", wards: ["Shamrock Ward": 17, "Buttercup Ward": 19], totalSeenByDepartment: [.MIU : 258, .geriatric : 539, .outreach : 117, .rehabilitation : 309])
        
    ]
    
    // Summary View
    
    
    //    static let allPatientsSeenSummary: [PatientsSeen] = [
    //        .init(total: 325, department: .opthalmology),
    //        .init(total: 255, department: .cardiology),
    //        .init(total: 121, department: .gastroerolgy),
    //        .init(total: 89, department: .neurology),
    //        .init(total: 73, department: .surgery)
    //    ]
    
    
    
    
    // For A and E Line Chart View
    
    static let AandE2020 = [AccidentAndEmergency(totalNumber: 394, date: createDate(year: 2020, month: 1, day: 01)!),
                            AccidentAndEmergency(totalNumber: 322, date: createDate(year: 2020, month: 2, day: 01)!),
                            AccidentAndEmergency(totalNumber: 469, date: createDate(year: 2020, month: 3, day: 01)!),
                            AccidentAndEmergency(totalNumber: 340, date: createDate(year: 2020, month: 4, day: 01)!),
                            AccidentAndEmergency(totalNumber: 431, date: createDate(year: 2020, month: 5, day: 01)!),
                            AccidentAndEmergency(totalNumber: 465, date: createDate(year: 2020, month: 6, day: 01)!),
                            AccidentAndEmergency(totalNumber: 372, date: createDate(year: 2020, month: 7, day: 01)!),
                            AccidentAndEmergency(totalNumber: 338, date: createDate(year: 2020, month: 8, day: 01)!),
                            AccidentAndEmergency(totalNumber: 417, date: createDate(year: 2020, month: 9, day: 01)!),
                            AccidentAndEmergency(totalNumber: 459, date: createDate(year: 2020, month: 10, day: 01)!),
                            AccidentAndEmergency(totalNumber: 386, date: createDate(year: 2020, month: 11, day: 01)!),
                            AccidentAndEmergency(totalNumber: 452, date: createDate(year: 2020, month: 12, day: 01)!)
    ]
    
    static let AandE2021 = [AccidentAndEmergency(totalNumber: 493, date: createDate(year: 2021, month: 1, day: 01)!),
                            AccidentAndEmergency(totalNumber: 386, date: createDate(year: 2021, month: 2, day: 01)!),
                            AccidentAndEmergency(totalNumber: 459, date: createDate(year: 2021, month: 3, day: 01)!),
                            AccidentAndEmergency(totalNumber: 417, date: createDate(year: 2021, month: 4, day: 01)!),
                            AccidentAndEmergency(totalNumber: 338, date: createDate(year: 2021, month: 5, day: 01)!),
                            AccidentAndEmergency(totalNumber: 372, date: createDate(year: 2021, month: 6, day: 01)!),
                            AccidentAndEmergency(totalNumber: 495, date: createDate(year: 2021, month: 7, day: 01)!),
                            AccidentAndEmergency(totalNumber: 431, date: createDate(year: 2021, month: 8, day: 01)!),
                            AccidentAndEmergency(totalNumber: 284, date: createDate(year: 2021, month: 9, day: 01)!),
                            AccidentAndEmergency(totalNumber: 469, date: createDate(year: 2021, month: 10, day: 01)!),
                            AccidentAndEmergency(totalNumber: 312, date: createDate(year: 2021, month: 11, day: 01)!),
                            AccidentAndEmergency(totalNumber: 394, date: createDate(year: 2021, month: 12, day: 01)!)
    ]
    
    static let AandE2022 = [AccidentAndEmergency(totalNumber: 312, date: createDate(year: 2022, month: 1, day: 01)!),
                            AccidentAndEmergency(totalNumber: 469, date: createDate(year: 2022, month: 2, day: 01)!),
                            AccidentAndEmergency(totalNumber: 284, date: createDate(year: 2022, month: 3, day: 01)!),
                            AccidentAndEmergency(totalNumber: 431, date: createDate(year: 2022, month: 4, day: 01)!),
                            AccidentAndEmergency(totalNumber: 495, date: createDate(year: 2022, month: 5, day: 01)!),
                            AccidentAndEmergency(totalNumber: 372, date: createDate(year: 2022, month: 6, day: 01)!),
                            AccidentAndEmergency(totalNumber: 338, date: createDate(year: 2022, month: 7, day: 01)!),
                            AccidentAndEmergency(totalNumber: 417, date: createDate(year: 2022, month: 8, day: 01)!),
                            AccidentAndEmergency(totalNumber: 459, date: createDate(year: 2022, month: 9, day: 01)!),
                            AccidentAndEmergency(totalNumber: 386, date: createDate(year: 2022, month: 10, day: 01)!),
                            AccidentAndEmergency(totalNumber: 493, date: createDate(year: 2022, month: 11, day: 01)!),
                            AccidentAndEmergency(totalNumber: 394, date: createDate(year: 2022, month: 12, day: 01)!)
    ]
    
    static let AandE2023 = [AccidentAndEmergency(totalNumber: 284, date: createDate(year: 2023, month: 1, day: 01)!),
                            AccidentAndEmergency(totalNumber: 431, date: createDate(year: 2023, month: 2, day: 01)!),
                            AccidentAndEmergency(totalNumber: 495, date: createDate(year: 2023, month: 3, day: 01)!),
                            AccidentAndEmergency(totalNumber: 372, date: createDate(year: 2023, month: 4, day: 01)!),
                            AccidentAndEmergency(totalNumber: 338, date: createDate(year: 2023, month: 5, day: 01)!),
                            AccidentAndEmergency(totalNumber: 417, date: createDate(year: 2023, month: 6, day: 01)!),
                            AccidentAndEmergency(totalNumber: 459, date: createDate(year: 2023, month: 7, day: 01)!),
                            AccidentAndEmergency(totalNumber: 372, date: createDate(year: 2023, month: 8, day: 01)!),
                            AccidentAndEmergency(totalNumber: 290, date: createDate(year: 2023, month: 9, day: 01)!),
                            AccidentAndEmergency(totalNumber: 394, date: createDate(year: 2023, month: 10, day: 01)!),
                            AccidentAndEmergency(totalNumber: 312, date: createDate(year: 2023, month: 11, day: 01)!),
                            AccidentAndEmergency(totalNumber: 469, date: createDate(year: 2023, month: 12, day: 01)!)
    ]
    
    
    static let AandEThisWeek = [
        AccidentAndEmergency(totalNumber: 6, date: createDateAndTime(day: 1, hour: 1, minute: 0)!),
        AccidentAndEmergency(totalNumber: 7, date: createDateAndTime(day: 1, hour: 2, minute: 0)!),
        AccidentAndEmergency(totalNumber: 5, date: createDateAndTime(day: 1, hour: 3, minute: 0)!),
        AccidentAndEmergency(totalNumber: 12, date: createDateAndTime(day: 1, hour: 4, minute: 0)!),
        AccidentAndEmergency(totalNumber: 9, date: createDateAndTime(day: 1, hour: 5, minute: 0)!),
        AccidentAndEmergency(totalNumber: 12, date: createDateAndTime(day: 1, hour: 6, minute: 0)!),
        AccidentAndEmergency(totalNumber: 14, date: createDateAndTime(day: 1, hour: 7, minute: 0)!),
        AccidentAndEmergency(totalNumber: 17, date: createDateAndTime(day: 1, hour: 8, minute: 0)!),
        AccidentAndEmergency(totalNumber: 10, date: createDateAndTime(day: 1, hour: 9, minute: 0)!),
        AccidentAndEmergency(totalNumber: 10, date: createDateAndTime(day: 1, hour: 10, minute: 0)!),
        AccidentAndEmergency(totalNumber: 11, date: createDateAndTime(day: 1, hour: 11, minute: 0)!),
        AccidentAndEmergency(totalNumber: 13, date: createDateAndTime(day: 1, hour: 12, minute: 0)!),
       
        AccidentAndEmergency(totalNumber: 10, date: createDateAndTime(day: 1, hour: 13, minute: 0)!),
       
        AccidentAndEmergency(totalNumber: 14, date: createDateAndTime(day: 1, hour: 14, minute: 0)!),

        AccidentAndEmergency(totalNumber: 13, date: createDateAndTime(day: 1, hour: 15, minute: 0)!),
        
        AccidentAndEmergency(totalNumber: 12, date: createDateAndTime(day: 1, hour: 16, minute: 0)!),
    
        AccidentAndEmergency(totalNumber: 21, date: createDateAndTime(day: 1, hour: 17, minute: 0)!),
       
        AccidentAndEmergency(totalNumber: 15, date: createDateAndTime(day: 1, hour: 18, minute: 0)!),

        AccidentAndEmergency(totalNumber: 9, date: createDateAndTime(day: 1, hour: 19, minute: 0)!),
  
    ]
    
    
    // For summary View
    
    //    static let allPatientsSeen: [PatientsSeen] = [
    //        .init(total: 255, department: .cardiology),
    //        .init(total: 121, department: .gastroerolgy),
    //        .init(total: 89, department: .neurology),
    //        .init(total: 325, department: .opthalmology),
    //        .init(total: 73, department: .surgery)
    //    ]
    //
    static let allPatientsSeen: [PatientsSeen] = [
        .init(total: 325, department: .opthalmology, color: .blue),
        .init(total: 255, department: .cardiology, color: .green),
        .init(total: 121, department: .gastroerolgy, color: .orange),
        .init(total: 89, department: .neurology, color: .purple),
        .init(total: 73, department: .surgery, color: .red)
    ]

    
    static func createDate(year: Int, month: Int, day: Int) -> Date? {
        var components = DateComponents()
        components.year = year
        components.month = month
        components.day = day
        
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
    
    
    static func createDateAndTime(day: Int, hour: Int, minute: Int) -> Date?{
        var components = DateComponents()
        components.year = 2024
        components.month = 5
        
        components.day = day
        components.hour = hour
        components.minute = minute
        
        let calendar = Calendar.current
        return calendar.date(from: components)
        
    }
    
   
    
    
}





