/*!
 * Scroll Lock v1.1.1
 * https://github.com/MohammadYounes/jquery-scrollLock
 *
 * Copyright (c) 2014 Mohammad Younes
 * Licensed under the MIT license.
 */

(function(n){typeof define==="function"&&define.amd?define(["jquery"],n):n(jQuery)})(function(n){function u(n){var t=n.prop("clientWidth"),i=n.prop("offsetWidth"),r=parseInt(n.css("border-right-width"),10),u=parseInt(n.css("border-left-width"),10);return t+u+r<i}var i="onmousewheel"in window?"ActiveXObject"in window?"wheel":"mousewheel":"DOMMouseScroll",t=".scrollLock",r=n.fn.scrollLock;n.fn.scrollLock=function(r,f,e){return typeof f!="string"&&(f=null),(r===undefined||r)&&r!=="off"?this.each(function(){n(this).on(i+t,f,function(t){var i,s;if(!t.ctrlKey&&(i=n(this),e===!0||u(i))){t.stopPropagation();var f=i.scrollTop(),h=i.prop("scrollHeight"),c=i.prop("clientHeight"),o=t.originalEvent.wheelDelta||-1*t.originalEvent.detail||-1*t.originalEvent.deltaY,r=0;t.type==="wheel"&&(s=i.height()/n(window).height(),r=t.originalEvent.deltaY*s);(o>0&&f+r<=0||o<0&&f+r>=h-c)&&(t.preventDefault(),r&&i.scrollTop(f+r))}})}):this.each(function(){n(this).off(t)})};n.fn.scrollLock.noConflict=function(){return n.fn.scrollLock=r,this}});
