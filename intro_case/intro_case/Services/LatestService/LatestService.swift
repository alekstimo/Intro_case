//
//  LatestService.swift
//  intro_case
//
//  Created by Кирилл Зезюков on 22.03.2023.
//

import Foundation
struct LatestService {

    let dataTask = BaseNetworkTask<EmptyModel, [LatestResponseModel]>(
        method: .get,
        path: "cc0071a1-f06e-48fa-9e90-b1c2a61eaca7"
    )

    func loadLatest(_ onResponseWasReceived: @escaping (_ result: Result<[LatestResponseModel], Error>) -> Void) {
        dataTask.perfomRequest(onResponseWasReceived)
    }

}
