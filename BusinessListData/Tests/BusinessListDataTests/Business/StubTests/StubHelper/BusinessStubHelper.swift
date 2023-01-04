//
//  BusinessStubHelper.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya
@testable import BusinessListData

final class BusinessStubHelper: ObservableObject {

	private let stubProvider = MoyaProvider<BusinessTargetType>(stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin()])

	private let endpointClosureError = { (target: BusinessTargetType) -> Endpoint in
		return Endpoint(
			url: URL(target: target).absoluteString,
			sampleResponseClosure: {
				.networkResponse(
					401,
					ErrorResponse(
						error: ErrorData(
							code: "NOT_AUTHORIZED",
							description: "Your API Key is not authorized to access this endpoint"
						)
					).toJSONData()
				)
			},
			method: target.method,
			task: target.task,
			httpHeaderFields: target.headers
		)
	}

	private var errorStubProvider: MoyaProvider<BusinessTargetType> {
		return MoyaProvider<BusinessTargetType>(endpointClosure: endpointClosureError, stubClosure: MoyaProvider.immediatelyStub, plugins: [NetworkLoggerPlugin()])
	}

	@Published var listResult = [BusinessData]()

	@Published var detail: DetailBusinessResponse?

	@Published var errorMsg = ""

	func stubGetListOfBusiness() async {
		do {
			let result = try await self.stubProvider.request(.getListOfBusinesses(BusinessesRequestParam()), model: BusinessResponse.self)

			listResult = result.businesses ?? []
		} catch (let error as ErrorResponse) {
			errorMsg = (error.error?.code).orEmpty()
		} catch (let err) {
			errorMsg = err.localizedDescription
		}
	}

	func stubGetDetailOfBusiness() async {
		do {
			let result = try await self.stubProvider.request(.getDetailOfBusiness("unittestid"), model: DetailBusinessResponse.self)

			detail = result
		} catch (let error as ErrorResponse) {
			errorMsg = (error.error?.code).orEmpty()
		} catch (let err) {
			errorMsg = err.localizedDescription
		}
	}

	func stubErrorOfListBusinessRequest() async {
		do {
			let result = try await self.errorStubProvider.request(.getListOfBusinesses(BusinessesRequestParam()), model: BusinessResponse.self)

			listResult = result.businesses ?? []
		} catch (let error as ErrorResponse) {
			print("============Errr")
			errorMsg = (error.error?.code).orEmpty()
		} catch (let err) {
			print("============Errror")
			errorMsg = err.localizedDescription
		}
	}

	func stubErrorOfDetailBusinessRequest() async {
		do {
			let result = try await self.errorStubProvider.request(.getDetailOfBusiness("unittestid"), model: DetailBusinessResponse.self)

			detail = result
		} catch (let error as ErrorResponse) {
			print("============Errr")
			errorMsg = (error.error?.code).orEmpty()
		} catch (let err) {
			print("============Errror")
			errorMsg = err.localizedDescription
		}
	}
}
