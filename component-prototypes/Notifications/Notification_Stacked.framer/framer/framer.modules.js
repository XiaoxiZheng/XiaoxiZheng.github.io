require=(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({"LoadingPlaceholder":[function(require,module,exports){
var _createPlaceHolders, _destroyMask, _destroyPlaceHolder, _drawTemplateLayer, _getDepthElements, _showAnimation, _startAnimateLoaded;

_getDepthElements = function(element, depth) {
  var i, j, layer, len, placeLoaders, whatineed;
  placeLoaders = [element];
  i = 0;
  while (i < depth) {
    whatineed = [];
    for (j = 0, len = placeLoaders.length; j < len; j++) {
      layer = placeLoaders[j];
      if (layer.children.length > 0) {
        placeLoaders = layer.children;
      }
    }
    i++;
  }
  return placeLoaders;
};

_destroyPlaceHolder = function(placeholder) {
  return placeholder.destroy();
};

_destroyMask = function(currentLayer) {
  var mask;
  mask = currentLayer.parent;
  currentLayer.parent = mask.parent;
  currentLayer.x = mask.x;
  currentLayer.y = mask.y;
  delete currentLayer.states.placeholderOut;
  delete currentLayer.states.placeholderIn;
  delete currentLayer.placeholderParent;
  return mask.destroy();
};

_startAnimateLoaded = function(layer, delay) {
  var currentLayer, placeholder;
  currentLayer = layer.children[1];
  placeholder = layer.children[0];
  currentLayer.animate("placeholderOut", {
    delay: delay
  });
  placeholder.animate("placeholderOut", {
    delay: delay
  });
  currentLayer.on(Events.AnimationEnd, function() {
    return _destroyMask(currentLayer);
  });
  return placeholder.on(Events.AnimationEnd, function() {
    return _destroyPlaceHolder(placeholder);
  });
};

_drawTemplateLayer = function(layer) {
  var animationLoading, gradient, placeholder;
  placeholder = new Layer({
    width: layer.width,
    height: layer.height,
    borderRadius: layer.borderRadius,
    backgroundColor: "#eeeeee",
    x: 0,
    y: 0,
    opacity: 1
  });
  gradient = new Layer({
    name: "Gradient",
    parent: placeholder,
    height: placeholder.height,
    width: placeholder.width * 2,
    x: -placeholder.width,
    opacity: 0.7,
    style: {
      background: "linear-gradient(to right, #eeeeee 10%, #dddddd 25%, #dddddd 30%, #eeeeee 45%)"
    }
  });
  animationLoading = new Animation(gradient, {
    x: placeholder.width,
    time: 0.9
  });
  animationLoading.start();
  animationLoading.on(Events.AnimationEnd, function() {
    return Utils.delay(0.4, function() {
      return animationLoading.restart();
    });
  });
  return placeholder;
};

_showAnimation = function(layer, placeholder, delay) {
  layer.states.placeholderIn = {
    y: layer.height
  };
  layer.states.placeholderOut = {
    y: 0,
    options: {
      time: 0.2,
      curve: Bezier(0.25, 0.1, 0.25, 1),
      delay: delay
    }
  };
  return placeholder.states.placeholderOut = {
    opacity: 0,
    options: {
      time: 0.2
    }
  };
};

_createPlaceHolders = function(placeLoaders, customElement, customAnimation) {
  var delay, j, layer, len, mask, placeholder, results;
  delay = 0;
  results = [];
  for (j = 0, len = placeLoaders.length; j < len; j++) {
    layer = placeLoaders[j];
    layer.off(Events.AnimationEnd);
    mask = new Layer({
      name: "placeholder",
      parent: layer.parent,
      width: layer.width,
      height: layer.height,
      backgroundColor: "transparent",
      x: layer.x,
      y: layer.y,
      clip: true,
      opacity: 1
    });
    placeholder = customElement(layer);
    placeholder.parent = mask;
    layer.x = 0;
    layer.y = 0;
    layer.parent = mask;
    layer.placeholderParent = true;
    customAnimation(layer, placeholder, delay);
    layer.stateSwitch("placeholderIn");
    results.push(delay = delay + 0.1);
  }
  return results;
};

Layer.prototype.placeholder = function(options) {
  var customAnimation, customElement, placeLoaders, ref;
  if (options == null) {
    options = {};
  }
  this.depth = (ref = options.depth) != null ? ref : 0;
  placeLoaders = _getDepthElements(this, this.depth);
  if (options.customElement) {
    customElement = options.customElement;
  } else {
    customElement = exports.defaultElement;
  }
  if (options.customAnimation) {
    customAnimation = options.customAnimation;
  } else {
    customAnimation = exports.defaultAnimation;
  }
  return _createPlaceHolders(placeLoaders, customElement, customAnimation);
};

Layer.prototype.loaded = function() {
  var j, layer, layers, len, placeLoaders, results;
  if (this.placeholderParent) {
    placeLoaders = [this.parent];
  } else {
    layers = this.descendants;
    placeLoaders = _.filter(layers, function(layer) {
      if (layer.name === "placeholder") {
        return true;
      }
    });
  }
  results = [];
  for (j = 0, len = placeLoaders.length; j < len; j++) {
    layer = placeLoaders[j];
    results.push(_startAnimateLoaded(layer));
  }
  return results;
};

exports.loadedAll = function(options) {
  var delay, j, layer, layers, len, newDelay, placeLoaders, ref, results;
  if (options == null) {
    options = {};
  }
  delay = (ref = options.delay) != null ? ref : 0.5;
  layers = Framer.CurrentContext._layers;
  placeLoaders = _.filter(layers, function(layer) {
    if (layer.name === "placeholder") {
      return true;
    }
  });
  newDelay = delay;
  results = [];
  for (j = 0, len = placeLoaders.length; j < len; j++) {
    layer = placeLoaders[j];
    _startAnimateLoaded(layer, newDelay);
    results.push(newDelay = newDelay + delay);
  }
  return results;
};

exports.defaultElement = function(layer) {
  return _drawTemplateLayer(layer);
};

exports.defaultAnimation = function(layer, placeholder, delay) {
  return _showAnimation(layer, placeholder, delay);
};


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL3hpYW94aXpoZW5nL0RvY3VtZW50cy9jb21wb25lbnQtcHJvdG90eXBlcy9Ob3RpZmljYXRpb25zL05vdGlmaWNhdGlvbl9TdGFja2VkLmZyYW1lci9tb2R1bGVzL215TW9kdWxlLmNvZmZlZSIsIi4uLy4uLy4uLy4uLy4uL1VzZXJzL3hpYW94aXpoZW5nL0RvY3VtZW50cy9jb21wb25lbnQtcHJvdG90eXBlcy9Ob3RpZmljYXRpb25zL05vdGlmaWNhdGlvbl9TdGFja2VkLmZyYW1lci9tb2R1bGVzL0xvYWRpbmdQbGFjZWhvbGRlci5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIjIEZ1bmN0aW9uc1xuX2dldERlcHRoRWxlbWVudHMgPSAoZWxlbWVudCwgZGVwdGgpIC0+XG4gIHBsYWNlTG9hZGVycyA9IFtlbGVtZW50XVxuICBpID0gMFxuICB3aGlsZSBpIDwgZGVwdGhcbiAgICB3aGF0aW5lZWQgPSBbXVxuICAgIGZvciBsYXllciBpbiBwbGFjZUxvYWRlcnNcbiAgICAgIGlmIGxheWVyLmNoaWxkcmVuLmxlbmd0aCA+IDBcbiAgICAgICAgcGxhY2VMb2FkZXJzID0gbGF5ZXIuY2hpbGRyZW5cbiAgICBpKytcblxuICByZXR1cm4gcGxhY2VMb2FkZXJzXG5cbl9kZXN0cm95UGxhY2VIb2xkZXIgPSAocGxhY2Vob2xkZXIpIC0+XG4gIHBsYWNlaG9sZGVyLmRlc3Ryb3koKVxuXG5fZGVzdHJveU1hc2sgPSAoY3VycmVudExheWVyKSAtPlxuICBtYXNrID0gY3VycmVudExheWVyLnBhcmVudFxuICBjdXJyZW50TGF5ZXIucGFyZW50ID0gbWFzay5wYXJlbnRcbiAgY3VycmVudExheWVyLnggPSBtYXNrLnhcbiAgY3VycmVudExheWVyLnkgPSBtYXNrLnlcblxuICBkZWxldGUgY3VycmVudExheWVyLnN0YXRlcy5wbGFjZWhvbGRlck91dFxuICBkZWxldGUgY3VycmVudExheWVyLnN0YXRlcy5wbGFjZWhvbGRlckluXG4gIGRlbGV0ZSBjdXJyZW50TGF5ZXIucGxhY2Vob2xkZXJQYXJlbnRcblxuICBtYXNrLmRlc3Ryb3koKVxuXG5fc3RhcnRBbmltYXRlTG9hZGVkID0gKGxheWVyLCBkZWxheSkgLT5cbiAgY3VycmVudExheWVyID0gbGF5ZXIuY2hpbGRyZW5bMV1cbiAgcGxhY2Vob2xkZXIgPSBsYXllci5jaGlsZHJlblswXVxuXG4gIGN1cnJlbnRMYXllci5hbmltYXRlIFwicGxhY2Vob2xkZXJPdXRcIixcbiAgICBkZWxheTogZGVsYXlcbiAgcGxhY2Vob2xkZXIuYW5pbWF0ZSBcInBsYWNlaG9sZGVyT3V0XCIsXG4gICAgZGVsYXk6IGRlbGF5XG5cbiAgY3VycmVudExheWVyLm9uIEV2ZW50cy5BbmltYXRpb25FbmQsIC0+XG4gICAgX2Rlc3Ryb3lNYXNrKGN1cnJlbnRMYXllcilcblxuICBwbGFjZWhvbGRlci5vbiBFdmVudHMuQW5pbWF0aW9uRW5kLCAtPlxuICAgIF9kZXN0cm95UGxhY2VIb2xkZXIocGxhY2Vob2xkZXIpXG5cbiMgRHJhd2luZ1xuX2RyYXdUZW1wbGF0ZUxheWVyID0gKGxheWVyKSAtPlxuXG4gIHBsYWNlaG9sZGVyID0gbmV3IExheWVyXG4gICAgd2lkdGg6IGxheWVyLndpZHRoXG4gICAgaGVpZ2h0OiBsYXllci5oZWlnaHRcbiAgICBib3JkZXJSYWRpdXM6IGxheWVyLmJvcmRlclJhZGl1c1xuICAgIGJhY2tncm91bmRDb2xvcjogXCIjZWVlZWVlXCJcbiAgICB4OiAwXG4gICAgeTogMFxuICAgIG9wYWNpdHk6IDFcblxuICBncmFkaWVudCA9IG5ldyBMYXllclxuICAgIG5hbWU6IFwiR3JhZGllbnRcIlxuICAgIHBhcmVudDogcGxhY2Vob2xkZXJcbiAgICBoZWlnaHQ6IHBsYWNlaG9sZGVyLmhlaWdodFxuICAgIHdpZHRoOiBwbGFjZWhvbGRlci53aWR0aCAqMlxuICAgIHg6IC1wbGFjZWhvbGRlci53aWR0aFxuICAgIG9wYWNpdHk6IDAuN1xuICAgIHN0eWxlOlxuICAgICAgYmFja2dyb3VuZDogXCJsaW5lYXItZ3JhZGllbnQodG8gcmlnaHQsICNlZWVlZWUgMTAlLCAjZGRkZGRkIDI1JSwgI2RkZGRkZCAzMCUsICNlZWVlZWUgNDUlKVwiXG5cbiAgYW5pbWF0aW9uTG9hZGluZyA9IG5ldyBBbmltYXRpb24gZ3JhZGllbnQsXG4gICAgeDogcGxhY2Vob2xkZXIud2lkdGhcbiAgICB0aW1lOiAwLjlcblxuICBhbmltYXRpb25Mb2FkaW5nLnN0YXJ0KClcbiAgYW5pbWF0aW9uTG9hZGluZy5vbiBFdmVudHMuQW5pbWF0aW9uRW5kLCAtPlxuICAgIFV0aWxzLmRlbGF5IDAuNCwgLT4gYW5pbWF0aW9uTG9hZGluZy5yZXN0YXJ0KClcblxuICByZXR1cm4gcGxhY2Vob2xkZXJcblxuX3Nob3dBbmltYXRpb24gPSAobGF5ZXIsIHBsYWNlaG9sZGVyLCBkZWxheSkgLT5cbiAgbGF5ZXIuc3RhdGVzLnBsYWNlaG9sZGVySW4gPVxuICAgIHk6IGxheWVyLmhlaWdodFxuXG4gIGxheWVyLnN0YXRlcy5wbGFjZWhvbGRlck91dCA9XG4gICAgeTogMFxuICAgIG9wdGlvbnM6XG4gICAgICB0aW1lOiAwLjJcbiAgICAgIGN1cnZlOiBCZXppZXIoMC4yNSwgMC4xLCAwLjI1LCAxKVxuICAgICAgZGVsYXk6IGRlbGF5XG5cbiAgcGxhY2Vob2xkZXIuc3RhdGVzLnBsYWNlaG9sZGVyT3V0ID1cbiAgICBvcGFjaXR5OiAwXG4gICAgb3B0aW9uczpcbiAgICAgIHRpbWU6IDAuMlxuXG5fY3JlYXRlUGxhY2VIb2xkZXJzID0gKHBsYWNlTG9hZGVycywgY3VzdG9tRWxlbWVudCwgY3VzdG9tQW5pbWF0aW9uKSAtPlxuICBkZWxheSA9IDBcblxuICBmb3IgbGF5ZXIgaW4gcGxhY2VMb2FkZXJzXG4gICAgbGF5ZXIub2ZmKEV2ZW50cy5BbmltYXRpb25FbmQpXG5cbiAgICBtYXNrID0gbmV3IExheWVyXG4gICAgICBuYW1lOiBcInBsYWNlaG9sZGVyXCJcbiAgICAgIHBhcmVudDogbGF5ZXIucGFyZW50XG4gICAgICB3aWR0aDogbGF5ZXIud2lkdGhcbiAgICAgIGhlaWdodDogbGF5ZXIuaGVpZ2h0XG4gICAgICBiYWNrZ3JvdW5kQ29sb3I6IFwidHJhbnNwYXJlbnRcIlxuICAgICAgeDogbGF5ZXIueFxuICAgICAgeTogbGF5ZXIueVxuICAgICAgY2xpcDogdHJ1ZVxuICAgICAgb3BhY2l0eTogMVxuXG4gICAgcGxhY2Vob2xkZXIgPSBjdXN0b21FbGVtZW50KGxheWVyKVxuICAgIHBsYWNlaG9sZGVyLnBhcmVudCA9IG1hc2tcblxuICAgIGxheWVyLnggPSAwXG4gICAgbGF5ZXIueSA9IDBcbiAgICBsYXllci5wYXJlbnQgPSBtYXNrXG4gICAgbGF5ZXIucGxhY2Vob2xkZXJQYXJlbnQgPSB0cnVlXG5cbiAgICBjdXN0b21BbmltYXRpb24obGF5ZXIsIHBsYWNlaG9sZGVyLCBkZWxheSlcbiAgICBsYXllci5zdGF0ZVN3aXRjaChcInBsYWNlaG9sZGVySW5cIilcblxuICAgIGRlbGF5ID0gZGVsYXkgKyAwLjFcblxuIyBNZXRob2RzXG5MYXllcjo6cGxhY2Vob2xkZXIgPSAob3B0aW9ucz17fSkgLT5cbiAgQGRlcHRoID0gb3B0aW9ucy5kZXB0aCA/IDBcbiAgcGxhY2VMb2FkZXJzID0gX2dldERlcHRoRWxlbWVudHMoQCwgQGRlcHRoKVxuXG4gIGlmIG9wdGlvbnMuY3VzdG9tRWxlbWVudFxuICAgIGN1c3RvbUVsZW1lbnQgPSBvcHRpb25zLmN1c3RvbUVsZW1lbnRcbiAgZWxzZVxuICAgIGN1c3RvbUVsZW1lbnQgPSBleHBvcnRzLmRlZmF1bHRFbGVtZW50XG5cbiAgaWYgb3B0aW9ucy5jdXN0b21BbmltYXRpb25cbiAgICBjdXN0b21BbmltYXRpb24gPSBvcHRpb25zLmN1c3RvbUFuaW1hdGlvblxuICBlbHNlXG4gICAgY3VzdG9tQW5pbWF0aW9uID0gZXhwb3J0cy5kZWZhdWx0QW5pbWF0aW9uXG5cbiAgX2NyZWF0ZVBsYWNlSG9sZGVycyBwbGFjZUxvYWRlcnMsIGN1c3RvbUVsZW1lbnQsIGN1c3RvbUFuaW1hdGlvblxuXG5MYXllcjo6bG9hZGVkID0gKCkgLT5cbiAgaWYgQHBsYWNlaG9sZGVyUGFyZW50XG4gICAgcGxhY2VMb2FkZXJzID0gW0AucGFyZW50XVxuICBlbHNlXG4gICAgbGF5ZXJzID0gQGRlc2NlbmRhbnRzXG4gICAgcGxhY2VMb2FkZXJzID0gXy5maWx0ZXIgbGF5ZXJzLCAobGF5ZXIpIC0+XG4gICAgICBpZiBsYXllci5uYW1lIGlzIFwicGxhY2Vob2xkZXJcIiB0aGVuIHRydWVcblxuICBmb3IgbGF5ZXIgaW4gcGxhY2VMb2FkZXJzXG4gICAgX3N0YXJ0QW5pbWF0ZUxvYWRlZChsYXllcilcblxuZXhwb3J0cy5sb2FkZWRBbGwgPSAob3B0aW9ucz17fSkgLT5cbiAgZGVsYXkgPSBvcHRpb25zLmRlbGF5ID8gMC41XG5cbiAgbGF5ZXJzID0gRnJhbWVyLkN1cnJlbnRDb250ZXh0Ll9sYXllcnNcbiAgcGxhY2VMb2FkZXJzID0gXy5maWx0ZXIgbGF5ZXJzLCAobGF5ZXIpIC0+XG4gICAgaWYgbGF5ZXIubmFtZSBpcyBcInBsYWNlaG9sZGVyXCIgdGhlbiB0cnVlXG5cbiAgbmV3RGVsYXkgPSBkZWxheVxuICBmb3IgbGF5ZXIgaW4gcGxhY2VMb2FkZXJzXG4gICAgX3N0YXJ0QW5pbWF0ZUxvYWRlZChsYXllciwgbmV3RGVsYXkpXG4gICAgbmV3RGVsYXkgPSBuZXdEZWxheSArIGRlbGF5XG5cbmV4cG9ydHMuZGVmYXVsdEVsZW1lbnQgPSAobGF5ZXIpIC0+XG4gIHJldHVybiBfZHJhd1RlbXBsYXRlTGF5ZXIobGF5ZXIpXG5cbmV4cG9ydHMuZGVmYXVsdEFuaW1hdGlvbiA9IChsYXllciwgcGxhY2Vob2xkZXIsIGRlbGF5KSAtPlxuICByZXR1cm4gX3Nob3dBbmltYXRpb24obGF5ZXIsIHBsYWNlaG9sZGVyLCBkZWxheSkiLCIoZnVuY3Rpb24gZSh0LG4scil7ZnVuY3Rpb24gcyhvLHUpe2lmKCFuW29dKXtpZighdFtvXSl7dmFyIGE9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtpZighdSYmYSlyZXR1cm4gYShvLCEwKTtpZihpKXJldHVybiBpKG8sITApO3ZhciBmPW5ldyBFcnJvcihcIkNhbm5vdCBmaW5kIG1vZHVsZSAnXCIrbytcIidcIik7dGhyb3cgZi5jb2RlPVwiTU9EVUxFX05PVF9GT1VORFwiLGZ9dmFyIGw9bltvXT17ZXhwb3J0czp7fX07dFtvXVswXS5jYWxsKGwuZXhwb3J0cyxmdW5jdGlvbihlKXt2YXIgbj10W29dWzFdW2VdO3JldHVybiBzKG4/bjplKX0sbCxsLmV4cG9ydHMsZSx0LG4scil9cmV0dXJuIG5bb10uZXhwb3J0c312YXIgaT10eXBlb2YgcmVxdWlyZT09XCJmdW5jdGlvblwiJiZyZXF1aXJlO2Zvcih2YXIgbz0wO288ci5sZW5ndGg7bysrKXMocltvXSk7cmV0dXJuIHN9KSJdLCJuYW1lcyI6W10sIm1hcHBpbmdzIjoiQUVBQTtBRENBLElBQUE7O0FBQUEsaUJBQUEsR0FBb0IsU0FBQyxPQUFELEVBQVUsS0FBVjtBQUNsQixNQUFBO0VBQUEsWUFBQSxHQUFlLENBQUMsT0FBRDtFQUNmLENBQUEsR0FBSTtBQUNKLFNBQU0sQ0FBQSxHQUFJLEtBQVY7SUFDRSxTQUFB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
