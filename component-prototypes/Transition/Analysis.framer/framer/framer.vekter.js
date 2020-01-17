(function(scope) {var IntelliStream_App = new Layer({"name":"IntelliStream_App","backgroundColor":"rgba(255,255,255,1)","width":1280,"x":-179,"height":958,"constraintValues":null,"blending":"normal","clip":true,"borderStyle":"solid","y":-157});var SearchHistory = new Layer({"parent":IntelliStream_App,"name":"SearchHistory","backgroundColor":null,"width":1250,"height":312,"constraintValues":{"height":312,"centerAnchorX":0.48828125,"width":1250,"right":30,"top":70,"centerAnchorY":0.2317948717948718},"blending":"normal","clip":false,"borderStyle":"solid","y":70});var facetFrame = new Layer({"parent":SearchHistory,"name":"facetFrame","backgroundColor":null,"width":245,"height":890,"constraintValues":{"height":890,"centerAnchorX":0.0984,"width":245,"bottom":-578,"centerAnchorY":1.426282051282051},"blending":"normal","clip":false,"borderStyle":"solid"});var contentFrame = new Layer({"parent":SearchHistory,"name":"contentFrame","backgroundColor":null,"width":995,"x":255,"height":1091,"constraintValues":{"left":255,"height":1091,"centerAnchorX":0.602,"width":995,"bottom":-890,"top":111,"centerAnchorY":0.5461730449251248},"blending":"normal","clip":false,"borderStyle":"solid","y":111});var subHeader = new Layer({"parent":SearchHistory,"name":"subHeader","backgroundColor":null,"width":990,"x":260,"height":90,"constraintValues":{"left":null,"height":90,"centerAnchorX":0.604,"width":990,"right":0,"top":10,"centerAnchorY":0.1762820512820513},"blending":"normal","opacity":0,"clip":false,"borderStyle":"solid","y":10});var __layer_0__ = new TextLayer({"parent":subHeader,"backgroundColor":null,"width":179,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"24px","WebkitTextFillColor":"#0D1A21","whiteSpace":"pre","letterSpacing":"0px","lineHeight":"1.2","tabSize":4,"fontFamily":"\"GEInspiraSans-Regular\", \"GE Inspira Sans\", sans-serif","fontWeight":400},"startIndex":0,"endIndex":14}],"text":"SEARCH RESULTS"}]},"height":28,"constraintValues":{"height":28,"centerAnchorX":0.1222222222222222,"width":179,"top":18,"centerAnchorY":0.3555555555555556},"blending":"normal","autoSize":true,"y":18});var __layer_1__ = new TextLayer({"parent":subHeader,"backgroundColor":null,"width":60,"x":15,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"12px","WebkitTextFillColor":"#0D1A21","whiteSpace":"pre","letterSpacing":"0px","lineHeight":"1.2","tabSize":4,"fontFamily":"\"GEInspira\", \"GE Inspira\", serif","fontWeight":400},"startIndex":0,"endIndex":11}],"text":"All RESULTS"}]},"height":14,"constraintValues":{"left":15,"height":14,"centerAnchorX":0.04545454545454546,"width":60,"bottom":0,"top":null,"centerAnchorY":0.9222222222222223},"blending":"normal","autoSize":true,"y":76});var __layer_2__ = new TextLayer({"parent":subHeader,"backgroundColor":null,"width":103,"x":835,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"12px","WebkitTextFillColor":"#0D1A21","whiteSpace":"pre","letterSpacing":"0px","lineHeight":"1.2","tabSize":4,"fontFamily":"\"GEInspira\", \"GE Inspira\", serif","fontWeight":400},"startIndex":0,"endIndex":17}],"text":"AVAILABLE ACTIONS"}]},"height":14,"constraintValues":{"left":null,"height":14,"centerAnchorX":0.8954545454545455,"width":103,"bottom":0,"right":52,"top":null,"centerAnchorY":0.9222222222222223},"blending":"normal","autoSize":true,"y":76});var __layer_3__ = new Layer({"parent":subHeader,"name":"headerControl","backgroundColor":null,"width":203,"x":787,"height":18,"constraintValues":{"left":null,"height":18,"centerAnchorX":0.8974747474747474,"width":203,"right":0,"centerAnchorY":0.1,"aspectRatioLocked":true},"blending":"normal","image":"images\/design\/7cKSwXA43PQPLdFlGGQpPRNAStQZycbVPPPuQEakv4UNRCYiDwD5ZyMjxhsBnjUM1aXMIgza2eG4FkKXhgQA.png","clip":true,"borderStyle":"solid"});var __layer_4__ = new Layer({"parent":IntelliStream_App,"name":"Dashboard","backgroundColor":null,"width":854,"height":302,"constraintValues":{"height":302,"centerAnchorX":0.33359375,"width":854,"top":168,"centerAnchorY":0.3271794871794872},"blending":"normal","clip":false,"borderStyle":"solid","y":168});var __layer_5__ = new SVGLayer({"parent":__layer_4__,"name":"timeseriesContainer","backgroundColor":null,"width":854,"strokeWidth":1,"html":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"854\" height=\"260\"><path d=\"M 0 0 L 854 0 L 854 260 L 0 260 Z\" id=\"timeseriesContainer\" fill=\"transparent\" name=\"timeseriesContainer\"><\/path><\/svg>","htmlIntrinsicSize":{"height":260,"width":854},"rotation":null,"height":260,"opacity":null});if(__layer_5__.elements !== undefined){var timeseriesContainer;
({timeseriesContainer} = __layer_5__.elements);};var tableControl = new Layer({"parent":__layer_4__,"name":"tableControl","backgroundColor":null,"width":756,"x":30,"height":20,"constraintValues":{"left":30,"aspectRatioLocked":true,"height":20,"centerAnchorX":0.477751756440281,"width":756,"bottom":0,"right":68,"top":null,"centerAnchorY":0.9668874172185431},"blending":"normal","image":"images\/design\/UreJtXUaGD4jxFnSMO4ia5L5Pag0HriqqiCLMhcO44E5GagKrXrQUGgYG29UT71zitbRmHQKlDnAvYrbmqwA.png","opacity":0,"clip":true,"borderStyle":"solid","y":282});var __layer_6__ = new SVGLayer({"parent":__layer_4__,"name":"kpisContainer","backgroundColor":null,"width":1280,"strokeWidth":1,"html":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"1280\" height=\"98\"><path d=\"M 0 0 L 1280 0 L 1280 98 L 0 98 Z\" id=\"kpisContainer\" fill=\"transparent\" name=\"kpisContainer\"><\/path><\/svg>","htmlIntrinsicSize":{"height":98,"width":1280},"rotation":null,"height":98,"opacity":null,"y":-98});if(__layer_6__.elements !== undefined){var kpisContainer;
({kpisContainer} = __layer_6__.elements);};var __layer_7__ = new Layer({"parent":IntelliStream_App,"name":"Header","backgroundColor":null,"width":1280,"height":70,"constraintValues":{"height":70,"centerAnchorX":0.5,"width":1280,"right":0,"centerAnchorY":0.03589743589743589},"blending":"normal","clip":false,"borderStyle":"solid"});var __layer_8__ = new SVGLayer({"parent":__layer_7__,"name":"notification","backgroundColor":null,"width":33,"strokeWidth":1,"x":1164,"html":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"33\" height=\"34\"><path d=\"M 0 0 L 33 0 L 33 34 L 0 34 Z\" id=\"notification\" fill=\"transparent\" name=\"notification\"><\/path><\/svg>","htmlIntrinsicSize":{"height":34,"width":33},"rotation":null,"height":34,"opacity":null,"y":17});if(__layer_8__.elements !== undefined){var notification;
({notification} = __layer_8__.elements);};var __layer_9__ = new SVGLayer({"parent":__layer_7__,"name":"logo","backgroundColor":null,"width":105,"strokeWidth":1,"x":72,"html":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"105\" height=\"26\"><path d=\"M 0 0 L 105 0 L 105 26 L 0 26 Z\" id=\"logo\" fill=\"transparent\" name=\"logo\"><\/path><\/svg>","htmlIntrinsicSize":{"height":26,"width":105},"rotation":null,"height":26,"opacity":null,"y":21});if(__layer_9__.elements !== undefined){var logo;
({logo} = __layer_9__.elements);};var __layer_10__ = new SVGLayer({"parent":__layer_7__,"name":"search","backgroundColor":null,"width":39,"strokeWidth":1,"x":1110,"html":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"39\" height=\"38\"><path d=\"M 0 0 L 39 0 L 39 38 L 0 38 Z\" id=\"search\" fill=\"transparent\" name=\"search\"><\/path><\/svg>","htmlIntrinsicSize":{"height":38,"width":39},"rotation":null,"height":38,"opacity":null,"y":17});if(__layer_10__.elements !== undefined){var search;
({search} = __layer_10__.elements);};var headerBar = new Layer({"parent":__layer_7__,"name":"headerBar","backgroundColor":null,"width":1280,"height":70,"constraintValues":{"height":70,"centerAnchorX":0.5,"width":1280,"centerAnchorY":0.5,"aspectRatioLocked":true},"blending":"normal","image":"images\/design\/Mrl39bXlfKHdJkQ9b7IICWBtH2XUfqNV3aB0N1QmeuJn2tQJDvrOJbNqGsQSj20OLK3luNFUKq35K0FfkQ.png","clip":true,"borderStyle":"solid"});if(logo !== undefined){logo.__framerInstanceInfo = {"framerClass":"SVGPath","hash":"#vekter|logo","targetName":"logo","vekterClass":"RectangleShapeNode"}};if(__layer_9__ !== undefined){__layer_9__.__framerInstanceInfo = {"hash":"#vekter|__layer_9__","vekterClass":"RectangleShapeNode","framerClass":"SVGLayer"}};if(headerBar !== undefined){headerBar.__framerInstanceInfo = {"originalFilename":"app-header.png","framerClass":"Layer","hash":"#vekter|headerBar","targetName":"headerBar","vekterClass":"ImageNode"}};if(search !== undefined){search.__framerInstanceInfo = {"framerClass":"SVGPath","hash":"#vekter|search","targetName":"search","vekterClass":"RectangleShapeNode"}};if(__layer_7__ !== undefined){__layer_7__.__framerInstanceInfo = {"hash":"#vekter|__layer_7__","vekterClass":"FrameNode","framerClass":"Layer"}};if(__layer_2__ !== undefined){__layer_2__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_2__","vekterClass":"TextNode","text":"AVAILABLE ACTIONS"}};if(__layer_8__ !== undefined){__layer_8__.__framerInstanceInfo = {"hash":"#vekter|__layer_8__","vekterClass":"RectangleShapeNode","framerClass":"SVGLayer"}};if(kpisContainer !== undefined){kpisContainer.__framerInstanceInfo = {"framerClass":"SVGPath","hash":"#vekter|kpisContainer","targetName":"kpisContainer","vekterClass":"RectangleShapeNode"}};if(tableControl !== undefined){tableControl.__framerInstanceInfo = {"originalFilename":"","framerClass":"Layer","hash":"#vekter|tableControl","targetName":"tableControl","vekterClass":"ImageNode"}};if(subHeader !== undefined){subHeader.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|subHeader","targetName":"subHeader","vekterClass":"FrameNode"}};if(__layer_0__ !== undefined){__layer_0__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_0__","vekterClass":"TextNode","text":"SEARCH RESULTS"}};if(SearchHistory !== undefined){SearchHistory.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|SearchHistory","targetName":"SearchHistory","vekterClass":"FrameNode"}};if(__layer_10__ !== undefined){__layer_10__.__framerInstanceInfo = {"hash":"#vekter|__layer_10__","vekterClass":"RectangleShapeNode","framerClass":"SVGLayer"}};if(timeseriesContainer !== undefined){timeseriesContainer.__framerInstanceInfo = {"framerClass":"SVGPath","hash":"#vekter|timeseriesContainer","targetName":"timeseriesContainer","vekterClass":"RectangleShapeNode"}};if(__layer_4__ !== undefined){__layer_4__.__framerInstanceInfo = {"hash":"#vekter|__layer_4__","vekterClass":"FrameNode","framerClass":"Layer"}};if(IntelliStream_App !== undefined){IntelliStream_App.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|IntelliStream_App","targetName":"IntelliStream_App","vekterClass":"FrameNode"}};if(__layer_1__ !== undefined){__layer_1__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_1__","vekterClass":"TextNode","text":"All RESULTS"}};if(__layer_6__ !== undefined){__layer_6__.__framerInstanceInfo = {"hash":"#vekter|__layer_6__","vekterClass":"RectangleShapeNode","framerClass":"SVGLayer"}};if(notification !== undefined){notification.__framerInstanceInfo = {"framerClass":"SVGPath","hash":"#vekter|notification","targetName":"notification","vekterClass":"RectangleShapeNode"}};if(contentFrame !== undefined){contentFrame.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|contentFrame","targetName":"contentFrame","vekterClass":"FrameNode"}};if(__layer_3__ !== undefined){__layer_3__.__framerInstanceInfo = {"originalFilename":"","framerClass":"Layer","hash":"#vekter|__layer_3__","vekterClass":"ImageNode"}};if(facetFrame !== undefined){facetFrame.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|facetFrame","targetName":"facetFrame","vekterClass":"FrameNode"}};if(__layer_5__ !== undefined){__layer_5__.__framerInstanceInfo = {"hash":"#vekter|__layer_5__","vekterClass":"RectangleShapeNode","framerClass":"SVGLayer"}};if (scope["__vekterVariables"]) { scope["__vekterVariables"].map(function(variable) { delete scope[variable] } ) };Object.assign(scope, {IntelliStream_App, SearchHistory, facetFrame, contentFrame, subHeader, timeseriesContainer, tableControl, kpisContainer, notification, logo, search, headerBar});scope["__vekterVariables"] = ["IntelliStream_App", "SearchHistory", "facetFrame", "contentFrame", "subHeader", "timeseriesContainer", "tableControl", "kpisContainer", "notification", "logo", "search", "headerBar"];if (typeof Framer.CurrentContext.layout === 'function') {Framer.CurrentContext.layout()};})(window);