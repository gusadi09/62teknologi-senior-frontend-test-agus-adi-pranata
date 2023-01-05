//
//  Moya+defaultProvider.swift
//  
//
//  Created by Gus Adi on 04/01/23.
//

import Foundation
import Moya

public extension MoyaProvider {
	static func defaultProvider() -> MoyaProvider {
		let tokenSource = "inalp7_qjqNq7OK_3nhnpRnGuvzZ_uXY1w93KzRg3WNlQbSa68HQ08ZjB7E_K_BV9-dMivFA1t_KD35o5z4ScZsZne9k6W0i8mxJOYzxD9pZvII3Kd4DfM3peVCyY3Yx"

		let accessTokenPlugin = AccessTokenPlugin(tokenClosure: { _ in
			tokenSource
		})
		return MoyaProvider(plugins: [NetworkLoggerPlugin(), accessTokenPlugin])
	}
}
