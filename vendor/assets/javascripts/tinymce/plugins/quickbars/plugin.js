/**
 * Copyright (c) Tiny Technologies, Inc. All rights reserved.
 * Licensed under the LGPL or a commercial license.
 * For LGPL see License.txt in the project root for license information.
 * For commercial licenses see https://www.tiny.cloud/
 *
 * Version: 5.8.0 (2021-05-06)
 */
!function(){"use strict";var t,e,n,r,o=tinymce.util.Tools.resolve("tinymce.PluginManager"),c=0,a=function(e,t,n){var r,o,i=e.editorUpload.blobCache,u=i.create((r="mceu",o=(new Date).getTime(),r+"_"+Math.floor(1e9*Math.random())+ ++c+String(o)),n,t);i.add(u),e.insertContent(e.dom.createHTML("img",{src:u.blobUri()}))},l=tinymce.util.Tools.resolve("tinymce.util.Promise"),s=tinymce.util.Tools.resolve("tinymce.Env"),f=tinymce.util.Tools.resolve("tinymce.util.Delay"),i=function(u){u.ui.registry.addButton("quickimage",{icon:"image",tooltip:"Insert image",onAction:function(){var i;i=u,new l(function(n){var r=document.createElement("input");r.type="file",r.accept="image/*",r.style.position="fixed",r.style.left="0",r.style.top="0",r.style.opacity="0.001",document.body.appendChild(r),r.addEventListener("change",function(e){n(Array.prototype.slice.call(e.target.files))});var o=function(e){var t=function(){n([]),r.parentNode.removeChild(r)};s.os.isAndroid()&&"remove"!==e.type?f.setEditorTimeout(i,t,0):t(),i.off("focusin remove",o)};i.on("focusin remove",o),r.click()}).then(function(e){var t,n;0<e.length&&(t=e[0],n=t,new l(function(e){var t=new FileReader;t.onloadend=function(){e(t.result.split(",")[1])},t.readAsDataURL(n)}).then(function(e){a(u,e,t)}))})}}),u.ui.registry.addButton("quicktable",{icon:"table",tooltip:"Insert table",onAction:function(){var e,t,n,r,o,i;n=t=2,(e=u).plugins.table?e.plugins.table.insertTable(t,n):(o=t,i=n,(r=e).undoManager.transact(function(){r.insertContent(function(e,t){var n,r,o='<table data-mce-id="mce" style="width: 100%">';for(o+="<tbody>",r=0;r<t;r++){for(o+="<tr>",n=0;n<e;n++)o+="<td><br></td>";o+="</tr>"}return o+="</tbody>",o+="</table>"}(o,i));var e=r.dom.select("*[data-mce-id]")[0];e.removeAttribute("data-mce-id");var t=r.dom.select("td,th",e);r.selection.setCursorLocation(t[0],0)}))}})},u=function(r){return function(e){return n=typeof(t=e),(null===t?"null":"object"==n&&(Array.prototype.isPrototypeOf(t)||t.constructor&&"Array"===t.constructor.name)?"array":"object"==n&&(String.prototype.isPrototypeOf(t)||t.constructor&&"String"===t.constructor.name)?"string":n)===r;var t,n}},d=function(t){return function(e){return typeof e===t}},m=u("string"),g=u("object"),h=u("array"),p=d("boolean"),b=(t=undefined,function(e){return t===e}),y=d("function"),v=function(e){return function(){return e}},k=v(!1),w=v(!0),T=function(){return N},N=(e=function(e){return e.isNone()},{fold:function(e,t){return e()},is:k,isSome:k,isNone:w,getOr:r=function(e){return e},getOrThunk:n=function(e){return e()},getOrDie:function(e){throw new Error(e||"error: getOrDie called on none.")},getOrNull:v(null),getOrUndefined:v(undefined),or:r,orThunk:n,map:T,each:function(){},bind:T,exists:k,forall:w,filter:T,equals:e,equals_:e,toArray:function(){return[]},toString:v("none()")}),q=function(n){var e=v(n),t=function(){return o},r=function(e){return e(n)},o={fold:function(e,t){return t(n)},is:function(e){return n===e},isSome:w,isNone:k,getOr:e,getOrThunk:e,getOrDie:e,getOrNull:e,getOrUndefined:e,or:t,orThunk:t,map:function(e){return q(e(n))},each:function(e){e(n)},bind:r,exists:r,forall:r,filter:function(e){return e(n)?o:N},toArray:function(){return[n]},toString:function(){return"some("+n+")"},equals:function(e){return e.is(n)},equals_:function(e,t){return e.fold(k,function(e){return t(n,e)})}};return o},E={some:q,none:T,from:function(e){return null===e||e===undefined?N:q(e)}};function M(e,t,n,r,o){return e(n,r)?E.some(n):y(o)&&o(n)?E.none():t(n,r,o)}var S,C=function(e){if(null===e||e===undefined)throw new Error("Node cannot be null or undefined");return{dom:e}},O={fromHtml:function(e,t){var n=(t||document).createElement("div");if(n.innerHTML=e,!n.hasChildNodes()||1<n.childNodes.length)throw console.error("HTML does not have a single root node",e),new Error("HTML must have a single root node");return C(n.childNodes[0])},fromTag:function(e,t){var n=(t||document).createElement(e);return C(n)},fromText:function(e,t){var n=(t||document).createTextNode(e);return C(n)},fromDom:C,fromPoint:function(e,t,n){return E.from(e.dom.elementFromPoint(t,n)).map(C)}},x=function(e,t){var n=e.dom;if(1!==n.nodeType)return!1;var r=n;if(r.matches!==undefined)return r.matches(t);if(r.msMatchesSelector!==undefined)return r.msMatchesSelector(t);if(r.webkitMatchesSelector!==undefined)return r.webkitMatchesSelector(t);if(r.mozMatchesSelector!==undefined)return r.mozMatchesSelector(t);throw new Error("Browser lacks native selectors")},A=("undefined"!=typeof window||Function("return this;")(),function(e,t,n){for(var r=e.dom,o=y(n)?n:k;r.parentNode;){r=r.parentNode;var i=O.fromDom(r);if(t(i))return E.some(i);if(o(i))break}return E.none()}),D=function(e,t,n){return A(e,function(e){return x(e,t)},n)},_=(S=m,function(e,t,n){return function(e,t){if(!t(e))throw new Error("Default value doesn't match requested type.")}(n,S),function(e,t){if(h(e)||g(e))throw new Error("expected a string but found: "+e);return b(e)?t:p(e)?!1===e?"":t:e}(e.getParam(t,n),n)}),L=function(o){var e=_(o,"quickbars_insert_toolbar","quickimage quicktable");0<e.trim().length&&o.ui.registry.addContextToolbar("quickblock",{predicate:function(e){var t=O.fromDom(e),n=o.schema.getTextBlockElements(),r=function(e){return e.dom===o.getBody()};return M(x,D,t,"table",r).fold(function(){return M(function(e,t){return t(e)},A,t,function(e){return e.dom.nodeName.toLowerCase()in n&&o.dom.isEmpty(e.dom)},r).isSome()},k)},items:e,position:"line",scope:"editor"})},P=function(n){var r=function(e){return"IMG"===e.nodeName||"FIGURE"===e.nodeName&&/image/i.test(e.className)},e=_(n,"quickbars_image_toolbar","alignleft aligncenter alignright");0<e.trim().length&&n.ui.registry.addContextToolbar("imageselection",{predicate:r,items:e,position:"node"});var t=_(n,"quickbars_selection_toolbar","bold italic | quicklink h2 h3 blockquote");0<t.trim().length&&n.ui.registry.addContextToolbar("textselection",{predicate:function(e){return!r(e)&&!n.selection.isCollapsed()&&(t=e,"false"!==n.dom.getContentEditableParent(t));var t},items:t,position:"selection",scope:"editor"})};o.add("quickbars",function(e){i(e),L(e),P(e)})}();