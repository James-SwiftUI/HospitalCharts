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
    
    static let AandE2020 = [AccidentAndEmergency(totalNumber: 394, month: "Jan", year: "2020"),
                            AccidentAndEmergency(totalNumber: 312, month: "Feb", year: "2020"),
                            AccidentAndEmergency(totalNumber: 469, month: "Mar", year: "2020"),
                            AccidentAndEmergency(totalNumber: 284, month: "Apr", year: "2020"),
                            AccidentAndEmergency(totalNumber: 431, month: "May", year: "2020"),
                            AccidentAndEmergency(totalNumber: 495, month: "Jun", year: "2020"),
                            AccidentAndEmergency(totalNumber: 372, month: "Jul", year: "2020"),
                            AccidentAndEmergency(totalNumber: 338, month: "Aug", year: "2020"),
                            AccidentAndEmergency(totalNumber: 417, month: "Sep", year: "2020"),
                            AccidentAndEmergency(totalNumber: 459, month: "Oct", year: "2020"),
                            AccidentAndEmergency(totalNumber: 386, month: "Nov", year: "2020"),
                            AccidentAndEmergency(totalNumber: 493, month: "Dec", year: "2020")
    ]
    
    static let AandE2021 = [AccidentAndEmergency(totalNumber: 493, month: "Jan", year: "2021"),
                            AccidentAndEmergency(totalNumber: 386, month: "Feb", year: "2021"),
                            AccidentAndEmergency(totalNumber: 459, month: "Mar", year: "2021"),
                            AccidentAndEmergency(totalNumber: 417, month: "Apr", year: "2021"),
                            AccidentAndEmergency(totalNumber: 338, month: "May", year: "2021"),
                            AccidentAndEmergency(totalNumber: 372, month: "Jun", year: "2021"),
                            AccidentAndEmergency(totalNumber: 495, month: "Jul", year: "2021"),
                            AccidentAndEmergency(totalNumber: 431, month: "Aug", year: "2021"),
                            AccidentAndEmergency(totalNumber: 284, month: "Sep", year: "2021"),
                            AccidentAndEmergency(totalNumber: 469, month: "Oct", year: "2021"),
                            AccidentAndEmergency(totalNumber: 312, month: "Nov", year: "2021"),
                            AccidentAndEmergency(totalNumber: 394, month: "Dec", year: "2021")
    ]
    
    static let AandE2022 = [AccidentAndEmergency(totalNumber: 312, month: "Jan", year: "2022"),
                            AccidentAndEmergency(totalNumber: 469, month: "Feb", year: "2022"),
                            AccidentAndEmergency(totalNumber: 284, month: "Mar", year: "2022"),
                            AccidentAndEmergency(totalNumber: 431, month: "Apr", year: "2022"),
                            AccidentAndEmergency(totalNumber: 495, month: "May", year: "2022"),
                            AccidentAndEmergency(totalNumber: 372, month: "Jun", year: "2022"),
                            AccidentAndEmergency(totalNumber: 338, month: "Jul", year: "2022"),
                            AccidentAndEmergency(totalNumber: 417, month: "Aug", year: "2022"),
                            AccidentAndEmergency(totalNumber: 459, month: "Sep", year: "2022"),
                            AccidentAndEmergency(totalNumber: 386, month: "Oct", year: "2022"),
                            AccidentAndEmergency(totalNumber: 493, month: "Nov", year: "2022"),
                            AccidentAndEmergency(totalNumber: 394, month: "Dec", year: "2022")
    ]
    
    static let AandE2023 = [AccidentAndEmergency(totalNumber: 284, month: "Jan", year: "2023"),
                            AccidentAndEmergency(totalNumber: 431, month: "Feb", year: "2023"),
                            AccidentAndEmergency(totalNumber: 495, month: "Mar", year: "2023"),
                            AccidentAndEmergency(totalNumber: 372, month: "Apr", year: "2023"),
                            AccidentAndEmergency(totalNumber: 338, month: "May", year: "2023"),
                            AccidentAndEmergency(totalNumber: 417, month: "Jun", year: "2023"),
                            AccidentAndEmergency(totalNumber: 459, month: "Jul", year: "2023"),
                            AccidentAndEmergency(totalNumber: 372, month: "Aug", year: "2023"),
                            AccidentAndEmergency(totalNumber: 290, month: "Sep", year: "2023"),
                            AccidentAndEmergency(totalNumber: 394, month: "Oct", year: "2023"),
                            AccidentAndEmergency(totalNumber: 312, month: "Nov", year: "2023"),
                            AccidentAndEmergency(totalNumber: 469, month: "Dec", year: "2023")
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
            .init(total: 325, department: .opthalmology),
            .init(total: 255, department: .cardiology),
            .init(total: 121, department: .gastroerolgy),
            .init(total: 89, department: .neurology),
            .init(total: 73, department: .surgery)
        ]
    
}