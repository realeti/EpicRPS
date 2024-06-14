//
//  MockLeaderData.swift
//  EpicRPS
//
//  Created by Алексей on 14.06.2024.
//

import Foundation

struct MockLeaderData {
    let avatar: String
    let name: String
    let match: Int
    let rate: Int
}

extension MockLeaderData {
    static func getData() -> [MockLeaderData] {
        [
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char1,
                name: "Tony Newman",
                match: 15220,
                rate: 100
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char2,
                name: "Herman Welch",
                match: 9855,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char3,
                name: "Dollie Mann",
                match: 7433,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char4,
                name: "Ian Burton",
                match: 5333,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char5,
                name: "Roxie Hansen",
                match: 2456,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char6,
                name: "Steven Vaughn",
                match: 2210,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char7,
                name: "Max Payne",
                match: 1933,
                rate: 98
            ),
            MockLeaderData(
                avatar: K.GamerAvatar.AvatarName.char8,
                name: "Henry Padilla",
                match: 1838,
                rate: 98
            ),
        ]
    }
}
