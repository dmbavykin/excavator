import { Loader } from 'google-maps';

document.addEventListener('DOMContentLoaded', (event) => {
  const loader = new Loader(process.env.GOOGLE_MAPS_API_KEY, {});
 
  loader.load().then(function (google) {
    let map = new google.maps.Map(document.getElementById('map'), {
      center: { lat: -81.13390268058475, lng: 32.07206917625161 },
      zoom: 8
    });

    let lineCoordinates = document.getElementById('coordinates').value.split(',').map(coordinates => {
      let splittedCoordinates = coordinates.split(' ')
      return new google.maps.LatLng(+splittedCoordinates[0], +splittedCoordinates[1])
    })

    createPolyline(map, lineCoordinates, lineSymbol);

    let linePath;
    let lineSymbol = '-'
    function createPolyline(map,lineCoordinates,lineSymbol) {
      linePath = new google.maps.Polyline({
        path: lineCoordinates,
        geodesic: true,
        strokeColor: '#FF0000',
        strokeOpacity: 1.0,
        strokeWeight: 2
      });
      linePath.setMap(map);
    }
  })
})
