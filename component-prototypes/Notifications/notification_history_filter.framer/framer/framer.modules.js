require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"DynamicLoader":[function(require,module,exports){

/*
DynamicLoader Module for FramerJS
https://github.com/LucienLee/framer-DynamicLoader/

Created by Lucien Lee (@luciendeer), Jan. 12th, 2016

DynamicLoader braeks the barriars between 3rd party web development libraries and Framer, which
help you load local, external stylesheets and scripts dynamically.

Add the following line to your project in Framer Studio.
	{DynamicLoader} = require 'DynamicLoader'

[Load one file]
DynamicLoader.add('script.js').then(->
 * when script.js loaded successfully
...
).catch(->
 * when script.js loaded failed
...
)

[Load file in series]
DynamicLoader.series(['one.js', 'two.css', ...]).then( successCallback, failCallback )

[Load file in parallel]
DynamicLoader.series(['one.js', 'two.css', ...]).then( successCallback, failCallback )
 */
exports.DynamicLoader = (function() {
  function DynamicLoader() {}

  DynamicLoader.add = function(url) {
    var promise;
    promise = new Promise(function(resolve, reject) {
      var file, loaded;
      if (url.substr(url.lastIndexOf('.')) === ".js") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('script'), function(element) {
          if (element.getAttribute('src') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('script');
        file.src = url;
      } else if (url.substr(url.lastIndexOf('.')) === ".css") {
        loaded = Array.prototype.find.call(document.getElementsByTagName('link'), function(element) {
          if (element.getAttribute('rel') === url) {
            return element;
          }
        });
        if (loaded !== void 0) {
          return resolve('have loaded');
        }
        file = document.createElement('link');
        file.rel = "stylesheet";
        file.href = url;
      }
      file.addEventListener('load', function() {
        return resolve(file);
      });
      file.addEventListener('error', function() {
        return reject(file);
      });
      return document.body.appendChild(file);
    });
    return promise;
  };

  DynamicLoader.series = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return urls.reduce((function(_this) {
      return function(promise, url) {
        return promise.then(function() {
          return _this.add(url);
        });
      };
    })(this), Promise.resolve());
  };

  DynamicLoader.parallel = function(urls) {
    if (!Array.isArray(urls) || urls.length === 0) {
      throw "ERROR: NO URL IN ARRAY!";
    }
    return Promise.all(urls.map((function(_this) {
      return function(url) {
        return _this.add(url);
      };
    })(this)));
  };

  return DynamicLoader;

})();


},{}],"input":[function(require,module,exports){
var _inputStyle, calculatePixelRatio, growthRatio, imageHeight,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

exports.keyboardLayer = new Layer({
  x: 0,
  y: Screen.height,
  width: Screen.width,
  height: 432,
  html: "<img style='width: 100%;' src='modules/keyboard.png'/>"
});

growthRatio = Screen.width / 732;

imageHeight = growthRatio * 432;

_inputStyle = Object.assign({}, Framer.LayerStyle, calculatePixelRatio = function(layer, value) {
  return (value * layer.context.pixelMultiplier) + "px";
}, {
  fontSize: function(layer) {
    return calculatePixelRatio(layer, layer._properties.fontSize);
  },
  lineHeight: function(layer) {
    return layer._properties.lineHeight + "em";
  },
  padding: function(layer) {
    var padding, paddingValue, paddingValues, pixelMultiplier;
    pixelMultiplier = layer.context.pixelMultiplier;
    padding = [];
    paddingValue = layer._properties.padding;
    if (Number.isInteger(paddingValue)) {
      return calculatePixelRatio(layer, paddingValue);
    }
    paddingValues = layer._properties.padding.split(" ");
    switch (paddingValues.length) {
      case 4:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[2]);
        padding.left = parseFloat(paddingValues[3]);
        break;
      case 3:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[2]);
        padding.left = parseFloat(paddingValues[1]);
        break;
      case 2:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[1]);
        padding.bottom = parseFloat(paddingValues[0]);
        padding.left = parseFloat(paddingValues[1]);
        break;
      default:
        padding.top = parseFloat(paddingValues[0]);
        padding.right = parseFloat(paddingValues[0]);
        padding.bottom = parseFloat(paddingValues[0]);
        padding.left = parseFloat(paddingValues[0]);
    }
    return (padding.top * pixelMultiplier) + "px " + (padding.right * pixelMultiplier) + "px " + (padding.bottom * pixelMultiplier) + "px " + (padding.left * pixelMultiplier) + "px";
  }
});

exports.keyboardLayer.states = {
  shown: {
    y: Screen.height - imageHeight
  }
};

exports.keyboardLayer.states.animationOptions = {
  curve: "spring(500,50,15)"
};

