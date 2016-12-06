let app = angular.module("app", ["ngMap"])

app.controller("map", ["NgMap", "$scope", Callback])

function Callback(NgMap, $scope){
  $scope.click = () => {
    console.log("clicked from $scope")
  }
  this.center = [38.9072, -77.0369]
  NgMap.getMap().then( (map) => {
    let marker = new google.maps.Marker({
      position: {
        lat: 38.9072,
        lng: -77.0369
      },
      map: map,
      tittle: "Some Place in DC"
    })
    google.maps.event.addListener(marker, "click", () => {
      console.log("marker was clicked!")
    })
  })
console.log("controller working")
}
