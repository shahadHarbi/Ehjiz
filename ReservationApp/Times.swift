//
//  Times.swift
//  ReservationApp
//
//  Created by SHD on 19/02/1442 AH.
//  Copyright © 1442 SAFCSP. All rights reserved.
//

import UIKit

struct BookingTime {
    static var bookingTimeArray : [BookingTime] = [
        .init(time: "09:00",
              arrayofRooms:  [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "10:00",
              arrayofRooms:[
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: false, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: false, roomType: .classRoom)
        ]),
        .init(time: "11:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "12:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "13:00", arrayofRooms:[
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "14:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            
        ]),
        .init(time: "15:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "16:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ]),
        .init(time: "17:00", arrayofRooms: [
            .init(roomName: "1.01", isAvailble: false, roomType: .brainStormingRoom),
            .init(roomName: "1.02", isAvailble: false, roomType: .recordingRoom),
            .init(roomName: "1.03", isAvailble: false, roomType: .meetingRoom),
            .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
        ])
    ]
    var time : String
    var arrayofRooms : [Room]
}
struct Room {
//     var allRooms : [Room] = [
//        .init(roomName: "1.01", isAvailble: true, roomType: .brainStormingRoom),
//        .init(roomName: "1.02", isAvailble: true, roomType: .recordingRoom),
//        .init(roomName: "1.03", isAvailble: true, roomType: .meetingRoom),
//        .init(roomName: "1.04", isAvailble: true, roomType: .classRoom)
//    ]
    var roomName : String
    var isAvailble : Bool
    var roomType : RoomType
}

enum RoomType {
    case recordingRoom
    case meetingRoom
    case brainStormingRoom
    case classRoom
}

struct SelectedRoom {
    var time : String = ""
    var roomName : String = ""
    var date : String = "" 
}


