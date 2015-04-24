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

