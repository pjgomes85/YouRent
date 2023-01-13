// Connects to data-controller="map"
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = 'pk.eyJ1IjoicGpnb21lczg1IiwiYSI6ImNsOThmMmRqcTJveGczdXFtYmlvN20wOTkifQ.5CPwS5icDdvRiIa01SAbeA'

    this.map = new mapboxgl.Map({
      container: this.element,
      style: 'mapbox://styles/mapbox/streets-v8',
      center: [-0.5800364, 44.841225],
      zoom: 15,

    });

    this.map.scrollZoom.disable();
    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    // this.map.addControl(new MapboxGeocoder({ accessToken: mapboxgl.accessToken, mapboxgl: mapboxgl }))


  }




  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 8, duration: 150 })

  }


  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)
      new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup)
      .addTo(this.map);
    });

  }
}



  // #addMarkersToMap() {
  //   this.markersValue.forEach((marker) => {
  //   const popup = new mapboxgl.Popup().setHTML(marker.info_window)
  //   const customMarker = document.createElement("div")
  //   customMarker.className = "marker"
  //   customMarker.style.backgroundImage = `url('${marker.image_url}')`
  //   customMarker.style.backgroundSize = "contain"
  //   customMarker.style.width = "25px"
  //   customMarker.style.height = "25px"

  //     new mapboxgl.Marker(customMarker)
  //     .setLngLat([marker.lng, marker.lat])
  //     .setPopup(popup)
  //     .addTo(this.map)

  //   })


  // #fitMapToMarkers() {
  //   const bounds = new mapboxgl.LngLatBounds()
  //   this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
  //   this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  // }
