(function(scope) {var IntelliStream_App = new Layer({"name":"IntelliStream_App","backgroundColor":"hsl(0, 0%, 100%)","width":1024,"height":768,"constraintValues":{"height":768,"heightFactor":1,"width":1024,"widthFactor":1},"blending":"normal","clip":true,"borderStyle":"solid"});var footerBar = new Layer({"parent":IntelliStream_App,"name":"footerBar","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":36,"constraintValues":{"aspectRatioLocked":true,"height":36,"centerAnchorX":0.5,"width":1024,"bottom":0,"right":0,"top":null,"centerAnchorY":0.9722222222222222},"blending":"normal","image":"images\/design\/fMsHX8MRx9ZZWKmL6ESDTNcimsrFkFNmg8OQxaPqgFHJtGrdOTk34m0vsM0zpfVBm2ov8CIm8kzJARdlcHIg.png","clip":false,"borderStyle":"solid","y":732});var tab = new Layer({"parent":IntelliStream_App,"name":"tab","backgroundColor":null,"width":1440,"height":40,"constraintValues":{"height":40,"centerAnchorX":0.703125,"width":1440,"right":-416,"top":36,"centerAnchorY":0.07291666666666667},"blending":"normal","clip":false,"borderStyle":"solid","y":36});var __layer_0__ = new Layer({"parent":tab,"name":"bg","backgroundColor":"#DCE1E7","width":1878,"height":40,"constraintValues":{"height":40,"centerAnchorX":0.6520833333333333,"width":1878,"bottom":0,"right":-438,"centerAnchorY":0.5},"blending":"normal","clip":false,"borderStyle":"solid"});var __layer_1__ = new Layer({"parent":tab,"name":"well data","backgroundColor":null,"width":441,"x":39,"height":30,"constraintValues":{"left":39,"height":30,"centerAnchorX":0.1802083333333333,"width":441,"right":960,"top":10,"centerAnchorY":0.625},"blending":"normal","clip":false,"borderStyle":"solid","y":10});var __layer_2__ = new SVGLayer({"parent":__layer_1__,"name":".SVGLayer","backgroundColor":"rgba(255,255,255,1)","width":224,"strokeWidth":1,"x":-31,"htmlIntrinsicSize":{"height":30,"width":224},"rotation":null,"height":30,"fill":"rgba(255,255,255,1)","opacity":null,"svg":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"224\" height=\"30\"><path d=\"M 2 0 C 0.895 0 0 0.895 0 2 L 0 30 L 224 30 L 224 2 C 224 0.895 223.105 0 222 0 Z\" name=\"white\"><\/path><\/svg>"});var __layer_3__ = new TextLayer({"parent":__layer_1__,"name":"Input","backgroundColor":null,"width":162,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"15px","WebkitTextFillColor":"rgb(0, 0, 0)","whiteSpace":"pre","letterSpacing":"0.0px","lineHeight":"2.0","tabSize":4,"fontFamily":"\"GEInspiraSans\", sans-serif"},"startIndex":0,"endIndex":20}],"text":"WELL DATA\/PROJECTION"}],"alignment":"center"},"height":30,"constraintValues":{"height":30,"centerAnchorX":0.1836734693877551,"width":162,"centerAnchorY":0.5},"blending":"normal","autoSize":true});var __layer_4__ = new SVGLayer({"parent":__layer_1__,"htmlIntrinsicSize":{"height":30,"width":240},"height":30,"name":".SVGLayer","backgroundColor":null,"opacity":null,"width":240,"strokeWidth":1,"x":-39,"svg":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"240\" height=\"30\"><path d=\"M 0 0 L 0 30 L 240 30 L 240 0 Z\" fill=\"transparent\" name=\"hit area\"><\/path><\/svg>","rotation":null});var __layer_5__ = new Layer({"parent":tab,"name":"well plan","backgroundColor":null,"width":224,"x":248,"height":30,"constraintValues":{"left":248,"height":30,"centerAnchorX":0.25,"width":224,"right":968,"top":10,"centerAnchorY":0.625},"blending":"normal","clip":false,"borderStyle":"solid","y":10});var __layer_6__ = new SVGLayer({"parent":__layer_5__,"name":".SVGLayer","backgroundColor":"rgba(20,61,74,1)","width":224,"strokeWidth":1,"htmlIntrinsicSize":{"height":30,"width":224},"rotation":null,"height":30,"fill":"rgba(20,61,74,1)","opacity":null,"svg":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"224\" height=\"30\"><path d=\"M 2 0 C 0.895 0 0 0.895 0 2 L 0 30 L 224 30 L 224 2 C 224 0.895 223.105 0 222 0 Z\" name=\"blue\"><\/path><\/svg>"});var __layer_7__ = new TextLayer({"parent":__layer_5__,"name":"Output","backgroundColor":null,"width":75,"x":74,"styledText":{"blocks":[{"inlineStyles":[{"css":{"fontSize":"15px","WebkitTextFillColor":"rgb(255, 255, 255)","whiteSpace":"pre","letterSpacing":"0.0px","lineHeight":"2.0","tabSize":4,"fontFamily":"\"GEInspiraSans\", sans-serif"},"startIndex":0,"endIndex":9}],"text":"WELL PLAN"}],"alignment":"center"},"height":30,"constraintValues":{"left":74,"height":30,"centerAnchorX":0.4977678571428572,"width":75,"centerAnchorY":0.5},"blending":"normal","autoSize":true});var __layer_8__ = new SVGLayer({"parent":__layer_5__,"htmlIntrinsicSize":{"height":30,"width":240},"height":30,"name":".SVGLayer","backgroundColor":null,"opacity":null,"width":240,"strokeWidth":1,"x":-8,"svg":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"240\" height=\"30\"><path d=\"M 0 0 L 0 30 L 240 30 L 240 0 Z\" fill=\"transparent\" name=\"hit area\"><\/path><\/svg>","rotation":null});var __layer_9__ = new Layer({"parent":tab,"name":"outline","backgroundColor":null,"width":1440,"height":30,"constraintValues":{"height":30,"centerAnchorX":0.5,"width":1440,"right":0,"top":10,"centerAnchorY":0.625},"blending":"normal","clip":false,"borderStyle":"solid","y":10});var __layer_10__ = new SVGLayer({"parent":__layer_9__,"name":".SVGLayer","backgroundColor":null,"width":1440,"stroke":"rgba(20,61,74,1)","strokeWidth":1,"htmlIntrinsicSize":{"height":30,"width":1440},"rotation":null,"height":30,"opacity":null,"svg":"<svg xmlns=\"http:\/\/www.w3.org\/2000\/svg\" width=\"1440\" height=\"30\"><path d=\"M 0 30 L 8 30 L 8 1.992 C 8 0.898 8.898 0 10.005 0 L 229.995 0 C 231.097 0 232 0.892 232 1.992 L 232 30 L 1440 30\" fill=\"transparent\" stroke-miterlimit=\"10\" name=\"outline\"><\/path><\/svg>"});var headerBar = new Layer({"parent":IntelliStream_App,"name":"headerBar","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":36,"constraintValues":{"height":36,"centerAnchorX":0.5,"width":1024,"right":0,"centerAnchorY":0.0234375},"blending":"normal","image":"images\/design\/i3zNg9kZ1NXk0vKB4zFEZQHEM8KkI2NPmF12UXFqwZ3ebdPkFHYdQAAM75YVwwSwz4FzVz1etiqcZxU1aIhg.png","clip":false,"borderStyle":"solid"});var WLP_Inputs_1 = new Layer({"name":"WLP_Inputs_1","backgroundColor":"rgba(255,255,255,1)","width":1024,"x":2798,"height":5600,"constraintValues":null,"blending":"normal","clip":true,"borderStyle":"solid","y":-8});var $0_1 = new Layer({"parent":WLP_Inputs_1,"name":"0","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":683,"constraintValues":{"height":683,"centerAnchorX":0.5,"width":1024,"right":0,"centerAnchorY":0.08571428571428572,"aspectRatioLocked":true},"blending":"normal","image":"images\/design\/mxUlSMAs4xhX2NYOUrNNHU4ey3aYar1ophJD9H7nnWPy7mQydLpDDaQkcfSFyeZicgXYlf4lN7vqraI1jO53g.png","clip":false,"borderStyle":"solid"});var $1_1 = new Layer({"parent":WLP_Inputs_1,"name":"1","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":981,"constraintValues":{"aspectRatioLocked":true,"height":981,"centerAnchorX":0.5,"width":1024,"right":0,"top":683,"centerAnchorY":0.2095535714285714},"blending":"normal","image":"images\/design\/4WDAMLFbbgaHLf3sXrUfjyb9s4loXOPAgrMBQLOLtwR5PLX0vGwtZaqIbPugYp511DJ4AZwDnxd1be4vHg.png","clip":false,"borderStyle":"solid","y":683});var $2_1 = new Layer({"parent":WLP_Inputs_1,"name":"2","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":512,"constraintValues":{"aspectRatioLocked":true,"height":512,"centerAnchorX":0.5,"width":1024,"right":0,"top":1664,"centerAnchorY":0.3428571428571429},"blending":"normal","image":"images\/design\/9v9kmEBMZgcWkYhHYTPCMB2n2x8BXk3DoNCoXqANDRc1o5DSNsqQc6PwaLETD0pqIUXsaynMmRue6Bcg.png","clip":false,"borderStyle":"solid","y":1664});var $3 = new Layer({"parent":WLP_Inputs_1,"name":"3","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":695,"constraintValues":{"aspectRatioLocked":true,"height":695,"centerAnchorX":0.5,"width":1024,"right":0,"top":2176,"centerAnchorY":0.450625},"blending":"normal","image":"images\/design\/oTBVxUznbYU9XboUe7wrWl6hoDy117Rjh8VV6SRdy0962PdgS5YWRlH3SqUoi92EPajQQHYY1yfHEwQOQY0Og.png","clip":false,"borderStyle":"solid","y":2176});var $4_1 = new Layer({"parent":WLP_Inputs_1,"name":"4","backgroundSize":"fill","backgroundColor":null,"width":1024,"height":806,"constraintValues":{"aspectRatioLocked":true,"height":806,"centerAnchorX":0.5,"width":1024,"bottom":1923,"right":0,"top":null,"centerAnchorY":0.5846428571428571},"blending":"normal","image":"images\/design\/lYoxOdRep8U0VqpAG0OJQ5ygc0UIz0aMWX7OSJTV8vodedG2Rk79JprNrk3M6u1Mqd7mUwf8JtFFTmVhFqpyg.png","clip":false,"borderStyle":"solid","y":2871});if($1_1 !== undefined){$1_1.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|$1_1","targetName":"$1_1","vekterClass":"FrameNode"}};if(__layer_9__ !== undefined){__layer_9__.__framerInstanceInfo = {"hash":"#vekter|__layer_9__","vekterClass":"FrameNode","framerClass":"Layer"}};if(footerBar !== undefined){footerBar.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|footerBar","targetName":"footerBar","vekterClass":"FrameNode"}};if($2_1 !== undefined){$2_1.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|$2_1","targetName":"$2_1","vekterClass":"FrameNode"}};if($4_1 !== undefined){$4_1.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|$4_1","targetName":"$4_1","vekterClass":"FrameNode"}};if(__layer_7__ !== undefined){__layer_7__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_7__","vekterClass":"TextNode","text":"WELL PLAN"}};if(__layer_8__ !== undefined){__layer_8__.__framerInstanceInfo = {"hash":"#vekter|__layer_8__","vekterClass":"PathNode","framerClass":"SVGLayer"}};if(__layer_2__ !== undefined){__layer_2__.__framerInstanceInfo = {"hash":"#vekter|__layer_2__","vekterClass":"PathNode","framerClass":"SVGLayer"}};if(__layer_10__ !== undefined){__layer_10__.__framerInstanceInfo = {"hash":"#vekter|__layer_10__","vekterClass":"PathNode","framerClass":"SVGLayer"}};if(__layer_0__ !== undefined){__layer_0__.__framerInstanceInfo = {"hash":"#vekter|__layer_0__","vekterClass":"FrameNode","framerClass":"Layer"}};if($3 !== undefined){$3.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|$3","targetName":"$3","vekterClass":"FrameNode"}};if($0_1 !== undefined){$0_1.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|$0_1","targetName":"$0_1","vekterClass":"FrameNode"}};if(__layer_4__ !== undefined){__layer_4__.__framerInstanceInfo = {"hash":"#vekter|__layer_4__","vekterClass":"PathNode","framerClass":"SVGLayer"}};if(IntelliStream_App !== undefined){IntelliStream_App.__framerInstanceInfo = {"deviceName":"Apple iPad","framerClass":"Layer","hash":"#vekter|IntelliStream_App","targetName":"IntelliStream_App","vekterClass":"FrameNode","deviceType":"apple-ipad-air-2-space-gray"}};if(__layer_1__ !== undefined){__layer_1__.__framerInstanceInfo = {"hash":"#vekter|__layer_1__","vekterClass":"FrameNode","framerClass":"Layer"}};if(tab !== undefined){tab.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|tab","targetName":"tab","vekterClass":"FrameNode"}};if(__layer_6__ !== undefined){__layer_6__.__framerInstanceInfo = {"hash":"#vekter|__layer_6__","vekterClass":"PathNode","framerClass":"SVGLayer"}};if(headerBar !== undefined){headerBar.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|headerBar","targetName":"headerBar","vekterClass":"FrameNode"}};if(__layer_3__ !== undefined){__layer_3__.__framerInstanceInfo = {"framerClass":"TextLayer","hash":"#vekter|__layer_3__","vekterClass":"TextNode","text":"WELL DATA\/PROJECTION"}};if(WLP_Inputs_1 !== undefined){WLP_Inputs_1.__framerInstanceInfo = {"framerClass":"Layer","hash":"#vekter|WLP_Inputs_1","targetName":"WLP_Inputs_1","vekterClass":"FrameNode"}};if(__layer_5__ !== undefined){__layer_5__.__framerInstanceInfo = {"hash":"#vekter|__layer_5__","vekterClass":"FrameNode","framerClass":"Layer"}};if (scope["__vekterVariables"]) { scope["__vekterVariables"].map(function(variable) { delete scope[variable] } ) };Object.assign(scope, {IntelliStream_App, footerBar, tab, headerBar, WLP_Inputs_1, $0_1, $1_1, $2_1, $3, $4_1});scope["__vekterVariables"] = ["IntelliStream_App", "footerBar", "tab", "headerBar", "WLP_Inputs_1", "$0_1", "$1_1", "$2_1", "$3", "$4_1"];if (typeof Framer.CurrentContext.layout === 'function') {Framer.CurrentContext.layout()};})(window);