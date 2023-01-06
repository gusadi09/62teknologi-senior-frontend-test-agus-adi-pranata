//
//  BusinessTargetType.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

public enum BusinessTargetType {
	case getListOfBusinesses(BusinessesRequestParam)
	case getDetailOfBusiness(String)
	case getReviewsOfBusiness(String)
}

extension BusinessTargetType: BusinessAppTargetType, AccessTokenAuthorizable {
	public var authorizationType: Moya.AuthorizationType? {
		return .bearer
	}

	public var parameterEncoding: Moya.ParameterEncoding {
		URLEncoding.default
	}

	public var task: Task {
		return .requestParameters(parameters: parameters, encoding: parameterEncoding)
	}

	public var parameters: [String : Any] {
		switch self {
		case .getListOfBusinesses(let param):
			return param.toJSON()
		case .getDetailOfBusiness(_):
			return [:]
		case .getReviewsOfBusiness(_):
			return [:]
		}
	}

	public var path: String {
		switch self {
		case .getDetailOfBusiness(let id):
			return "/businesses/\(id)"
		case .getListOfBusinesses(_):
			return "/businesses/search"
		case .getReviewsOfBusiness(let id):
			return "/businesses/\(id)/reviews"
		}
	}

	public var sampleData: Data {
		switch self {
		case .getListOfBusinesses(_):
			return BusinessResponse.sampleData
		case .getDetailOfBusiness(_):
			return DetailBusinessResponse.sampleData
		case .getReviewsOfBusiness(_):
			return	ReviewsResponse.sampleData
		}
	}

	public var method: Moya.Method {
		return .get
	}
}
