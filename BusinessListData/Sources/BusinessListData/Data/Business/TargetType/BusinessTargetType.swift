//
//  BusinessTargetType.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

enum BusinessTargetType {
	case getListOfBusinesses(BusinessesRequestParam)
	case getDetailOfBusiness(String)
}

extension BusinessTargetType: BusinessAppTargetType, AccessTokenAuthorizable {
	var authorizationType: Moya.AuthorizationType? {
		switch self {
		case .getDetailOfBusiness(_):
			return .bearer
		case .getListOfBusinesses(_):
			return .bearer
		}
	}

	var parameterEncoding: Moya.ParameterEncoding {
		URLEncoding.default
	}

	var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	var parameters: [String : Any] {
		switch self {
		case .getListOfBusinesses(let param):
			return param.toJSON()
		case .getDetailOfBusiness(_):
			return [:]
		}
	}

	var path: String {
		switch self {
		case .getDetailOfBusiness(let id):
			return "/businesses/\(id)"
		case .getListOfBusinesses(_):
			return "/businesses/search"
		}
	}

	var sampleData: Data {
		switch self {
		case .getListOfBusinesses(_):
			return BusinessResponse.sampleData
		case .getDetailOfBusiness(_):
			return  DetailBusinessResponse.sampleData
		}
	}

	var method: Moya.Method {
		switch self {
		case .getDetailOfBusiness(_):
			return .get
		case .getListOfBusinesses(_):
			return .get
		}
	}
}
