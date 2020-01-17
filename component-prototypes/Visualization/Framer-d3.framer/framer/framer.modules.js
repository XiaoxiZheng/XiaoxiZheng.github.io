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


},{}],"myModule":[function(require,module,exports){
exports.myVar = "myVariable";

exports.myFunction = function() {
  return print("myFunction is running");
};

exports.myArray = [1, 2, 3];


},{}]},{},[])
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoiZnJhbWVyLm1vZHVsZXMuanMiLCJzb3VyY2VzIjpbIi4uLy4uLy4uLy4uLy4uL1VzZXJzL3hpYW94aXpoZW5nL0RvY3VtZW50cy9jb21wb25lbnQtcHJvdG90eXBlcy9WaXN1YWxpemF0aW9uL0ZyYW1lci1kMy5mcmFtZXIvbW9kdWxlcy9teU1vZHVsZS5jb2ZmZWUiLCIuLi8uLi8uLi8uLi8uLi9Vc2Vycy94aWFveGl6aGVuZy9Eb2N1bWVudHMvY29tcG9uZW50LXByb3RvdHlwZXMvVmlzdWFsaXphdGlvbi9GcmFtZXItZDMuZnJhbWVyL21vZHVsZXMvRHluYW1pY0xvYWRlci5jb2ZmZWUiLCJub2RlX21vZHVsZXMvYnJvd3Nlci1wYWNrL19wcmVsdWRlLmpzIl0sInNvdXJjZXNDb250ZW50IjpbIiMgQWRkIHRoZSBmb2xsb3dpbmcgbGluZSB0byB5b3VyIHByb2plY3QgaW4gRnJhbWVyIFN0dWRpby4gXG4jIG15TW9kdWxlID0gcmVxdWlyZSBcIm15TW9kdWxlXCJcbiMgUmVmZXJlbmNlIHRoZSBjb250ZW50cyBieSBuYW1lLCBsaWtlIG15TW9kdWxlLm15RnVuY3Rpb24oKSBvciBteU1vZHVsZS5teVZhclxuXG5leHBvcnRzLm15VmFyID0gXCJteVZhcmlhYmxlXCJcblxuZXhwb3J0cy5teUZ1bmN0aW9uID0gLT5cblx0cHJpbnQgXCJteUZ1bmN0aW9uIGlzIHJ1bm5pbmdcIlxuXG5leHBvcnRzLm15QXJyYXkgPSBbMSwgMiwgM10iLCIjIyNcbkR5bmFtaWNMb2FkZXIgTW9kdWxlIGZvciBGcmFtZXJKU1xuaHR0cHM6Ly9naXRodWIuY29tL0x1Y2llbkxlZS9mcmFtZXItRHluYW1pY0xvYWRlci9cblxuQ3JlYXRlZCBieSBMdWNpZW4gTGVlIChAbHVjaWVuZGVlciksIEphbi4gMTJ0aCwgMjAxNlxuXG5EeW5hbWljTG9hZGVyIGJyYWVrcyB0aGUgYmFycmlhcnMgYmV0d2VlbiAzcmQgcGFydHkgd2ViIGRldmVsb3BtZW50IGxpYnJhcmllcyBhbmQgRnJhbWVyLCB3aGljaFxuaGVscCB5b3UgbG9hZCBsb2NhbCwgZXh0ZXJuYWwgc3R5bGVzaGVldHMgYW5kIHNjcmlwdHMgZHluYW1pY2FsbHkuXG5cbkFkZCB0aGUgZm9sbG93aW5nIGxpbmUgdG8geW91ciBwcm9qZWN0IGluIEZyYW1lciBTdHVkaW8uXG5cdHtEeW5hbWljTG9hZGVyfSA9IHJlcXVpcmUgJ0R5bmFtaWNMb2FkZXInXG5cbltMb2FkIG9uZSBmaWxlXVxuRHluYW1pY0xvYWRlci5hZGQoJ3NjcmlwdC5qcycpLnRoZW4oLT5cbiMgd2hlbiBzY3JpcHQuanMgbG9hZGVkIHN1Y2Nlc3NmdWxseVxuLi4uXG4pLmNhdGNoKC0+XG4jIHdoZW4gc2NyaXB0LmpzIGxvYWRlZCBmYWlsZWRcbi4uLlxuKVxuXG5bTG9hZCBmaWxlIGluIHNlcmllc11cbkR5bmFtaWNMb2FkZXIuc2VyaWVzKFsnb25lLmpzJywgJ3R3by5jc3MnLCAuLi5dKS50aGVuKCBzdWNjZXNzQ2FsbGJhY2ssIGZhaWxDYWxsYmFjayApXG5cbltMb2FkIGZpbGUgaW4gcGFyYWxsZWxdXG5EeW5hbWljTG9hZGVyLnNlcmllcyhbJ29uZS5qcycsICd0d28uY3NzJywgLi4uXSkudGhlbiggc3VjY2Vzc0NhbGxiYWNrLCBmYWlsQ2FsbGJhY2sgKVxuXG4jIyNcblxuXG5cblxuY2xhc3MgZXhwb3J0cy5EeW5hbWljTG9hZGVyXG5cblx0IyBQcm9taXNpZnkgc2luZ2xlIGR5bmFtaWMgc2NyaXB0IGxvYWRpbmdcblx0QGFkZCA9ICh1cmwpIC0+XG5cdFx0cHJvbWlzZSA9IG5ldyBQcm9taXNlKChyZXNvbHZlLCByZWplY3QpIC0+XG5cdFx0XHRpZiB1cmwuc3Vic3RyKCB1cmwubGFzdEluZGV4T2YoJy4nKSApIGlzIFwiLmpzXCJcblx0XHRcdFx0IyBsb2FkIHNjcmlwdCBvbmNlXG5cdFx0XHRcdGxvYWRlZCA9IEFycmF5LnByb3RvdHlwZS5maW5kLmNhbGwgZG9jdW1lbnQuZ2V0RWxlbWVudHNCeVRhZ05hbWUoJ3NjcmlwdCcpLCAoZWxlbWVudCkgLT5cblx0XHRcdFx0XHRpZiBlbGVtZW50LmdldEF0dHJpYnV0ZSgnc3JjJykgaXMgdXJsIHRoZW4gcmV0dXJuIGVsZW1lbnRcblx0XHRcdFx0aWYgbG9hZGVkIGlzbnQgdW5kZWZpbmVkIHRoZW4gcmV0dXJuIHJlc29sdmUgJ2hhdmUgbG9hZGVkJ1xuXG5cdFx0XHRcdGZpbGUgPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50ICdzY3JpcHQnXG5cdFx0XHRcdGZpbGUuc3JjID0gdXJsXG5cdFx0XHRlbHNlIGlmIHVybC5zdWJzdHIoIHVybC5sYXN0SW5kZXhPZignLicpICkgaXMgXCIuY3NzXCJcblx0XHRcdFx0IyBsb2FkIHN0eWxlIG9uY2Vcblx0XHRcdFx0bG9hZGVkID0gQXJyYXkucHJvdG90eXBlLmZpbmQuY2FsbCBkb2N1bWVudC5nZXRFbGVtZW50c0J5VGFnTmFtZSgnbGluaycpLCAoZWxlbWVudCkgLT5cblx0XHRcdFx0XHRpZiBlbGVtZW50LmdldEF0dHJpYnV0ZSgncmVsJykgaXMgdXJsIHRoZW4gcmV0dXJuIGVsZW1lbnRcblx0XHRcdFx0aWYgbG9hZGVkIGlzbnQgdW5kZWZpbmVkIHRoZW4gcmV0dXJuIHJlc29sdmUgJ2hhdmUgbG9hZGVkJ1xuXG5cdFx0XHRcdGZpbGUgPSBkb2N1bWVudC5jcmVhdGVFbGVtZW50ICdsaW5rJ1xuXHRcdFx0XHRmaWxlLnJlbCA9IFwic3R5bGVzaGVldFwiXG5cdFx0XHRcdGZpbGUuaHJlZiA9IHVybFxuXG5cdFx0XHRmaWxlLmFkZEV2ZW50TGlzdGVuZXIgJ2xvYWQnLCAtPlxuXHRcdFx0XHRyZXNvbHZlIGZpbGVcblx0XHRcdGZpbGUuYWRkRXZlbnRMaXN0ZW5lciAnZXJyb3InLCAtPlxuXHRcdFx0XHRyZWplY3QgZmlsZVxuXHRcdFx0ZG9jdW1lbnQuYm9keS5hcHBlbmRDaGlsZCBmaWxlXG5cdFx0KVxuXG5cdFx0cmV0dXJuIHByb21pc2VcblxuXHQjIER5bmFtaWMgZmlsZSBsb2FkaW5nIGluIHNlcmllc1xuXHRAc2VyaWVzID0gKHVybHMpIC0+XG5cdFx0aWYgIUFycmF5LmlzQXJyYXkodXJscykgb3IgdXJscy5sZW5ndGggaXMgMCB0aGVuIHRocm93IFwiRVJST1I6IE5PIFVSTCBJTiBBUlJBWSFcIlxuXG5cdFx0cmV0dXJuIHVybHMucmVkdWNlKFxuXHRcdFx0KHByb21pc2UsIHVybCkgPT5cblx0XHRcdFx0cmV0dXJuIHByb21pc2UudGhlbiggPT4gQGFkZCh1cmwpIClcblx0XHRcdCxcblx0XHRcdFByb21pc2UucmVzb2x2ZSgpKVxuXG5cdCMgRHluYW1pYyBmaWxlIGxvYWRpbmcgaW4gcGFyYWxsZWxcblx0QHBhcmFsbGVsID0gKHVybHMpIC0+XG5cdFx0aWYgIUFycmF5LmlzQXJyYXkodXJscykgb3IgdXJscy5sZW5ndGggaXMgMCB0aGVuIHRocm93IFwiRVJST1I6IE5PIFVSTCBJTiBBUlJBWSFcIlxuXG5cdFx0UHJvbWlzZS5hbGwoXG5cdFx0XHR1cmxzLm1hcCggKHVybCkgPT5cblx0XHRcdFx0cmV0dXJuIEBhZGQodXJsKVxuXHRcdCkpIiwiKGZ1bmN0aW9uIGUodCxuLHIpe2Z1bmN0aW9uIHMobyx1KXtpZighbltvXSl7aWYoIXRbb10pe3ZhciBhPXR5cGVvZiByZXF1aXJlPT1cImZ1bmN0aW9uXCImJnJlcXVpcmU7aWYoIXUmJmEpcmV0dXJuIGEobywhMCk7aWYoaSlyZXR1cm4gaShvLCEwKTt2YXIgZj1uZXcgRXJyb3IoXCJDYW5ub3QgZmluZCBtb2R1bGUgJ1wiK28rXCInXCIpO3Rocm93IGYuY29kZT1cIk1PRFVMRV9OT1RfRk9VTkRcIixmfXZhciBsPW5bb109e2V4cG9ydHM6e319O3Rbb11bMF0uY2FsbChsLmV4cG9ydHMsZnVuY3Rpb24oZSl7dmFyIG49dFtvXVsxXVtlXTtyZXR1cm4gcyhuP246ZSl9LGwsbC5leHBvcnRzLGUsdCxuLHIpfXJldHVybiBuW29dLmV4cG9ydHN9dmFyIGk9dHlwZW9mIHJlcXVpcmU9PVwiZnVuY3Rpb25cIiYmcmVxdWlyZTtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKylzKHJbb10pO3JldHVy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