exports.Input = (function(superClass) {
  extend(Input, superClass);

  Input.define("style", {
    get: function() {
      return this.input.style;
    },
    set: function(value) {
      return _.extend(this.input.style, value);
    }
  });

  Input.define("value", {
    get: function() {
      return this.input.value;
    },
    set: function(value) {
      return this.input.value = value;
    }
  });

  function Input(options) {
    if (options == null) {
      options = {};
    }
    if (options.setup == null) {
      options.setup = false;
    }
    if (options.width == null) {
      options.width = Screen.width;
    }
    if (options.clip == null) {
      options.clip = false;
    }
    if (options.height == null) {
      options.height = 60;
    }
    if (options.backgroundColor == null) {
      options.backgroundColor = options.setup ? "rgba(255, 60, 47, .5)" : "transparent";
    }
    if (options.fontSize == null) {
      options.fontSize = 30;
    }
    if (options.lineHeight == null) {
      options.lineHeight = 1;
    }
    if (options.padding == null) {
      options.padding = 10;
    }
    if (options.text == null) {
      options.text = "";
    }
    if (options.placeholder == null) {
      options.placeholder = "";
    }
    if (options.virtualKeyboard == null) {
      options.virtualKeyboard = Utils.isMobile() ? false : true;
    }
    if (options.type == null) {
      options.type = "text";
    }
    if (options.goButton == null) {
      options.goButton = false;
    }
    if (options.autoCorrect == null) {
      options.autoCorrect = "on";
    }
    if (options.autoComplete == null) {
      options.autoComplete = "on";
    }
    if (options.autoCapitalize == null) {
      options.autoCapitalize = "on";
    }
    if (options.spellCheck == null) {
      options.spellCheck = "on";
    }
    if (options.autofocus == null) {
      options.autofocus = false;
    }
    if (options.textColor == null) {
      options.textColor = "#000";
    }
    if (options.fontFamily == null) {
      options.fontFamily = "-apple-system";
    }
    if (options.fontWeight == null) {
      options.fontWeight = "500";
    }
    Input.__super__.constructor.call(this, options);
    this._properties.fontSize = options.fontSize;
    this._properties.lineHeight = options.lineHeight;
    this._properties.padding = options.padding;
    if (options.placeholderColor != null) {
      this.placeholderColor = options.placeholderColor;
    }
    this.input = document.createElement("input");
    this.input.id = "input-" + (_.now());
    this.input.style.width = _inputStyle["width"](this);
    this.input.style.height = _inputStyle["height"](this);
    this.input.style.fontSize = _inputStyle["fontSize"](this);
    this.input.style.lineHeight = _inputStyle["lineHeight"](this);
    this.input.style.outline = "none";
    this.input.style.border = "none";
    this.input.style.backgroundColor = options.backgroundColor;
    this.input.style.padding = _inputStyle["padding"](this);
    this.input.style.fontFamily = options.fontFamily;
    this.input.style.color = options.textColor;
    this.input.style.fontWeight = options.fontWeight;
    this.input.value = options.text;
    this.input.type = options.type;
    this.input.placeholder = options.placeholder;
    this.input.setAttribute("autocorrect", options.autoCorrect);
    this.input.setAttribute("autocomplete", options.autoComplete);
    this.input.setAttribute("autocapitalize", options.autoCapitalize);
    if (options.autofocus === true) {
      this.input.setAttribute("autofocus", true);
    }
    this.input.setAttribute("spellcheck", options.spellCheck);
    this.form = document.createElement("form");
    if (options.goButton) {
      this.form.action = "#";
      this.form.addEventListener("submit", function(event) {
        return event.preventDefault();
      });
    }
    this.form.appendChild(this.input);
    this._element.appendChild(this.form);
    this.backgroundColor = "transparent";
    if (this.placeholderColor) {
      this.updatePlaceholderColor(options.placeholderColor);
    }
    if (!Utils.isMobile() && options.virtualKeyboard === true) {
      this.input.addEventListener("focus", function() {
        exports.keyboardLayer.bringToFront();
        return exports.keyboardLayer.stateCycle();
      });
      this.input.addEventListener("blur", function() {
        return exports.keyboardLayer.animate("default");
      });
    }
  }

  Input.prototype.updatePlaceholderColor = function(color) {
    var css;
    this.placeholderColor = color;
    if (this.pageStyle != null) {
      document.head.removeChild(this.pageStyle);
    }
    this.pageStyle = document.createElement("style");
    this.pageStyle.type = "text/css";
    css = "#" + this.input.id + "::-webkit-input-placeholder { color: " + this.placeholderColor + "; }";
    this.pageStyle.appendChild(document.createTextNode(css));
    return document.head.appendChild(this.pageStyle);
  };

  Input.prototype.focus = function() {
    return this.input.focus();
  };

  Input.prototype.onFocus = function(cb) {
    return this.input.addEventListener("focus", function() {
      return cb.apply(this);
    });
  };

  Input.prototype.onBlur = function(cb) {
    return this.input.addEventListener("blur", function() {
      return cb.apply(this);
    });
  };

  return Input;

})(Layer);


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}],"productionData":[function(require,module,exports){
exports.data = [
  {
    "data": [300, 500, 650, 450, 575, 450, 375, 300, 500, 650, 450, 675, 800, 650, 400, 500, 650, 450, 675, 750, 550, 370, 475, 650, 450, 675, 550, 450, 350, 275],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }, {
    "data": [350, 550, 620, 480, 550, 480, 400, 350, 450, 610, 480, 650, 750, 670, 480, 470, 610, 480, 615, 710, 580, 400, 510, 610, 410, 650, 580, 410, 370, 320],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }, {
    "data": [3500, 4500, 6250, 5700, 4750, 8000, 6000, 4000, 5500, 6500, 6000, 4000, 8250, 6750, 5000, 5500, 6000, 4000, 5500, 7500, 5150, 6000, 4250, 5750, 8000, 7100, 6000, 4000, 5000, 6000],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [3000, 4400, 6000, 5100, 4750, 7000, 6000, 4500, 5100, 6100, 5000, 4500, 7750, 6350, 5200, 5900, 6300, 4700, 5200, 7000, 5750, 6300, 4750, 6100, 7000, 7500, 6500, 5000, 5500, 5500],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [7500, 6500, 5250, 4700, 2750, 3000, 5000, 6600, 7500, 6100, 5200, 4000, 6250, 7750, 5600, 4500, 3000, 4000, 5500, 6500, 7150, 8200, 6750, 5750, 3000, 4700, 6000, 7800, 5000, 3300],
    "unit": "bbl/d",
    "type": "Water"
  }, {
    "data": [7000, 6100, 5550, 5100, 3250, 3600, 4700, 6100, 7100, 6500, 5600, 4500, 5750, 7150, 6000, 4800, 3600, 4500, 5900, 6900, 7050, 7750, 7000, 6000, 3900, 4900, 6300, 7000, 6000, 4000],
    "unit": "bbl/d",
    "type": "Water"
  }
];


},{}],"timeseriesData":[function(require,module,exports){
exports.data = [
  {
    "data": [33425, 26552, 34041, 25844, 31401, 33571, 27369, 28394, 25473, 32902, 28764, 30433, 27415, 29135, 26118, 32326, 29127, 28896, 32221, 27131, 34313, 26888, 34393, 26961, 29073, 29505, 32791, 31568, 26608, 25354, 30842, 30174, 29331, 26032, 30087, 27330, 31008, 33720, 33357, 29530, 31338, 32655, 33645, 25550, 34575, 25771, 34547, 34726, 30266, 33460, 25969, 27851, 27868, 30675, 26883, 29957, 27726, 27569, 29138, 28290, 26877, 31148, 32282, 32394, 29866, 34591, 26771, 30848, 25085, 27368, 29877, 27596, 29727, 34735, 29620, 31390, 28757, 27717, 28046, 26245, 29459, 34225, 26359, 25291, 26631, 31254, 31216, 33848, 28494, 33285, 25889, 28227, 25849, 27124, 30764, 28751, 28574, 31346, 26430, 31054],
    "unit": "bbl/d",
    "type": "Oil"
  }, {
    "data": [42587, 48324, 41729, 42301, 31295, 41138, 36059, 38589, 36507, 32482, 40699, 34362, 47459, 43069, 49296, 36726, 46668, 33550, 38420, 34183, 34835, 40442, 42310, 31348, 45453, 39357, 37783, 41185, 33808, 42268, 34511, 46133, 42554, 43680, 42884, 33647, 34227, 49183, 40642, 46019, 35385, 33851, 36042, 49626, 39066, 43296, 46977, 35850, 40683, 35309, 41073, 34932, 35094, 34935, 37345, 41600, 30693, 30691, 36782, 40669, 40964, 35394, 49807, 39397, 37445, 45113, 35222, 37646, 34559, 36762, 43178, 46855, 36817, 39451, 31192, 42054, 35046, 31604, 38791, 34485, 45939, 40117, 47111, 44030, 34071, 42881, 41814, 49567, 41132, 32784, 43268, 38066, 31601, 48416, 32240, 35095, 41379, 45549, 43762, 44430],
    "unit": "cu.ft/dl",
    "type": "Water"
  }, {
    "data": [76769, 83514, 83588, 81602, 87607, 72630, 72376, 75964, 73537, 70142, 78656, 83164, 85557, 84471, 82919, 82467, 84566, 71442, 71097, 89310, 88078, 82608, 78838, 78003, 79131, 87768, 77026, 87078, 75422, 73787, 85169, 87163, 89962, 87149, 77659, 71150, 78972, 73404, 72764, 77289, 84119, 77678, 80097, 81337, 85151, 87428, 73420, 74468, 71555, 70066, 80163, 79189, 86508, 71328, 71489, 88588, 77397, 88512, 72692, 81338, 74807, 83099, 80105, 75325, 77245, 84810, 76152, 72237, 89349, 77216, 79500, 88306, 84033, 82026, 71326, 74629, 81405, 74076, 72216, 75727, 89926, 81812, 87511, 89468, 71160, 81210, 71210, 77386, 73474, 88000, 74451, 70704, 84475, 83244, 70792, 78009, 73824, 82179, 71615, 87948],
    "unit": "cu.ft/dl",
    "type": "Gas"
  }
];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL3hpYW94aXpoZW5nL0RvY3VtZW50cy9jb21wb25lbnQtcHJvdG90eXBlcy9Ob3RpZmljYXRpb25zL25vdGlmaWNhdGlvbl9oaXN0b3J5X2ZpbHRlci5mcmFtZXIvbW9kdWxlcy90aW1lc2VyaWVzRGF0YS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy94aWFveGl6aGVuZy9Eb2N1bWVudHMvY29tcG9uZW50LXByb3RvdHlwZXMvTm90aWZpY2F0aW9ucy9ub3RpZmljYXRpb25faGlzdG9yeV9maWx0ZXIuZnJhbWVyL21vZHVsZXMvcHJvZHVjdGlvbkRhdGEuY29mZmVlIiwiLi4vLi4vLi4vLi4vLi4vVXNlcnMveGlhb3hpemhlbmcvRG9jdW1lbnRzL2NvbXBvbmVudC1wcm90b3R5cGVzL05vdGlmaWNhdGlvbnMvbm90aWZpY2F0aW9uX2hpc3RvcnlfZmlsdGVyLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL3hpYW94aXpoZW5nL0RvY3VtZW50cy9jb21wb25lbnQtcHJvdG90eXBlcy9Ob3RpZmljYXRpb25zL25vdGlmaWNhdGlvbl9oaXN0b3J5X2ZpbHRlci5mcmFtZXIvbW9kdWxlcy9pbnB1dC5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy94aWFveGl6aGVuZy9Eb2N1bWVudHMvY29tcG9uZW50LXByb3RvdHlwZXMvTm90aWZpY2F0aW9ucy9ub3RpZmljYXRpb25faGlzdG9yeV9maWx0ZXIuZnJhbWVyL21vZHVsZXMvRHluYW1pY0xvYWRlci5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbImV4cG9ydHMuZGF0YSA9IFtcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbMzM0MjUsMjY1NTIsMzQwNDEsMjU4NDQsMzE0MDEsMzM1NzEsMjczNjksMjgzOTQsMjU0NzMsMzI5MDIsMjg3NjQsMzA0MzMsMjc0MTUsMjkxMzUsMjYxMTgsMzIzMjYsMjkxMjcsMjg4OTYsMzIyMjEsMjcxMzEsMzQzMTMsMjY4ODgsMzQzOTMsMjY5NjEsMjkwNzMsMjk1MDUsMzI3OTEsMzE1NjgsMjY2MDgsMjUzNTQsMzA4NDIsMzAxNzQsMjkzMzEsMjYwMzIsMzAwODcsMjczMzAsMzEwMDgsMzM3MjAsMzMzNTcsMjk1MzAsMzEzMzgsMzI2NTUsMzM2NDUsMjU1NTAsMzQ1NzUsMjU3NzEsMzQ1NDcsMzQ3MjYsMzAyNjYsMzM0NjAsMjU5NjksMjc4NTEsMjc4NjgsMzA2NzUsMjY4ODMsMjk5NTcsMjc3MjYsMjc1NjksMjkxMzgsMjgyOTAsMjY4NzcsMzExNDgsMzIyODIsMzIzOTQsMjk4NjYsMzQ1OTEsMjY3NzEsMzA4NDgsMjUwODUsMjczNjgsMjk4NzcsMjc1OTYsMjk3MjcsMzQ3MzUsMjk2MjAsMzEzOTAsMjg3NTcsMjc3MTcsMjgwNDYsMjYyNDUsMjk0NTksMzQyMjUsMjYzNTksMjUyOTEsMjY2MzEsMzEyNTQsMzEyMTYsMzM4NDgsMjg0OTQsMzMyODUsMjU4ODksMjgyMjcsMjU4NDksMjcxMjQsMzA3NjQsMjg3NTEsMjg1NzQsMzEzNDYsMjY0MzAsMzEwNTRdLFxuICAgICAgICBcInVuaXRcIjogXCJiYmwvZFwiLFxuICAgICAgICBcInR5cGVcIjogXCJPaWxcIlxuICAgIH0sXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzQyNTg3LDQ4MzI0LDQxNzI5LDQyMzAxLDMxMjk1LDQxMTM4LDM2MDU5LDM4NTg5LDM2NTA3LDMyNDgyLDQwNjk5LDM0MzYyLDQ3NDU5LDQzMDY5LDQ5Mjk2LDM2NzI2LDQ2NjY4LDMzNTUwLDM4NDIwLDM0MTgzLDM0ODM1LDQwNDQyLDQyMzEwLDMxMzQ4LDQ1NDUzLDM5MzU3LDM3NzgzLDQxMTg1LDMzODA4LDQyMjY4LDM0NTExLDQ2MTMzLDQyNTU0LDQzNjgwLDQyODg0LDMzNjQ3LDM0MjI3LDQ5MTgzLDQwNjQyLDQ2MDE5LDM1Mzg1LDMzODUxLDM2MDQyLDQ5NjI2LDM5MDY2LDQzMjk2LDQ2OTc3LDM1ODUwLDQwNjgzLDM1MzA5LDQxMDczLDM0OTMyLDM1MDk0LDM0OTM1LDM3MzQ1LDQxNjAwLDMwNjkzLDMwNjkxLDM2NzgyLDQwNjY5LDQwOTY0LDM1Mzk0LDQ5ODA3LDM5Mzk3LDM3NDQ1LDQ1MTEzLDM1MjIyLDM3NjQ2LDM0NTU5LDM2NzYyLDQzMTc4LDQ2ODU1LDM2ODE3LDM5NDUxLDMxMTkyLDQyMDU0LDM1MDQ2LDMxNjA0LDM4NzkxLDM0NDg1LDQ1OTM5LDQwMTE3LDQ3MTExLDQ0MDMwLDM0MDcxLDQyODgxLDQxODE0LDQ5NTY3LDQxMTMyLDMyNzg0LDQzMjY4LDM4MDY2LDMxNjAxLDQ4NDE2LDMyMjQwLDM1MDk1LDQxMzc5LDQ1NTQ5LDQzNzYyLDQ0NDMwXSxcbiAgICAgICAgXCJ1bml0XCI6IFwiY3UuZnQvZGxcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiV2F0ZXJcIlxuICAgIH0sXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzc2NzY5LDgzNTE0LDgzNTg4LDgxNjAyLDg3NjA3LDcyNjMwLDcyMzc2LDc1OTY0LDczNTM3LDcwMTQyLDc4NjU2LDgzMTY0LDg1NTU3LDg0NDcxLDgyOTE5LDgyNDY3LDg0NTY2LDcxNDQyLDcxMDk3LDg5MzEwLDg4MDc4LDgyNjA4LDc4ODM4LDc4MDAzLDc5MTMxLDg3NzY4LDc3MDI2LDg3MDc4LDc1NDIyLDczNzg3LDg1MTY5LDg3MTYzLDg5OTYyLDg3MTQ5LDc3NjU5LDcxMTUwLDc4OTcyLDczNDA0LDcyNzY0LDc3Mjg5LDg0MTE5LDc3Njc4LDgwMDk3LDgxMzM3LDg1MTUxLDg3NDI4LDczNDIwLDc0NDY4LDcxNTU1LDcwMDY2LDgwMTYzLDc5MTg5LDg2NTA4LDcxMzI4LDcxNDg5LDg4NTg4LDc3Mzk3LDg4NTEyLDcyNjkyLDgxMzM4LDc0ODA3LDgzMDk5LDgwMTA1LDc1MzI1LDc3MjQ1LDg0ODEwLDc2MTUyLDcyMjM3LDg5MzQ5LDc3MjE2LDc5NTAwLDg4MzA2LDg0MDMzLDgyMDI2LDcxMzI2LDc0NjI5LDgxNDA1LDc0MDc2LDcyMjE2LDc1NzI3LDg5OTI2LDgxODEyLDg3NTExLDg5NDY4LDcxMTYwLDgxMjEwLDcxMjEwLDc3Mzg2LDczNDc0LDg4MDAwLDc0NDUxLDcwNzA0LDg0NDc1LDgzMjQ0LDcwNzkyLDc4MDA5LDczODI0LDgyMTc5LDcxNjE1LDg3OTQ4XSxcbiAgICAgICAgXCJ1bml0XCI6IFwiY3UuZnQvZGxcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiR2FzXCJcbiAgICB9XG5dXG4iLCJleHBvcnRzLmRhdGEgPSBbXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzMwMCw1MDAsNjUwLDQ1MCw1NzUsNDUwLDM3NSwzMDAsNTAwLDY1MCw0NTAsNjc1LDgwMCw2NTAsNDAwLDUwMCw2NTAsNDUwLDY3NSw3NTAsNTUwLDM3MCw0NzUsNjUwLDQ1MCw2NzUsNTUwLDQ1MCwzNTAsMjc1XSxcbiAgICAgICAgXCJ1bml0XCI6IFwiY3UuZnQvZGxcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiR2FzXCIsXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbMzUwLDU1MCw2MjAsNDgwLDU1MCw0ODAsNDAwLDM1MCw0NTAsNjEwLDQ4MCw2NTAsNzUwLDY3MCw0ODAsNDcwLDYxMCw0ODAsNjE1LDcxMCw1ODAsNDAwLDUxMCw2MTAsNDEwLDY1MCw1ODAsNDEwLDM3MCwzMjBdLFxuICAgICAgICBcInVuaXRcIjogXCJjdS5mdC9kbFwiLFxuICAgICAgICBcInR5cGVcIjogXCJHYXNcIixcbiAgICB9LFxuICAgIHtcbiAgICAgICAgXCJkYXRhXCI6IFszNTAwLDQ1MDAsNjI1MCw1NzAwLDQ3NTAsODAwMCw2MDAwLDQwMDAsNTUwMCw2NTAwLDYwMDAsNDAwMCw4MjUwLDY3NTAsNTAwMCw1NTAwLDYwMDAsNDAwMCw1NTAwLDc1MDAsNTE1MCw2MDAwLDQyNTAsNTc1MCw4MDAwLDcxMDAsNjAwMCw0MDAwLDUwMDAsNjAwMF0sXG4gICAgICAgIFwidW5pdFwiOiBcImJibC9kXCIsXG4gICAgICAgIFwidHlwZVwiOiBcIk9pbFwiLFxuICAgIH0sXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzMwMDAsNDQwMCw2MDAwLDUxMDAsNDc1MCw3MDAwLDYwMDAsNDUwMCw1MTAwLDYxMDAsNTAwMCw0NTAwLDc3NTAsNjM1MCw1MjAwLDU5MDAsNjMwMCw0NzAwLDUyMDAsNzAwMCw1NzUwLDYzMDAsNDc1MCw2MTAwLDcwMDAsNzUwMCw2NTAwLDUwMDAsNTUwMCw1NTAwXSxcbiAgICAgICAgXCJ1bml0XCI6IFwiYmJsL2RcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiT2lsXCIsXG4gICAgfSxcbiAgICB7XG4gICAgICAgIFwiZGF0YVwiOiBbNzUwMCw2NTAwLDUyNTAsNDcwMCwyNzUwLDMwMDAsNTAwMCw2NjAwLDc1MDAsNjEwMCw1MjAwLDQwMDAsNjI1MCw3NzUwLDU2MDAsNDUwMCwzMDAwLDQwMDAsNTUwMCw2NTAwLDcxNTAsODIwMCw2NzUwLDU3NTAsMzAwMCw0NzAwLDYwMDAsNzgwMCw1MDAwLDMzMDBdLFxuICAgICAgICBcInVuaXRcIjogXCJiYmwvZFwiLFxuICAgICAgICBcInR5cGVcIjogXCJXYXRlclwiLFxuICAgIH0sXG4gICAge1xuICAgICAgICBcImRhdGFcIjogWzcwMDAsNjEwMCw1NTUwLDUxMDAsMzI1MCwzNjAwLDQ3MDAsNjEwMCw3MTAwLDY1MDAsNTYwMCw0NTAwLDU3NTAsNzE1MCw2MDAwLDQ4MDAsMzYwMCw0NTAwLDU5MDAsNjkwMCw3MDUwLDc3NTAsNzAwMCw2MDAwLDM5MDAsNDkwMCw2MzAwLDcwMDAsNjAwMCw0MDAwXSxcbiAgICAgICAgXCJ1bml0XCI6IFwiYmJsL2RcIixcbiAgICAgICAgXCJ0eXBlXCI6IFwiV2F0ZXJcIixcbiAgICB9XG5dXG4iLCIjIEFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uIFxuIyBteU1vZHVsZSA9IHJlcXVpcmUgXCJteU1vZHVsZVwiXG4jIFJlZmVyZW5jZSB0aGUgY29udGVudHMgYnkgbmFtZSwgbGlrZSBteU1vZHVsZS5teUZ1bmN0aW9uKCkgb3IgbXlNb2R1bGUubXlWYXJcblxuZXhwb3J0cy5teVZhciA9IFwibXlWYXJpYWJsZVwiXG5cbmV4cG9ydHMubXlGdW5jdGlvbiA9IC0+XG5cdHByaW50IFwibXlGdW5jdGlvbiBpcyBydW5uaW5nXCJcblxuZXhwb3J0cy5teUFycmF5ID0gWzEsIDIsIDNdIiwiZXhwb3J0cy5rZXlib2FyZExheWVyID0gbmV3IExheWVyXG5cdHg6MCwgeTpTY3JlZW4uaGVpZ2h0LCB3aWR0aDpTY3JlZW4ud2lkdGgsIGhlaWdodDo0MzJcblx0aHRtbDpcIjxpbWcgc3R5bGU9J3dpZHRoOiAxMDAlOycgc3JjPSdtb2R1bGVzL2tleWJvYXJkLnBuZycvPlwiXG5cbiNzY3JlZW4gd2lkdGggdnMuIHNpemUgb2YgaW1hZ2Ugd2lkdGhcbmdyb3d0aFJhdGlvID0gU2NyZWVuLndpZHRoIC8gNzMyXG5pbWFnZUhlaWdodCA9IGdyb3d0aFJhdGlvICogNDMyXG5cbiMgRXh0ZW5kcyB0aGUgTGF5ZXJTdHlsZSBjbGFzcyB3aGljaCBkb2VzIHRoZSBwaXhlbCByYXRpbyBjYWxjdWxhdGlvbnMgaW4gZnJhbWVyXG5faW5wdXRTdHlsZSA9XG5cdE9iamVjdC5hc3NpZ24oe30sIEZyYW1lci5MYXllclN0eWxlLFxuXHRcdGNhbGN1bGF0ZVBpeGVsUmF0aW8gPSAobGF5ZXIsIHZhbHVlKSAtPlxuXHRcdFx0KHZhbHVlICogbGF5ZXIuY29udGV4dC5waXhlbE11bHRpcGxpZXIpICsgXCJweFwiXG5cblx0XHRmb250U2l6ZTogKGxheWVyKSAtPlxuXHRcdFx0Y2FsY3VsYXRlUGl4ZWxSYXRpbyhsYXllciwgbGF5ZXIuX3Byb3BlcnRpZXMuZm9udFNpemUpXG5cblx0XHRsaW5lSGVpZ2h0OiAobGF5ZXIpIC0+XG5cdFx0XHQobGF5ZXIuX3Byb3BlcnRpZXMubGluZUhlaWdodCkgKyBcImVtXCJcblxuXHRcdHBhZGRpbmc6IChsYXllcikgLT5cblx0XHRcdHsgcGl4ZWxNdWx0aXBsaWVyIH0gPSBsYXllci5jb250ZXh0XG5cdFx0XHRwYWRkaW5nID0gW11cblx0XHRcdHBhZGRpbmdWYWx1ZSA9IGxheWVyLl9wcm9wZXJ0aWVzLnBhZGRpbmdcblxuXHRcdFx0IyBDaGVjayBpZiB3ZSBoYXZlIGEgc2luZ2xlIG51bWJlciBhcyBpbnRlZ2VyXG5cdFx0XHRpZiBOdW1iZXIuaXNJbnRlZ2VyKHBhZGRpbmdWYWx1ZSlcblx0XHRcdFx0cmV0dXJuIGNhbGN1bGF0ZVBpeGVsUmF0aW8obGF5ZXIsIHBhZGRpbmdWYWx1ZSlcblxuXHRcdFx0IyBJZiB3ZSBoYXZlIG11bHRpcGxlIHZhbHVlcyB0aGV5IGNvbWUgYXMgc3RyaW5nIChlLmcuIFwiMSAyIDMgNFwiKVxuXHRcdFx0cGFkZGluZ1ZhbHVlcyA9IGxheWVyLl9wcm9wZXJ0aWVzLnBhZGRpbmcuc3BsaXQoXCIgXCIpXG5cblx0XHRcdHN3aXRjaCBwYWRkaW5nVmFsdWVzLmxlbmd0aFxuXHRcdFx0XHR3aGVuIDRcblx0XHRcdFx0XHRwYWRkaW5nLnRvcCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLnJpZ2h0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzFdKVxuXHRcdFx0XHRcdHBhZGRpbmcuYm90dG9tID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzJdKVxuXHRcdFx0XHRcdHBhZGRpbmcubGVmdCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1szXSlcblxuXHRcdFx0XHR3aGVuIDNcblx0XHRcdFx0XHRwYWRkaW5nLnRvcCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLnJpZ2h0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzFdKVxuXHRcdFx0XHRcdHBhZGRpbmcuYm90dG9tID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzJdKVxuXHRcdFx0XHRcdHBhZGRpbmcubGVmdCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1sxXSlcblxuXHRcdFx0XHR3aGVuIDJcblx0XHRcdFx0XHRwYWRkaW5nLnRvcCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLnJpZ2h0ID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzFdKVxuXHRcdFx0XHRcdHBhZGRpbmcuYm90dG9tID0gcGFyc2VGbG9hdChwYWRkaW5nVmFsdWVzWzBdKVxuXHRcdFx0XHRcdHBhZGRpbmcubGVmdCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1sxXSlcblxuXHRcdFx0XHRlbHNlXG5cdFx0XHRcdFx0cGFkZGluZy50b3AgPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMF0pXG5cdFx0XHRcdFx0cGFkZGluZy5yaWdodCA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLmJvdHRvbSA9IHBhcnNlRmxvYXQocGFkZGluZ1ZhbHVlc1swXSlcblx0XHRcdFx0XHRwYWRkaW5nLmxlZnQgPSBwYXJzZUZsb2F0KHBhZGRpbmdWYWx1ZXNbMF0pXG5cblx0XHRcdCMgUmV0dXJuIGFzIDQtdmFsdWUgc3RyaW5nIChlLmcgXCIxcHggMnB4IDNweCA0cHhcIilcblx0XHRcdFwiI3twYWRkaW5nLnRvcCAqIHBpeGVsTXVsdGlwbGllcn1weCAje3BhZGRpbmcucmlnaHQgKiBwaXhlbE11bHRpcGxpZXJ9cHggI3twYWRkaW5nLmJvdHRvbSAqIHBpeGVsTXVsdGlwbGllcn1weCAje3BhZGRpbmcubGVmdCAqIHBpeGVsTXVsdGlwbGllcn1weFwiXG5cdClcblxuZXhwb3J0cy5rZXlib2FyZExheWVyLnN0YXRlcyA9XG5cdHNob3duOlxuXHRcdHk6IFNjcmVlbi5oZWlnaHQgLSBpbWFnZUhlaWdodFxuXG5leHBvcnRzLmtleWJvYXJkTGF5ZXIuc3RhdGVzLmFuaW1hdGlvbk9wdGlvbnMgPVxuXHRjdXJ2ZTogXCJzcHJpbmcoNTAwLDUwLDE1KVwiXG5cbmNsYXNzIGV4cG9ydHMuSW5wdXQgZXh0ZW5kcyBMYXllclxuXHRAZGVmaW5lIFwic3R5bGVcIixcblx0XHRnZXQ6IC0+IEBpbnB1dC5zdHlsZVxuXHRcdHNldDogKHZhbHVlKSAtPlxuXHRcdFx0Xy5leHRlbmQgQGlucHV0LnN0eWxlLCB2YWx1ZVxuXG5cdEBkZWZpbmUgXCJ2YWx1ZVwiLFxuXHRcdGdldDogLT4gQGlucHV0LnZhbHVlXG5cdFx0c2V0OiAodmFsdWUpIC0+XG5cdFx0XHRAaW5wdXQudmFsdWUgPSB2YWx1ZVxuXG5cdGNvbnN0cnVjdG9yOiAob3B0aW9ucyA9IHt9KSAtPlxuXHRcdG9wdGlvbnMuc2V0dXAgPz0gZmFsc2Vcblx0XHRvcHRpb25zLndpZHRoID89IFNjcmVlbi53aWR0aFxuXHRcdG9wdGlvbnMuY2xpcCA/PSBmYWxzZVxuXHRcdG9wdGlvbnMuaGVpZ2h0ID89IDYwXG5cdFx0b3B0aW9ucy5iYWNrZ3JvdW5kQ29sb3IgPz0gaWYgb3B0aW9ucy5zZXR1cCB0aGVuIFwicmdiYSgyNTUsIDYwLCA0NywgLjUpXCIgZWxzZSBcInRyYW5zcGFyZW50XCJcblx0XHRvcHRpb25zLmZvbnRTaXplID89IDMwXG5cdFx0b3B0aW9ucy5saW5lSGVpZ2h0ID89IDFcblx0XHRvcHRpb25zLnBhZGRpbmcgPz0gMTBcblx0XHRvcHRpb25zLnRleHQgPz0gXCJcIlxuXHRcdG9wdGlvbnMucGxhY2Vob2xkZXIgPz0gXCJcIlxuXHRcdG9wdGlvbnMudmlydHVhbEtleWJvYXJkID89IGlmIFV0aWxzLmlzTW9iaWxlKCkgdGhlbiBmYWxzZSBlbHNlIHRydWVcblx0XHRvcHRpb25zLnR5cGUgPz0gXCJ0ZXh0XCJcblx0XHRvcHRpb25zLmdvQnV0dG9uID89IGZhbHNlXG5cdFx0b3B0aW9ucy5hdXRvQ29ycmVjdCA/PSBcIm9uXCJcblx0XHRvcHRpb25zLmF1dG9Db21wbGV0ZSA/PSBcIm9uXCJcblx0XHRvcHRpb25zLmF1dG9DYXBpdGFsaXplID89IFwib25cIlxuXHRcdG9wdGlvbnMuc3BlbGxDaGVjayA/PSBcIm9uXCJcblx0XHRvcHRpb25zLmF1dG9mb2N1cyA/PSBmYWxzZVxuXHRcdG9wdGlvbnMudGV4dENvbG9yID89IFwiIzAwMFwiXG5cdFx0b3B0aW9ucy5mb250RmFtaWx5ID89IFwiLWFwcGxlLXN5c3RlbVwiXG5cdFx0b3B0aW9ucy5mb250V2VpZ2h0ID89IFwiNTAwXCJcblxuXHRcdHN1cGVyIG9wdGlvbnNcblxuXHRcdCMgQWRkIGFkZGl0aW9uYWwgcHJvcGVydGllc1xuXHRcdEBfcHJvcGVydGllcy5mb250U2l6ZSA9IG9wdGlvbnMuZm9udFNpemVcblx0XHRAX3Byb3BlcnRpZXMubGluZUhlaWdodCA9IG9wdGlvbnMubGluZUhlaWdodFxuXHRcdEBfcHJvcGVydGllcy5wYWRkaW5nID0gb3B0aW9ucy5wYWRkaW5nXG5cblx0XHRAcGxhY2Vob2xkZXJDb2xvciA9IG9wdGlvbnMucGxhY2Vob2xkZXJDb2xvciBpZiBvcHRpb25zLnBsYWNlaG9sZGVyQ29sb3I/XG5cdFx0QGlucHV0ID0gZG9jdW1lbnQuY3JlYXRlRWxlbWVudCBcImlucHV0XCJcblx0XHRAaW5wdXQuaWQgPSBcImlucHV0LSN7Xy5ub3coKX1cIlxuXG5cdFx0IyBBZGQgc3R5bGluZyB0byB0aGUgaW5wdXQgZWxlbWVudFxuXHRcdEBpbnB1dC5zdHlsZS53aWR0aCA9IF9pbnB1dFN0eWxlW1wid2lkdGhcIl0oQClcblx0XHRAaW5wdXQuc3R5bGUuaGVpZ2h0ID0gX2lucHV0U3R5bGVbXCJoZWlnaHRcIl0oQClcblx0XHRAaW5wdXQuc3R5bGUuZm9udFNpemUgPSBfaW5wdXRTdHlsZVtcImZvbnRTaXplXCJdKEApXG5cdFx0QGlucHV0LnN0eWxlLmxpbmVIZWlnaHQgPSBfaW5wdXRTdHlsZVtcImxpbmVIZWlnaHRcIl0oQClcblx0XHRAaW5wdXQuc3R5bGUub3V0bGluZSA9IFwibm9uZVwiXG5cdFx0QGlucHV0LnN0eWxlLmJvcmRlciA9IFwibm9uZVwiXG5cdFx0QGlucHV0LnN0eWxlLmJhY2tncm91bmRDb2xvciA9IG9wdGlvbnMuYmFja2dyb3VuZENvbG9yXG5cdFx0QGlucHV0LnN0eWxlLnBhZGRpbmcgPSBfaW5wdXRTdHlsZVtcInBhZGRpbmdcIl0oQClcblx0XHRAaW5wdXQuc3R5bGUuZm9udEZhbWlseSA9IG9wdGlvbnMuZm9udEZhbWlseVxuXHRcdEBpbnB1dC5zdHlsZS5jb2xvciA9IG9wdGlvbnMudGV4dENvbG9yXG5cdFx0QGlucHV0LnN0eWxlLmZvbnRXZWlnaHQgPSBvcHRpb25zLmZvbnRXZWlnaHRcblxuXHRcdEBpbnB1dC52YWx1ZSA9IG9wdGlvbnMudGV4dFxuXHRcdEBpbnB1dC50eXBlID0gb3B0aW9ucy50eXBlXG5cdFx0QGlucHV0LnBsYWNlaG9sZGVyID0gb3B0aW9ucy5wbGFjZWhvbGRlclxuXHRcdEBpbnB1dC5zZXRBdHRyaWJ1dGUgXCJhdXRvY29ycmVjdFwiLCBvcHRpb25zLmF1dG9Db3JyZWN0XG5cdFx0QGlucHV0LnNldEF0dHJpYnV0ZSBcImF1dG9jb21wbGV0ZVwiLCBvcHRpb25zLmF1dG9Db21wbGV0ZVxuXHRcdEBpbnB1dC5zZXRBdHRyaWJ1dGUgXCJhdXRvY2FwaXRhbGl6ZVwiLCBvcHRpb25zLmF1dG9DYXBpdGFsaXplXG5cdFx0aWYgb3B0aW9ucy5hdXRvZm9jdXMgPT0gdHJ1ZVxuXHRcdFx0QGlucHV0LnNldEF0dHJpYnV0ZSBcImF1dG9mb2N1c1wiLCB0cnVlXG5cdFx0QGlucHV0LnNldEF0dHJpYnV0ZSBcInNwZWxsY2hlY2tcIiwgb3B0aW9ucy5zcGVsbENoZWNrXG5cdFx0QGZvcm0gPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50IFwiZm9ybVwiXG5cblx0XHRpZiBvcHRpb25zLmdvQnV0dG9uXG5cdFx0XHRAZm9ybS5hY3Rpb24gPSBcIiNcIlxuXHRcdFx0QGZvcm0uYWRkRXZlbnRMaXN0ZW5lciBcInN1Ym1pdFwiLCAoZXZlbnQpIC0+XG5cdFx0XHRcdGV2ZW50LnByZXZlbnREZWZhdWx0KClcblxuXHRcdEBmb3JtLmFwcGVuZENoaWxkIEBpbnB1dFxuXHRcdEBfZWxlbWVudC5hcHBlbmRDaGlsZCBAZm9ybVxuXG5cdFx0QGJhY2tncm91bmRDb2xvciA9IFwidHJhbnNwYXJlbnRcIlxuXHRcdEB1cGRhdGVQbGFjZWhvbGRlckNvbG9yIG9wdGlvbnMucGxhY2Vob2xkZXJDb2xvciBpZiBAcGxhY2Vob2xkZXJDb2xvclxuXG5cdFx0I29ubHkgc2hvdyBob25vciB2aXJ0dWFsIGtleWJvYXJkIG9wdGlvbiB3aGVuIG5vdCBvbiBtb2JpbGUsXG5cdFx0I290aGVyd2lzZSBpZ25vcmVcblx0XHRpZiAhVXRpbHMuaXNNb2JpbGUoKSAmJiBvcHRpb25zLnZpcnR1YWxLZXlib2FyZCBpcyB0cnVlXG5cdFx0XHRAaW5wdXQuYWRkRXZlbnRMaXN0ZW5lciBcImZvY3VzXCIsIC0+XG5cdFx0XHRcdGV4cG9ydHMua2V5Ym9hcmRMYXllci5icmluZ1RvRnJvbnQoKVxuXHRcdFx0XHRleHBvcnRzLmtleWJvYXJkTGF5ZXIuc3RhdGVDeWNsZSgpXG5cdFx0XHRAaW5wdXQuYWRkRXZlbnRMaXN0ZW5lciBcImJsdXJcIiwgLT5cblx0XHRcdFx0ZXhwb3J0cy5rZXlib2FyZExheWVyLmFuaW1hdGUoXCJkZWZhdWx0XCIpXG5cblx0dXBkYXRlUGxhY2Vob2xkZXJDb2xvcjogKGNvbG9yKSAtPlxuXHRcdEBwbGFjZWhvbGRlckNvbG9yID0gY29sb3Jcblx0XHRpZiBAcGFnZVN0eWxlP1xuXHRcdFx0ZG9jdW1lbnQuaGVhZC5yZW1vdmVDaGlsZCBAcGFnZVN0eWxlXG5cdFx0QHBhZ2VTdHlsZSA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQgXCJzdHlsZVwiXG5cdFx0QHBhZ2VTdHlsZS50eXBlID0gXCJ0ZXh0L2Nzc1wiXG5cdFx0Y3NzID0gXCIjI3tAaW5wdXQuaWR9Ojotd2Via2l0LWlucHV0LXBsYWNlaG9sZGVyIHsgY29sb3I6ICN7QHBsYWNlaG9sZGVyQ29sb3J9OyB9XCJcblx0XHRAcGFnZVN0eWxlLmFwcGVuZENoaWxkKGRvY3VtZW50LmNyZWF0ZVRleHROb2RlIGNzcylcblx0XHRkb2N1bWVudC5oZWFkLmFwcGVuZENoaWxkIEBwYWdlU3R5bGVcblxuXHRmb2N1czogKCkgLT5cblx0XHRAaW5wdXQuZm9jdXMoKVxuXG5cdG9uRm9jdXM6IChjYikgLT5cblx0XHRAaW5wdXQuYWRkRXZlbnRMaXN0ZW5lciBcImZvY3VzXCIsIC0+XG5cdFx0XHRjYi5hcHBseShAKVxuXG5cdG9uQmx1cjogKGNiKSAtPlxuXHRcdEBpbnB1dC5hZGRFdmVudExpc3RlbmVyIFwiYmx1clwiLCAtPlxuXHRcdFx0Y2IuYXBwbHkoQClcbiIsIiMjI1xuRHluYW1pY0xvYWRlciBNb2R1bGUgZm9yIEZyYW1lckpTXG5odHRwczovL2dpdGh1Yi5jb20vTHVjaWVuTGVlL2ZyYW1lci1EeW5hbWljTG9hZGVyL1xuXG5DcmVhdGVkIGJ5IEx1Y2llbiBMZWUgKEBsdWNpZW5kZWVyKSwgSmFuLiAxMnRoLCAyMDE2XG5cbkR5bmFtaWNMb2FkZXIgYnJhZWtzIHRoZSBiYXJyaWFycyBiZXR3ZWVuIDNyZCBwYXJ0eSB3ZWIgZGV2ZWxvcG1lbnQgbGlicmFyaWVzIGFuZCBGcmFtZXIsIHdoaWNoXG5oZWxwIHlvdSBsb2FkIGxvY2FsLCBleHRlcm5hbCBzdHlsZXNoZWV0cyBhbmQgc2NyaXB0cyBkeW5hbWljYWxseS5cblxuQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby5cblx0e0R5bmFtaWNMb2FkZXJ9ID0gcmVxdWlyZSAnRHluYW1pY0xvYWRlcidcblxuW0xvYWQgb25lIGZpbGVdXG5EeW5hbWljTG9hZGVyLmFkZCgnc2NyaXB0LmpzJykudGhlbigtPlxuIyB3aGVuIHNjcmlwdC5qcyBsb2FkZWQgc3VjY2Vzc2Z1bGx5XG4uLi5cbikuY2F0Y2goLT5cbiMgd2hlbiBzY3JpcHQuanMgbG9hZGVkIGZhaWxlZFxuLi4uXG4pXG5cbltMb2FkIGZpbGUgaW4gc2VyaWVzXVxuRHluYW1pY0xvYWRlci5zZXJpZXMoWydvbmUuanMnLCAndHdvLmNzcycsIC4uLl0pLnRoZW4oIHN1Y2Nlc3NDYWxsYmFjaywgZmFpbENhbGxiYWNrIClcblxuW0xvYWQgZmlsZSBpbiBwYXJhbGxlbF1cbkR5bmFtaWNMb2FkZXIuc2VyaWVzKFsnb25lLmpzJywgJ3R3by5jc3MnLCAuLi5dKS50aGVuKCBzdWNjZXNzQ2FsbGJhY2ssIGZhaWxDYWxsYmFjayApXG5cbiMjI1xuXG5cblxuXG5jbGFzcyBleHBvcnRzLkR5bmFtaWNMb2FkZXJcblxuXHQjIFByb21pc2lmeSBzaW5nbGUgZHluYW1pYyBzY3JpcHQgbG9hZGluZ1xuXHRAYWRkID0gKHVybCkgLT5cblx0XHRwcm9taXNlID0gbmV3IFByb21pc2UoKHJlc29sdmUsIHJlamVjdCkgLT5cblx0XHRcdGlmIHVybC5zdWJzdHIoIHVybC5sYXN0SW5kZXhPZignLicpICkgaXMgXCIuanNcIlxuXHRcdFx0XHQjIGxvYWQgc2NyaXB0IG9uY2Vcblx0XHRcdFx0bG9hZGVkID0gQXJyYXkucHJvdG90eXBlLmZpbmQuY2FsbCBkb2N1bWVudC5nZXRFbGVtZW50c0J5VGFnTmFtZSgnc2NyaXB0JyksIChlbGVtZW50KSAtPlxuXHRcdFx0XHRcdGlmIGVsZW1lbnQuZ2V0QXR0cmlidXRlKCdzcmMnKSBpcyB1cmwgdGhlbiByZXR1cm4gZWxlbWVudFxuXHRcdFx0XHRpZiBsb2FkZWQgaXNudCB1bmRlZmluZWQgdGhlbiByZXR1cm4gcmVzb2x2ZSAnaGF2ZSBsb2FkZWQnXG5cblx0XHRcdFx0ZmlsZSA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQgJ3NjcmlwdCdcblx0XHRcdFx0ZmlsZS5zcmMgPSB1cmxcblx0XHRcdGVsc2UgaWYgdXJsLnN1YnN0ciggdXJsLmxhc3RJbmRleE9mKCcuJykgKSBpcyBcIi5jc3NcIlxuXHRcdFx0XHQjIGxvYWQgc3R5bGUgb25jZVxuXHRcdFx0XHRsb2FkZWQgPSBBcnJheS5wcm90b3R5cGUuZmluZC5jYWxsIGRvY3VtZW50LmdldEVsZW1lbnRzQnlUYWdOYW1lKCdsaW5rJyksIChlbGVtZW50KSAtPlxuXHRcdFx0XHRcdGlmIGVsZW1lbnQuZ2V0QXR0cmlidXRlKCdyZWwnKSBpcyB1cmwgdGhlbiByZXR1cm4gZWxlbWVudFxuXHRcdFx0XHRpZiBsb2FkZWQgaXNudCB1bmRlZmluZWQgdGhlbiByZXR1cm4gcmVzb2x2ZSAnaGF2ZSBsb2FkZWQnXG5cblx0XHRcdFx0ZmlsZSA9IGRvY3VtZW50LmNyZWF0ZUVsZW1lbnQgJ2xpbmsnXG5cdFx0XHRcdGZpbGUucmVsID0gXCJzdHlsZXNoZWV0XCJcblx0XHRcdFx0ZmlsZS5ocmVmID0gdXJsXG5cblx0XHRcdGZpbGUuYWRkRXZlbnRMaXN0ZW5lciAnbG9hZCcsIC0+XG5cdFx0XHRcdHJlc29sdmUgZmlsZVxuXHRcdFx0ZmlsZS5hZGRFdmVudExpc3RlbmVyICdlcnJvcicsIC0+XG5cdFx0XHRcdHJlamVjdCBmaWxlXG5cdFx0XHRkb2N1bWVudC5ib2R5LmFwcGVuZENoaWxkIGZpbGVcblx0XHQpXG5cblx0XHRyZXR1cm4gcHJvbWlzZVxuXG5cdCMgRHluYW1pYyBmaWxlIGxvYWRpbmcgaW4gc2VyaWVzXG5cdEBzZXJpZXMgPSAodXJscykgLT5cblx0XHRpZiAhQXJyYXkuaXNBcnJheSh1cmxzKSBvciB1cmxzLmxlbmd0aCBpcyAwIHRoZW4gdGhyb3cgXCJFUlJPUjogTk8gVVJMIElOIEFSUkFZIVwiXG5cblx0XHRyZXR1cm4gdXJscy5yZWR1Y2UoXG5cdFx0XHQocHJvbWlzZSwgdXJsKSA9PlxuXHRcdFx0XHRyZXR1cm4gcHJvbWlzZS50aGVuKCA9PiBAYWRkKHVybCkgKVxuXHRcdFx0LFxuXHRcdFx0UHJvbWlzZS5yZXNvbHZlKCkpXG5cblx0IyBEeW5hbWljIGZpbGUgbG9hZGluZyBpbiBwYXJhbGxlbFxuXHRAcGFyYWxsZWwgPSAodXJscykgLT5cblx0XHRpZiAhQXJyYXkuaXNBcnJheSh1cmxzKSBvciB1cmxzLmxlbmd0aCBpcyAwIHRoZW4gdGhyb3cgXCJFUlJPUjogTk8gVVJMIElOIEFSUkFZIVwiXG5cblx0XHRQcm9taXNlLmFsbChcblx0XHRcdHVybHMubWFwKCAodXJsKSA9PlxuXHRcdFx0XHRyZXR1cm4gQGFkZCh1cmwpXG5cdFx0KSkiLCIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUtBQTs7QURBQTs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7O0FBZ0NNLE9BQU8sQ0FBQzs7O0VBR2IsYUFBQyxDQUFBLEdBQUQsR0FBTyxTQUFDLEdBQUQ7QUFDTixRQUFBO0lBQUEsT0FBQSxHQUFjLElBQUEsT0FBQSxDQUFRLFNBQUMsT0FBRCxFQUFVLE1BQVY7QUFDckIsVUFBQTtNQUFBLElBQUcsR0FBRyxDQUFDLE1BQUosQ0FBWSxHQUFHLENBQUMsV0FBSixDQUFnQixHQUFoQixDQUFaLENBQUEsS0FBc0MsS0FBekM7UUFFQyxNQUFBLEdBQVMsS0FBSyxDQUFDLFNBQVMsQ0FBQyxJQUFJLENBQUMsSUFBckIsQ0FBMEIsUUFBUSxDQUFDLG9CQUFULENBQThCLFFBQTlCLENBQTFCLEVBQW1FLFNBQUMsT0FBRDtVQUMzRSxJQUFHLE9BQU8sQ0FBQyxZQUFSLENBQXFCLEtBQXJCLENBQUEsS0FBK0IsR0FBbEM7QUFBMkMsbUJBQU8sUUFBbEQ7O1FBRDJFLENB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
