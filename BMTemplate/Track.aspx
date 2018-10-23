<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Track.aspx.cs" Inherits="BMTemplate.Track" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
</asp:ScriptManager>
     <fieldset style="border-radius: 5px; box-shadow: 5px 5px 2px #888888;">
        <legend>Track Vehicle</legend>
         <table class="Normaltable">
            <tr>
                 <td class="LabelColumn" style="width: 191px">Trip Reference No</td>
                 <td class="FieldColumn">
                    <asp:DropDownList ID="cboTrips" runat="server" AutoPostBack="True" CssClass="MediumField" DataTextField="TripRef" DataValueField="TripId"
                        Height="16px" Width="186px" OnSelectedIndexChanged="cboTrips_SelectedIndexChanged">
                        <asp:ListItem Text="Select" Value="0" />
                    </asp:DropDownList>
                </td>
                <td class="LabelColumn" style="width: 191px">Model</td>
                 <td class="FieldColumn">
                    <asp:TextBox ID="txtModel" Enabled="false" runat="server" CssClass="MediumField" Height="16px" Width="186px"/>                    
                </td>
            
                 <td class="LabelColumn" style="width: 191px">Registration No</td>
                 <td class="FieldColumn">
                     <asp:TextBox ID="txtRegistration" Enabled="false" runat="server" CssClass="MediumField" Height="16px" Width="186px"/>
                </td>
            </tr>
            <tr>
                 <td class="LabelColumn" style="width: 191px">Project</td>
                 <td class="FieldColumn">
                    <asp:TextBox ID="txtProject" Enabled="false" runat="server" CssClass="MediumField" Height="16px" Width="186px"/>                    
                </td>
                <td class="LabelColumn" style="width: 191px">Start Point</td>
                 <td class="FieldColumn">
                    <asp:TextBox ID="txtStartPoint" Enabled="false" runat="server" CssClass="MediumField" Height="16px" Width="186px"/>                    
                </td>
                 <td class="LabelColumn" style="width: 191px">End Point</td>
                 <td class="FieldColumn">
                    <asp:TextBox ID="txtEndPoint" Enabled="false" runat="server" CssClass="MediumField" Height="16px" Width="186px"/>                    
                </td>
            </tr>
        </table>
         <br />  
         <div ng-app="appTracker" ng-controller="trackerController">{{1 + 8}}
            <div id="map" style="width:900px;height:700px;"></div>
            <div id="class" ng-repeat="marker in markers | orderBy : 'title'">
                 <a href="#" ng-click="openInfoWindow($event, marker)">{{marker.title}}</a>
            </div>
        </div>
    </fieldset>
    
    <script type="text/javascript">
        var appTracker = angular.module('appTracker', []);   

        appTracker.factory('trackerService', function ($http,$q) {
                       
            return {
                getTripLogByTripId: function () {
                    var deferred = $q.defer();
                    $http.get("http://40.84.129.247/vmsapi/api/vehicletrip/trips/10035")
                        .then(function (response) {
                            deferred.resolve(response);
                        },
                        function (error) {
                            deferred.reject(error);
                        });
                    return deferred.promise;
                }
            }

         });

       
        appTracker.controller('trackerController', function ($scope, trackerService) {

            $scope.tripLogs1 = [
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.184444,
                    lat: -25.767981
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.180115,
                    lat: -25.799474
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.182851,
                    lat: -25.842122
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.103512,
                    lat: -26.041710
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.091855,
                    lat: -26.062659
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Driving : Midrad',
                    long: 28.084701,
                    lat: -26.094139
                },
                {
                    city: 'NW 65 HH GP',
                    desc: 'Ingition Off : Midrad',
                    long: 28.068816,
                    lat: -26.136935
                }
            ];

            $scope.tripLogs = [];
            
            var mapOptions = {
                zoom: 12,
                center: new google.maps.LatLng(-25.799474,28.182851 ),
                mapTypeId: google.maps.MapTypeId.TERRAIN
            }

            $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);

            $scope.markers = [];

            var infoWindow = new google.maps.InfoWindow();

            var createMarker = function (info) {

                var marker = new google.maps.Marker({
                    map: $scope.map,
                    position: new google.maps.LatLng(info.lat, info.long),
                    title: info.city
                });
                marker.content = '<div class="infoWindowContent">' + info.desc + '</div>';

                google.maps.event.addListener(marker, 'click', function () {
                    infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
                    infoWindow.open($scope.map, marker);
                });

                $scope.markers.push(marker);

            }

            var drawline = function (startLat, startLong, endLat, endLong) {

                var line = new google.maps.Polyline({
                    path: [new google.maps.LatLng(startLat, startLong), new google.maps.LatLng(endLat, endLong)],
                    strokeColor: "#FF0000",
                    strokeOpacity: 0.5,
                    strokeWeight: 4,
                    geodesic: true,
                    map: $scope.map
                });
            };

            var populateTrips = function () {

                for (i = 0; i < $scope.tripLogs.length; i++) {

                    createMarker($scope.tripLogs[i]);

                    if (i < cities.length) {
                        drawline($scope.tripLogs[i].lat, $scope.tripLogs[i].long, $scope.tripLogs[i + 1].lat, $scope.tripLogs[i + 1].long);
                    }
                }
            };

            $scope.openInfoWindow = function (e, selectedMarker) {
                e.preventDefault();
                google.maps.event.trigger(selectedMarker, 'click');
            }
            populateTrips();

            setInterval(function () {

               var tripId = $('#<%=cboTrips.ClientID%>').val(); 
               var model = $('#<%=txtModel.ClientID%>').val();
               var registrationNo = $('#<%=txtRegistration.ClientID%>').val();

               trackerService.getTripLogByTripId(tripId).then(function (response) {
                   console.log(response.Data);
                    angular.forEach(response.Data, function (item, key) {
                         
                        if (item.TripLogStatus == 1)
                        {
                            model = model + ': Ignition Started'
                        } else if (item.TripLogStatus == 2) {
                            model = model + ': Driving'
                        } else if (item.TripLogStatus == 3) {
                            model = model + ': Ignition Stoppped'
                        }

                        $scope.tripLogs.push({ city: registrationNo, desc: model, long: item.Longitude, lat: item.Latitud });
                   });

                    populateTrips();
                    
                })
            }, 12000)
        });
    </script>
</asp:Content>
