//
//  BusinessAppTargetType.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

public protocol BusinessAppTargetType: TargetType {
	var parameters: [String: Any] {
		get
	}
}

public extension BusinessAppTargetType {
	var baseURL: URL {
		URL(
			string: "https://api.yelp.com/v3"
		) ?? (NSURL() as URL)
	}

	var parameterEncoding: Moya.ParameterEncoding {
		JSONEncoding.default
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var headers: [String : String]? {
		return [:]
	}
}
