//
//  MapsView.swift
//  
//
//  Created by Gus Adi on 06/01/23.
//

import GoogleMaps
import SwiftUI

public struct MapsView: UIViewRepresentable {
	let markerTitle: String
	let markerSnippet: String
	let latitude: CLLocationDegrees
	let longitude: CLLocationDegrees
	let marker : GMSMarker = GMSMarker()

	public typealias UIViewType = GMSMapView

	public init(markerTitle: String, markerSnippet: String, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
		self.markerTitle = markerTitle
		self.markerSnippet = markerSnippet
		self.latitude = latitude
		self.longitude = longitude
	}

	public func makeUIView(context: Context) -> GMSMapView {
		let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 15.0)

		let mapView = GMSMapView(frame: CGRect.zero, camera: camera)

		return mapView
	}

	public func updateUIView(_ uiView: GMSMapView, context: Context) {
		let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 15.0)

		uiView.camera = camera
		marker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
		marker.title = markerTitle
		marker.snippet = markerSnippet
		marker.map = uiView
	}
}

public final class MapsServices {
	public static func provideApiKey(_ value: String) {
		GMSServices.provideAPIKey(value)
	}
}
