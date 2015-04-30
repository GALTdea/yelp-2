/** MAP **/

var results = [];
var map = {};
var heatmapLayer = {};
var markerLayer = {};
var dataZoom = 11;
var zoomThreshold = 13;

var hideLoader = function () {
  $('#loader-area').addClass('hidden');
};

var showLoader = function () {
  $('#loader-area').removeClass('hidden');
};

var plotData = function () {
  var arr = [];
  $.each(results, function (index, business) {
    arr.push(
      L.marker([business.latitude, business.longitude], {icon: new L.Icon.Default})
      .bindPopup('<p class="lead">' + business.name + '<br><small>Rating: ' +
        business.rating.toFixed(2) + ' / 5.00' + '</small></p><p>' + 
        business.full_address + '</p>')
    );
  });
  markerLayer = L.layerGroup(arr);
};

var plotHeatData = function () {
  var businesses = {
    min: 0,
    max: 5,
    data: results
  };
  heatmapLayer.setData(businesses);
  hideLoader();
};

var getFormData = function () {
  var formData = {};
    
  formData.city = $('#input-city').val();
  formData.categories = $('#input-category').val() || [];

  if ($('#input-price').val() == "") {
    formData.attributes = $('#input-attr').val() || [];
  } else {
    formData.attributes = ($('#input-attr').val() || []).concat($('#input-price').val()) || [];
  }

  formData.price = $('#input-price').val();
  formData.reviewage = $('#input-review-age').val();
  formData.minrating = $( "#input-rating" ).slider( "values", 0 );
  formData.maxrating = $( "#input-rating" ).slider( "values", 1 );
  return formData;
};

var getBusinessData = function () {
  var formData = getFormData();
  $.getJSON('/businesses.json', formData, function (data) {
    results = data;
    if (results.length < 1) {
      alert('No businesses match those filters.');
    } else {
      map.setView([results[0].latitude, results[0].longitude], dataZoom);
      plotHeatData();
    }
  });
};

var initSlider = function() {
  $( "#input-rating" ).slider({
    range: true,
    id: "rating-slider",
    min: 0,
    step: 0.5,
    max: 5,
    values: [ 0, 5 ],
    slide: function( event, ui ) {
      $( "#range" ).text( ui.values[ 0 ] + " - " + ui.values[ 1 ] );
    }
  });
  
  $( "#range" ).text( $( "#input-rating" ).slider( "values", 0 ) +
    " - " + $( "#input-rating" ).slider( "values", 1 ) );
};

var initMap = function () {

  var baseLayer = L.tileLayer(
    'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',{
      attribution: '&copy; <a href="http://openstreetmap.org">OpenStreetMap</a>',
      maxZoom: 18
    }
  );

  var cfg = {
    "radius": 0.01,
    "maxOpacity": 0.75, 
    "scaleRadius": true,
    "blur": 0.99,
    "useLocalExtrema": false,
    "latField": 'latitude',
    "lngField": 'longitude',
    "valueField": 'rating'
  };

  heatmapLayer = new HeatmapOverlay(cfg);
  markerLayer = L.layerGroup([]);

  map = new L.Map('map', {
    center: new L.LatLng(39.8282, -98.5795),
    zoom: 4,
    layers: [baseLayer, heatmapLayer]
  });

  map.on('zoomend', function () {
    if (map.getZoom() > zoomThreshold) {
      if (map.hasLayer(heatmapLayer)) map.removeLayer(heatmapLayer);
      if (! map.hasLayer(markerLayer)) {
        plotData();
        map.addLayer(markerLayer);
      }
    } else {
      if (map.hasLayer(markerLayer)) map.removeLayer(markerLayer);
      if (! map.hasLayer(heatmapLayer)) {
        plotHeatData();
        map.addLayer(heatmapLayer);
      }
    }   
  });

};

