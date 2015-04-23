var db = {};

db.load = function (key) {
  return JSON.parse(localStorage.getItem(key));
};

db.init = function () {
  var keys = [] || db.load('keys');
  localStorage.setItem('keys', JSON.stringify(keys));
};

db.save = function (key, value) {
  if (key === 'keys') return;
  var keys = db.load('keys');
  keys.push(key);
  localStorage.setItem('keys', JSON.stringify(keys));
  localStorage.setItem(key, JSON.stringify(value));
};

db.remove = function (key) {
  var keys = db.load('keys');
  keys.splice(keys.indexOf(key), 1);
  localStorage.setItem('keys', JSON.stringify(keys));
  localStorage.removeItem(key);
};

db.contains = function (key) {
  var keys = db.load('keys');
  for (var i = 0; i < keys.length; i++) {
    if (keys[i] === key) return true;
  }
  return false;
};

db.clear = function () {
  localStorage.clear();
  db.init();
};

