function lightsOn(n) {
  var lightBank = Array(n).fill(false);

  var getState = function getState(light) {
    return lightBank[light - 1];
  };

  var setState = function setState(light, val) {
    lightBank[light - 1] = val;
  };

  var toggle = function toggle(light) {
    setState(light, !getState(light));
  };

  var run = function run() {
    for (var round = 1; round <= n; round += 1) {
      for (var light = 1; light <= n; light += 1) {
        if (light % round === 0) {
          toggle(light);
        }
      }
    }
  };

  var on = function on() {
    var lights = [];

    for (var light = 1; light <= n; light += 1) {
      if (getState(light) === true) {
        lights.push(light);
      }
    }

    return lights;
  };

  run();
  return on();
}

console.log(lightsOn(100));