var populateFilters = function () {

  // City select
  $.getJSON('/regions.json', function(data) {
	  $.each(data, function(key, value) {
      $('#input-city').append($('<option>', {
        value: value.region,
        text: value.region
	    }));
	  });
  });

  // Category select
  $.getJSON('/categories.json', function(data) {
	  $.each(data, function(key, value) {
      $('#input-category').append($('<option>', {
        value: value.category_id,
        text: value.name
	    }));
	  });
  });
 
  // Attribute select
  $.getJSON("/zattributes.json", function(data) {
    $.each(data, function(key, value) {   
    	var newVal = (value.attribute_name).replace(/^price: /gi, "");
    	if (newVal != value.attribute_name) {
        $('#input-price').append($('<option>', {
        	value: value.attribute_id,
        	text: value.attribute_name
      	}));
    	} else {
      	$('#input-attr').append($('<option>', {
        	value: value.attribute_id,
        	text: value.attribute_name
      	}));
    	}
    });    
  });

};

var useCurrentLocation = function () {
  navigator.geolocation.getCurrentPosition(function (data) {
    var BlueIcon = L.Icon.Default;
    map.setView([data.coords.latitude, data.coords.longitude], dataZoom + 3);
    L.marker([data.coords.latitude, data.coords.longitude], {icon: new L.Icon.Default})
     .addTo(map)
     .bindPopup('<h5>You are here.</h5>')
     .openPopup();
  });
};





/** SAVED SEARCHES **/

var db = {};

db.load = function (key) {
  return JSON.parse(localStorage.getItem(key));
};

db.init = function () {
  var keys = db.load('keys') || [];
  localStorage.setItem('keys', JSON.stringify(keys));
};


db.contains = function (key) {
  return db.load('keys').indexOf(key) !== -1;
};

db.save = function (key, value) {
  if (key === 'keys' || key === 'history') return;
  var keys = db.load('keys');
  if (! db.contains(key)) {
    keys.push(key);
    localStorage.setItem('keys', JSON.stringify(keys));
  }
  localStorage.setItem(key, JSON.stringify(value));
};

db.remove = function (key) {
  var keys = db.load('keys');
  keys.splice(keys.indexOf(key), 1);
  localStorage.setItem('keys', JSON.stringify(keys));
  localStorage.removeItem(key);
};

db.clear = function () {
  localStorage.clear();
  db.init();
};

var toggleHidden = function (str) {
  $('#' + str + '-well').toggleClass('hidden');
};

var loadAllSearches = function () {
  var keys = db.load('keys');
  $('#input-upload').empty();
  $.each(keys, function (key, value) {   
    $('#input-upload').append($('<option>', {'value': value}).text(value)); 
  });
};

var setFormData = function (data) {
  $('#input-city').val(data.city);
  $('#input-category').val(data.categories);

  var arr = [];
  for (var i = 0; i < data.attributes.length; i++) {
    if (data.attributes[i] !== data.price)
      arr.push(data.attributes[i]);
  }
  $('#input-attr').val(arr);

  $('#input-price').val(data.price);
  $('#input-review-age').val(data.reviewage);
  $('#input-rating').slider('values', 0, data.minrating);
  $('#input-rating').slider('values', 1, data.maxrating);
};

var saveSearch = function () {
  var name = $('#input-save').val() || 'Untitled';
  db.save(name, getFormData());
  loadAllSearches();
};

var loadSearch = function () {
  var name = $('#input-upload').val();
  if (! name) return;
  var data = db.load(name);
  setFormData(data);
  getBusinessData();
};

var recentSearches = [];

var searchRecent = function (n) {
  setFormData(recentSearches[n].data);
  getBusinessData();
};

var updateHistory = function () {
  recentSearches.unshift({'timestamp': new Date().toLocaleString(), 'data': getFormData()});
  $('#history-well').empty();
  for (var i = 0; i < 10; i++) {
    if (! recentSearches[i]) return;
    $('#history-well').append('<p><a onclick="searchRecent(' + i + ')">' + recentSearches[i].timestamp + '</a></p>');
  }
};





/** INIT **/

$(document).ready(function() {

  db.init();
  loadAllSearches();

  initMap();
  populateFilters();
  
  initSlider();


  $('#search-btn').click(function() {
    showLoader();
    updateHistory();
    getBusinessData();
  });

});

