﻿! function(e) {
    function t(r) {
        if (n[r]) return n[r].exports;
        var i = n[r] = {
            i: r,
            l: !1,
            exports: {}
        };
        return e[r].call(i.exports, i, i.exports, t), i.l = !0, i.exports
    }
    var n = {};
    t.m = e, t.c = n, t.i = function(e) {
        return e
    }, t.d = function(e, n, r) {
        t.o(e, n) || Object.defineProperty(e, n, {
            configurable: !1,
            enumerable: !0,
            get: r
        })
    }, t.n = function(e) {
        var n = e && e.__esModule ? function() {
            return e.default
        } : function() {
            return e
        };
        return t.d(n, "a", n), n
    }, t.o = function(e, t) {
        return Object.prototype.hasOwnProperty.call(e, t)
    }, t.p = "", t(t.s = 13)
}([function(e, t, n) {
    var r, i;
    ! function(t, n) {
        "object" == typeof e && "object" == typeof e.exports ? e.exports = t.document ? n(t, !0) : function(e) {
            if (!e.document) throw new Error("jQuery requires a window with a document");
            return n(e)
        } : n(t)
    }("undefined" != typeof window ? window : this, function(n, o) {
        function a(e) {
            var t = !!e && "length" in e && e.length,
                n = me.type(e);
            return "function" !== n && !me.isWindow(e) && ("array" === n || 0 === t || "number" == typeof t && t > 0 && t - 1 in e)
        }

        function s(e, t, n) {
            if (me.isFunction(t)) return me.grep(e, function(e, r) {
                return !!t.call(e, r, e) !== n
            });
            if (t.nodeType) return me.grep(e, function(e) {
                return e === t !== n
            });
            if ("string" == typeof t) {
                if (Ne.test(t)) return me.filter(t, e, n);
                t = me.filter(t, e)
            }
            return me.grep(e, function(e) {
                return me.inArray(e, t) > -1 !== n
            })
        }

        function l(e, t) {
            do {
                e = e[t]
            } while (e && 1 !== e.nodeType);
            return e
        }

        function u(e) {
            var t = {};
            return me.each(e.match(De) || [], function(e, n) {
                t[n] = !0
            }), t
        }

        function c() {
            se.addEventListener ? (se.removeEventListener("DOMContentLoaded", f), n.removeEventListener("load", f)) : (se.detachEvent("onreadystatechange", f), n.detachEvent("onload", f))
        }

        function f() {
            (se.addEventListener || "load" === n.event.type || "complete" === se.readyState) && (c(), me.ready())
        }

        function d(e, t, n) {
            if (void 0 === n && 1 === e.nodeType) {
                var r = "data-" + t.replace(qe, "-$1").toLowerCase();
                if ("string" == typeof(n = e.getAttribute(r))) {
                    try {
                        n = "true" === n || "false" !== n && ("null" === n ? null : +n + "" === n ? +n : Fe.test(n) ? me.parseJSON(n) : n)
                    } catch (e) {}
                    me.data(e, t, n)
                } else n = void 0
            }
            return n
        }

        function p(e) {
            var t;
            for (t in e)
                if (("data" !== t || !me.isEmptyObject(e[t])) && "toJSON" !== t) return !1;
            return !0
        }

        function h(e, t, n, r) {
            if (_e(e)) {
                var i, o, a = me.expando,
                    s = e.nodeType,
                    l = s ? me.cache : e,
                    u = s ? e[a] : e[a] && a;
                if (u && l[u] && (r || l[u].data) || void 0 !== n || "string" != typeof t) return u || (u = s ? e[a] = ae.pop() || me.guid++ : a), l[u] || (l[u] = s ? {} : {
                    toJSON: me.noop
                }), "object" != typeof t && "function" != typeof t || (r ? l[u] = me.extend(l[u], t) : l[u].data = me.extend(l[u].data, t)), o = l[u], r || (o.data || (o.data = {}), o = o.data), void 0 !== n && (o[me.camelCase(t)] = n), "string" == typeof t ? null == (i = o[t]) && (i = o[me.camelCase(t)]) : i = o, i
            }
        }

        function g(e, t, n) {
            if (_e(e)) {
                var r, i, o = e.nodeType,
                    a = o ? me.cache : e,
                    s = o ? e[me.expando] : me.expando;
                if (a[s]) {
                    if (t && (r = n ? a[s] : a[s].data)) {
                        me.isArray(t) ? t = t.concat(me.map(t, me.camelCase)) : t in r ? t = [t] : (t = me.camelCase(t), t = t in r ? [t] : t.split(" ")), i = t.length;
                        for (; i--;) delete r[t[i]];
                        if (n ? !p(r) : !me.isEmptyObject(r)) return
                    }(n || (delete a[s].data, p(a[s]))) && (o ? me.cleanData([e], !0) : ge.deleteExpando || a != a.window ? delete a[s] : a[s] = void 0)
                }
            }
        }

        function m(e, t, n, r) {
            var i, o = 1,
                a = 20,
                s = r ? function() {
                    return r.cur()
                } : function() {
                    return me.css(e, t, "")
                },
                l = s(),
                u = n && n[3] || (me.cssNumber[t] ? "" : "px"),
                c = (me.cssNumber[t] || "px" !== u && +l) && Pe.exec(me.css(e, t));
            if (c && c[3] !== u) {
                u = u || c[3], n = n || [], c = +l || 1;
                do {
                    o = o || ".5", c /= o, me.style(e, t, c + u)
                } while (o !== (o = s() / l) && 1 !== o && --a)
            }
            return n && (c = +c || +l || 0, i = n[1] ? c + (n[1] + 1) * n[2] : +n[2], r && (r.unit = u, r.start = c, r.end = i)), i
        }

        function v(e) {
            var t = Ve.split("|"),
                n = e.createDocumentFragment();
            if (n.createElement)
                for (; t.length;) n.createElement(t.pop());
            return n
        }

        function y(e, t) {
            var n, r, i = 0,
                o = void 0 !== e.getElementsByTagName ? e.getElementsByTagName(t || "*") : void 0 !== e.querySelectorAll ? e.querySelectorAll(t || "*") : void 0;
            if (!o)
                for (o = [], n = e.childNodes || e; null != (r = n[i]); i++) !t || me.nodeName(r, t) ? o.push(r) : me.merge(o, y(r, t));
            return void 0 === t || t && me.nodeName(e, t) ? me.merge([e], o) : o
        }

        function b(e, t) {
            for (var n, r = 0; null != (n = e[r]); r++) me._data(n, "globalEval", !t || me._data(t[r], "globalEval"))
        }

        function x(e) {
            ze.test(e.type) && (e.defaultChecked = e.checked)
        }

        function w(e, t, n, r, i) {
            for (var o, a, s, l, u, c, f, d = e.length, p = v(t), h = [], g = 0; g < d; g++)
                if ((a = e[g]) || 0 === a)
                    if ("object" === me.type(a)) me.merge(h, a.nodeType ? [a] : a);
                    else if (Ye.test(a)) {
                for (l = l || p.appendChild(t.createElement("div")), u = (Be.exec(a) || ["", ""])[1].toLowerCase(), f = Xe[u] || Xe._default, l.innerHTML = f[1] + me.htmlPrefilter(a) + f[2], o = f[0]; o--;) l = l.lastChild;
                if (!ge.leadingWhitespace && Ue.test(a) && h.push(t.createTextNode(Ue.exec(a)[0])), !ge.tbody)
                    for (a = "table" !== u || Ge.test(a) ? "<table>" !== f[1] || Ge.test(a) ? 0 : l : l.firstChild, o = a && a.childNodes.length; o--;) me.nodeName(c = a.childNodes[o], "tbody") && !c.childNodes.length && a.removeChild(c);
                for (me.merge(h, l.childNodes), l.textContent = ""; l.firstChild;) l.removeChild(l.firstChild);
                l = p.lastChild
            } else h.push(t.createTextNode(a));
            for (l && p.removeChild(l), ge.appendChecked || me.grep(y(h, "input"), x), g = 0; a = h[g++];)
                if (r && me.inArray(a, r) > -1) i && i.push(a);
                else if (s = me.contains(a.ownerDocument, a), l = y(p.appendChild(a), "script"), s && b(l), n)
                for (o = 0; a = l[o++];) We.test(a.type || "") && n.push(a);
            return l = null, p
        }

        function T() {
            return !0
        }

        function k() {
            return !1
        }

        function E() {
            try {
                return se.activeElement
            } catch (e) {}
        }

        function C(e, t, n, r, i, o) {
            var a, s;
            if ("object" == typeof t) {
                "string" != typeof n && (r = r || n, n = void 0);
                for (s in t) C(e, s, n, r, t[s], o);
                return e
            }
            if (null == r && null == i ? (i = n, r = n = void 0) : null == i && ("string" == typeof n ? (i = r, r = void 0) : (i = r, r = n, n = void 0)), !1 === i) i = k;
            else if (!i) return e;
            return 1 === o && (a = i, i = function(e) {
                return me().off(e), a.apply(this, arguments)
            }, i.guid = a.guid || (a.guid = me.guid++)), e.each(function() {
                me.event.add(this, t, i, r, n)
            })
        }

        function N(e, t) {
            return me.nodeName(e, "table") && me.nodeName(11 !== t.nodeType ? t : t.firstChild, "tr") ? e.getElementsByTagName("tbody")[0] || e.appendChild(e.ownerDocument.createElement("tbody")) : e
        }

        function S(e) {
            return e.type = (null !== me.find.attr(e, "type")) + "/" + e.type, e
        }

        function A(e) {
            var t = at.exec(e.type);
            return t ? e.type = t[1] : e.removeAttribute("type"), e
        }

        function L(e, t) {
            if (1 === t.nodeType && me.hasData(e)) {
                var n, r, i, o = me._data(e),
                    a = me._data(t, o),
                    s = o.events;
                if (s) {
                    delete a.handle, a.events = {};
                    for (n in s)
                        for (r = 0, i = s[n].length; r < i; r++) me.event.add(t, n, s[n][r])
                }
                a.data && (a.data = me.extend({}, a.data))
            }
        }

        function j(e, t) {
            var n, r, i;
            if (1 === t.nodeType) {
                if (n = t.nodeName.toLowerCase(), !ge.noCloneEvent && t[me.expando]) {
                    i = me._data(t);
                    for (r in i.events) me.removeEvent(t, r, i.handle);
                    t.removeAttribute(me.expando)
                }
                "script" === n && t.text !== e.text ? (S(t).text = e.text, A(t)) : "object" === n ? (t.parentNode && (t.outerHTML = e.outerHTML), ge.html5Clone && e.innerHTML && !me.trim(t.innerHTML) && (t.innerHTML = e.innerHTML)) : "input" === n && ze.test(e.type) ? (t.defaultChecked = t.checked = e.checked, t.value !== e.value && (t.value = e.value)) : "option" === n ? t.defaultSelected = t.selected = e.defaultSelected : "input" !== n && "textarea" !== n || (t.defaultValue = e.defaultValue)
            }
        }

        function D(e, t, n, r) {
            t = ue.apply([], t);
            var i, o, a, s, l, u, c = 0,
                f = e.length,
                d = f - 1,
                p = t[0],
                h = me.isFunction(p);
            if (h || f > 1 && "string" == typeof p && !ge.checkClone && ot.test(p)) return e.each(function(i) {
                var o = e.eq(i);
                h && (t[0] = p.call(this, i, o.html())), D(o, t, n, r)
            });
            if (f && (u = w(t, e[0].ownerDocument, !1, e, r), i = u.firstChild, 1 === u.childNodes.length && (u = i), i || r)) {
                for (s = me.map(y(u, "script"), S), a = s.length; c < f; c++) o = u, c !== d && (o = me.clone(o, !0, !0), a && me.merge(s, y(o, "script"))), n.call(e[c], o, c);
                if (a)
                    for (l = s[s.length - 1].ownerDocument, me.map(s, A), c = 0; c < a; c++) o = s[c], We.test(o.type || "") && !me._data(o, "globalEval") && me.contains(l, o) && (o.src ? me._evalUrl && me._evalUrl(o.src) : me.globalEval((o.text || o.textContent || o.innerHTML || "").replace(st, "")));
                u = i = null
            }
            return e
        }

        function O(e, t, n) {
            for (var r, i = t ? me.filter(t, e) : e, o = 0; null != (r = i[o]); o++) n || 1 !== r.nodeType || me.cleanData(y(r)), r.parentNode && (n && me.contains(r.ownerDocument, r) && b(y(r, "script")), r.parentNode.removeChild(r));
            return e
        }

        function H(e, t) {
            var n = me(t.createElement(e)).appendTo(t.body),
                r = me.css(n[0], "display");
            return n.detach(), r
        }

        function _(e) {
            var t = se,
                n = ft[e];
            return n || (n = H(e, t), "none" !== n && n || (ct = (ct || me("<iframe frameborder='0' width='0' height='0'/>")).appendTo(t.documentElement), t = (ct[0].contentWindow || ct[0].contentDocument).document, t.write(), t.close(), n = H(e, t), ct.detach()), ft[e] = n), n
        }

        function F(e, t) {
            return {
                get: function() {
                    return e() ? void delete this.get : (this.get = t).apply(this, arguments)
                }
            }
        }

        function q(e) {
            if (e in Nt) return e;
            for (var t = e.charAt(0).toUpperCase() + e.slice(1), n = Ct.length; n--;)
                if ((e = Ct[n] + t) in Nt) return e
        }

        function $(e, t) {
            for (var n, r, i, o = [], a = 0, s = e.length; a < s; a++) r = e[a], r.style && (o[a] = me._data(r, "olddisplay"), n = r.style.display, t ? (o[a] || "none" !== n || (r.style.display = ""), "" === r.style.display && Ie(r) && (o[a] = me._data(r, "olddisplay", _(r.nodeName)))) : (i = Ie(r), (n && "none" !== n || !i) && me._data(r, "olddisplay", i ? n : me.css(r, "display"))));
            for (a = 0; a < s; a++) r = e[a], r.style && (t && "none" !== r.style.display && "" !== r.style.display || (r.style.display = t ? o[a] || "" : "none"));
            return e
        }

        function P(e, t, n) {
            var r = Tt.exec(t);
            return r ? Math.max(0, r[1] - (n || 0)) + (r[2] || "px") : t
        }

        function M(e, t, n, r, i) {
            for (var o = n === (r ? "border" : "content") ? 4 : "width" === t ? 1 : 0, a = 0; o < 4; o += 2) "margin" === n && (a += me.css(e, n + Me[o], !0, i)), r ? ("content" === n && (a -= me.css(e, "padding" + Me[o], !0, i)), "margin" !== n && (a -= me.css(e, "border" + Me[o] + "Width", !0, i))) : (a += me.css(e, "padding" + Me[o], !0, i), "padding" !== n && (a += me.css(e, "border" + Me[o] + "Width", !0, i)));
            return a
        }

        function I(e, t, n) {
            var r = !0,
                i = "width" === t ? e.offsetWidth : e.offsetHeight,
                o = mt(e),
                a = ge.boxSizing && "border-box" === me.css(e, "boxSizing", !1, o);
            if (i <= 0 || null == i) {
                if (i = vt(e, t, o), (i < 0 || null == i) && (i = e.style[t]), pt.test(i)) return i;
                r = a && (ge.boxSizingReliable() || i === e.style[t]), i = parseFloat(i) || 0
            }
            return i + M(e, t, n || (a ? "border" : "content"), r, o) + "px"
        }

        function R(e, t, n, r, i) {
            return new R.prototype.init(e, t, n, r, i)
        }

        function z() {
            return n.setTimeout(function() {
                St = void 0
            }), St = me.now()
        }

        function B(e, t) {
            var n, r = {
                    height: e
                },
                i = 0;
            for (t = t ? 1 : 0; i < 4; i += 2 - t) n = Me[i], r["margin" + n] = r["padding" + n] = e;
            return t && (r.opacity = r.width = e), r
        }

        function W(e, t, n) {
            for (var r, i = (X.tweeners[t] || []).concat(X.tweeners["*"]), o = 0, a = i.length; o < a; o++)
                if (r = i[o].call(n, t, e)) return r
        }

        function U(e, t, n) {
            var r, i, o, a, s, l, u, c = this,
                f = {},
                d = e.style,
                p = e.nodeType && Ie(e),
                h = me._data(e, "fxshow");
            n.queue || (s = me._queueHooks(e, "fx"), null == s.unqueued && (s.unqueued = 0, l = s.empty.fire, s.empty.fire = function() {
                s.unqueued || l()
            }), s.unqueued++, c.always(function() {
                c.always(function() {
                    s.unqueued--, me.queue(e, "fx").length || s.empty.fire()
                })
            })), 1 === e.nodeType && ("height" in t || "width" in t) && (n.overflow = [d.overflow, d.overflowX, d.overflowY], u = me.css(e, "display"), "inline" === ("none" === u ? me._data(e, "olddisplay") || _(e.nodeName) : u) && "none" === me.css(e, "float") && (ge.inlineBlockNeedsLayout && "inline" !== _(e.nodeName) ? d.zoom = 1 : d.display = "inline-block")), n.overflow && (d.overflow = "hidden", ge.shrinkWrapBlocks() || c.always(function() {
                d.overflow = n.overflow[0], d.overflowX = n.overflow[1], d.overflowY = n.overflow[2]
            }));
            for (r in t)
                if (i = t[r], Lt.exec(i)) {
                    if (delete t[r], o = o || "toggle" === i, i === (p ? "hide" : "show")) {
                        if ("show" !== i || !h || void 0 === h[r]) continue;
                        p = !0
                    }
                    f[r] = h && h[r] || me.style(e, r)
                } else u = void 0;
            if (me.isEmptyObject(f)) "inline" === ("none" === u ? _(e.nodeName) : u) && (d.display = u);
            else {
                h ? "hidden" in h && (p = h.hidden) : h = me._data(e, "fxshow", {}), o && (h.hidden = !p), p ? me(e).show() : c.done(function() {
                    me(e).hide()
                }), c.done(function() {
                    var t;
                    me._removeData(e, "fxshow");
                    for (t in f) me.style(e, t, f[t])
                });
                for (r in f) a = W(p ? h[r] : 0, r, c), r in h || (h[r] = a.start, p && (a.end = a.start, a.start = "width" === r || "height" === r ? 1 : 0))
            }
        }

        function V(e, t) {
            var n, r, i, o, a;
            for (n in e)
                if (r = me.camelCase(n), i = t[r], o = e[n], me.isArray(o) && (i = o[1], o = e[n] = o[0]), n !== r && (e[r] = o, delete e[n]), (a = me.cssHooks[r]) && "expand" in a) {
                    o = a.expand(o), delete e[r];
                    for (n in o) n in e || (e[n] = o[n], t[n] = i)
                } else t[r] = i
        }

        function X(e, t, n) {
            var r, i, o = 0,
                a = X.prefilters.length,
                s = me.Deferred().always(function() {
                    delete l.elem
                }),
                l = function() {
                    if (i) return !1;
                    for (var t = St || z(), n = Math.max(0, u.startTime + u.duration - t), r = n / u.duration || 0, o = 1 - r, a = 0, l = u.tweens.length; a < l; a++) u.tweens[a].run(o);
                    return s.notifyWith(e, [u, o, n]), o < 1 && l ? n : (s.resolveWith(e, [u]), !1)
                },
                u = s.promise({
                    elem: e,
                    props: me.extend({}, t),
                    opts: me.extend(!0, {
                        specialEasing: {},
                        easing: me.easing._default
                    }, n),
                    originalProperties: t,
                    originalOptions: n,
                    startTime: St || z(),
                    duration: n.duration,
                    tweens: [],
                    createTween: function(t, n) {
                        var r = me.Tween(e, u.opts, t, n, u.opts.specialEasing[t] || u.opts.easing);
                        return u.tweens.push(r), r
                    },
                    stop: function(t) {
                        var n = 0,
                            r = t ? u.tweens.length : 0;
                        if (i) return this;
                        for (i = !0; n < r; n++) u.tweens[n].run(1);
                        return t ? (s.notifyWith(e, [u, 1, 0]), s.resolveWith(e, [u, t])) : s.rejectWith(e, [u, t]), this
                    }
                }),
                c = u.props;
            for (V(c, u.opts.specialEasing); o < a; o++)
                if (r = X.prefilters[o].call(u, e, c, u.opts)) return me.isFunction(r.stop) && (me._queueHooks(u.elem, u.opts.queue).stop = me.proxy(r.stop, r)), r;
            return me.map(c, W, u), me.isFunction(u.opts.start) && u.opts.start.call(e, u), me.fx.timer(me.extend(l, {
                elem: e,
                anim: u,
                queue: u.opts.queue
            })), u.progress(u.opts.progress).done(u.opts.done, u.opts.complete).fail(u.opts.fail).always(u.opts.always)
        }

        function Y(e) {
            return me.attr(e, "class") || ""
        }

        function G(e) {
            return function(t, n) {
                "string" != typeof t && (n = t, t = "*");
                var r, i = 0,
                    o = t.toLowerCase().match(De) || [];
                if (me.isFunction(n))
                    for (; r = o[i++];) "+" === r.charAt(0) ? (r = r.slice(1) || "*", (e[r] = e[r] || []).unshift(n)) : (e[r] = e[r] || []).push(n)
            }
        }

        function J(e, t, n, r) {
            function i(s) {
                var l;
                return o[s] = !0, me.each(e[s] || [], function(e, s) {
                    var u = s(t, n, r);
                    return "string" != typeof u || a || o[u] ? a ? !(l = u) : void 0 : (t.dataTypes.unshift(u), i(u), !1)
                }), l
            }
            var o = {},
                a = e === en;
            return i(t.dataTypes[0]) || !o["*"] && i("*")
        }

        function Q(e, t) {
            var n, r, i = me.ajaxSettings.flatOptions || {};
            for (r in t) void 0 !== t[r] && ((i[r] ? e : n || (n = {}))[r] = t[r]);
            return n && me.extend(!0, e, n), e
        }

        function K(e, t, n) {
            for (var r, i, o, a, s = e.contents, l = e.dataTypes;
                "*" === l[0];) l.shift(), void 0 === i && (i = e.mimeType || t.getResponseHeader("Content-Type"));
            if (i)
                for (a in s)
                    if (s[a] && s[a].test(i)) {
                        l.unshift(a);
                        break
                    }
            if (l[0] in n) o = l[0];
            else {
                for (a in n) {
                    if (!l[0] || e.converters[a + " " + l[0]]) {
                        o = a;
                        break
                    }
                    r || (r = a)
                }
                o = o || r
            }
            if (o) return o !== l[0] && l.unshift(o), n[o]
        }

        function Z(e, t, n, r) {
            var i, o, a, s, l, u = {},
                c = e.dataTypes.slice();
            if (c[1])
                for (a in e.converters) u[a.toLowerCase()] = e.converters[a];
            for (o = c.shift(); o;)
                if (e.responseFields[o] && (n[e.responseFields[o]] = t), !l && r && e.dataFilter && (t = e.dataFilter(t, e.dataType)), l = o, o = c.shift())
                    if ("*" === o) o = l;
                    else if ("*" !== l && l !== o) {
                if (!(a = u[l + " " + o] || u["* " + o]))
                    for (i in u)
                        if (s = i.split(" "), s[1] === o && (a = u[l + " " + s[0]] || u["* " + s[0]])) {
                            !0 === a ? a = u[i] : !0 !== u[i] && (o = s[0], c.unshift(s[1]));
                            break
                        }
                if (!0 !== a)
                    if (a && e.throws) t = a(t);
                    else try {
                        t = a(t)
                    } catch (e) {
                        return {
                            state: "parsererror",
                            error: a ? e : "No conversion from " + l + " to " + o
                        }
                    }
            }
            return {
                state: "success",
                data: t
            }
        }

        function ee(e) {
            return e.style && e.style.display || me.css(e, "display")
        }

        function te(e) {
            if (!me.contains(e.ownerDocument || se, e)) return !0;
            for (; e && 1 === e.nodeType;) {
                if ("none" === ee(e) || "hidden" === e.type) return !0;
                e = e.parentNode
            }
            return !1
        }

        function ne(e, t, n, r) {
            var i;
            if (me.isArray(t)) me.each(t, function(t, i) {
                n || an.test(e) ? r(e, i) : ne(e + "[" + ("object" == typeof i && null != i ? t : "") + "]", i, n, r)
            });
            else if (n || "object" !== me.type(t)) r(e, t);
            else
                for (i in t) ne(e + "[" + i + "]", t[i], n, r)
        }

        function re() {
            try {
                return new n.XMLHttpRequest
            } catch (e) {}
        }

        function ie() {
            try {
                return new n.ActiveXObject("Microsoft.XMLHTTP")
            } catch (e) {}
        }

        function oe(e) {
            return me.isWindow(e) ? e : 9 === e.nodeType && (e.defaultView || e.parentWindow)
        }
        var ae = [],
            se = n.document,
            le = ae.slice,
            ue = ae.concat,
            ce = ae.push,
            fe = ae.indexOf,
            de = {},
            pe = de.toString,
            he = de.hasOwnProperty,
            ge = {},
            me = function(e, t) {
                return new me.fn.init(e, t)
            },
            ve = /^[\s\uFEFF\xA0]+|[\s\uFEFF\xA0]+$/g,
            ye = /^-ms-/,
            be = /-([\da-z])/gi,
            xe = function(e, t) {
                return t.toUpperCase()
            };
        me.fn = me.prototype = {
            jquery: "1.12.4",
            constructor: me,
            selector: "",
            length: 0,
            toArray: function() {
                return le.call(this)
            },
            get: function(e) {
                return null != e ? e < 0 ? this[e + this.length] : this[e] : le.call(this)
            },
            pushStack: function(e) {
                var t = me.merge(this.constructor(), e);
                return t.prevObject = this, t.context = this.context, t
            },
            each: function(e) {
                return me.each(this, e)
            },
            map: function(e) {
                return this.pushStack(me.map(this, function(t, n) {
                    return e.call(t, n, t)
                }))
            },
            slice: function() {
                return this.pushStack(le.apply(this, arguments))
            },
            first: function() {
                return this.eq(0)
            },
            last: function() {
                return this.eq(-1)
            },
            eq: function(e) {
                var t = this.length,
                    n = +e + (e < 0 ? t : 0);
                return this.pushStack(n >= 0 && n < t ? [this[n]] : [])
            },
            end: function() {
                return this.prevObject || this.constructor()
            },
            push: ce,
            sort: ae.sort,
            splice: ae.splice
        }, me.extend = me.fn.extend = function() {
            var e, t, n, r, i, o, a = arguments[0] || {},
                s = 1,
                l = arguments.length,
                u = !1;
            for ("boolean" == typeof a && (u = a, a = arguments[s] || {}, s++), "object" == typeof a || me.isFunction(a) || (a = {}), s === l && (a = this, s--); s < l; s++)
                if (null != (i = arguments[s]))
                    for (r in i) e = a[r], n = i[r], a !== n && (u && n && (me.isPlainObject(n) || (t = me.isArray(n))) ? (t ? (t = !1, o = e && me.isArray(e) ? e : []) : o = e && me.isPlainObject(e) ? e : {}, a[r] = me.extend(u, o, n)) : void 0 !== n && (a[r] = n));
            return a
        }, me.extend({
            expando: "jQuery" + ("1.12.4" + Math.random()).replace(/\D/g, ""),
            isReady: !0,
            error: function(e) {
                throw new Error(e)
            },
            noop: function() {},
            isFunction: function(e) {
                return "function" === me.type(e)
            },
            isArray: Array.isArray || function(e) {
                return "array" === me.type(e)
            },
            isWindow: function(e) {
                return null != e && e == e.window
            },
            isNumeric: function(e) {
                var t = e && e.toString();
                return !me.isArray(e) && t - parseFloat(t) + 1 >= 0
            },
            isEmptyObject: function(e) {
                var t;
                for (t in e) return !1;
                return !0
            },
            isPlainObject: function(e) {
                var t;
                if (!e || "object" !== me.type(e) || e.nodeType || me.isWindow(e)) return !1;
                try {
                    if (e.constructor && !he.call(e, "constructor") && !he.call(e.constructor.prototype, "isPrototypeOf")) return !1
                } catch (e) {
                    return !1
                }
                if (!ge.ownFirst)
                    for (t in e) return he.call(e, t);
                for (t in e);
                return void 0 === t || he.call(e, t)
            },
            type: function(e) {
                return null == e ? e + "" : "object" == typeof e || "function" == typeof e ? de[pe.call(e)] || "object" : typeof e
            },
            globalEval: function(e) {
                e && me.trim(e) && (n.execScript || function(e) {
                    n.eval.call(n, e)
                })(e)
            },
            camelCase: function(e) {
                return e.replace(ye, "ms-").replace(be, xe)
            },
            nodeName: function(e, t) {
                return e.nodeName && e.nodeName.toLowerCase() === t.toLowerCase()
            },
            each: function(e, t) {
                var n, r = 0;
                if (a(e))
                    for (n = e.length; r < n && !1 !== t.call(e[r], r, e[r]); r++);
                else
                    for (r in e)
                        if (!1 === t.call(e[r], r, e[r])) break;
                return e
            },
            trim: function(e) {
                return null == e ? "" : (e + "").replace(ve, "")
            },
            makeArray: function(e, t) {
                var n = t || [];
                return null != e && (a(Object(e)) ? me.merge(n, "string" == typeof e ? [e] : e) : ce.call(n, e)), n
            },
            inArray: function(e, t, n) {
                var r;
                if (t) {
                    if (fe) return fe.call(t, e, n);
                    for (r = t.length, n = n ? n < 0 ? Math.max(0, r + n) : n : 0; n < r; n++)
                        if (n in t && t[n] === e) return n
                }
                return -1
            },
            merge: function(e, t) {
                for (var n = +t.length, r = 0, i = e.length; r < n;) e[i++] = t[r++];
                if (n !== n)
                    for (; void 0 !== t[r];) e[i++] = t[r++];
                return e.length = i, e
            },
            grep: function(e, t, n) {
                for (var r = [], i = 0, o = e.length, a = !n; i < o; i++) !t(e[i], i) !== a && r.push(e[i]);
                return r
            },
            map: function(e, t, n) {
                var r, i, o = 0,
                    s = [];
                if (a(e))
                    for (r = e.length; o < r; o++) null != (i = t(e[o], o, n)) && s.push(i);
                else
                    for (o in e) null != (i = t(e[o], o, n)) && s.push(i);
                return ue.apply([], s)
            },
            guid: 1,
            proxy: function(e, t) {
                var n, r, i;
                if ("string" == typeof t && (i = e[t], t = e, e = i), me.isFunction(e)) return n = le.call(arguments, 2), r = function() {
                    return e.apply(t || this, n.concat(le.call(arguments)))
                }, r.guid = e.guid = e.guid || me.guid++, r
            },
            now: function() {
                return +new Date
            },
            support: ge
        }), "function" == typeof Symbol && (me.fn[Symbol.iterator] = ae[Symbol.iterator]), me.each("Boolean Number String Function Array Date RegExp Object Error Symbol".split(" "), function(e, t) {
            de["[object " + t + "]"] = t.toLowerCase()
        });
        var we = function(e) {
            function t(e, t, n, r) {
                var i, o, a, s, u, f, d, p, h = t && t.ownerDocument,
                    g = t ? t.nodeType : 9;
                if (n = n || [], "string" != typeof e || !e || 1 !== g && 9 !== g && 11 !== g) return n;
                if (!r && ((t ? t.ownerDocument || t : P) !== j && L(t), t = t || j, O)) {
                    if (11 !== g && (f = ge.exec(e)))
                        if (i = f[1]) {
                            if (9 === g) {
                                if (!(a = t.getElementById(i))) return n;
                                if (a.id === i) return n.push(a), n
                            } else if (h && (a = h.getElementById(i)) && q(t, a) && a.id === i) return n.push(a), n
                        } else {
                            if (f[2]) return J.apply(n, t.getElementsByTagName(e)), n;
                            if ((i = f[3]) && b.getElementsByClassName && t.getElementsByClassName) return J.apply(n, t.getElementsByClassName(i)), n
                        }
                    if (b.qsa && !B[e + " "] && (!H || !H.test(e))) {
                        if (1 !== g) h = t, p = e;
                        else if ("object" !== t.nodeName.toLowerCase()) {
                            for ((s = t.getAttribute("id")) ? s = s.replace(ve, "\\$&") : t.setAttribute("id", s = $), d = k(e), o = d.length, u = ce.test(s) ? "#" + s : "[id='" + s + "']"; o--;) d[o] = u + " " + c(d[o]);
                            p = d.join(","), h = me.test(e) && l(t.parentNode) || t
                        }
                        if (p) try {
                            return J.apply(n, h.querySelectorAll(p)), n
                        } catch (e) {} finally {
                            s === $ && t.removeAttribute("id")
                        }
                    }
                }
                return C(e.replace(oe, "$1"), t, n, r)
            }

            function n() {
                function e(n, r) {
                    return t.push(n + " ") > x.cacheLength && delete e[t.shift()], e[n + " "] = r
                }
                var t = [];
                return e
            }

            function r(e) {
                return e[$] = !0, e
            }

            function i(e) {
                var t = j.createElement("div");
                try {
                    return !!e(t)
                } catch (e) {
                    return !1
                } finally {
                    t.parentNode && t.parentNode.removeChild(t), t = null
                }
            }

            function o(e, t) {
                for (var n = e.split("|"), r = n.length; r--;) x.attrHandle[n[r]] = t
            }

            function a(e, t) {
                var n = t && e,
                    r = n && 1 === e.nodeType && 1 === t.nodeType && (~t.sourceIndex || U) - (~e.sourceIndex || U);
                if (r) return r;
                if (n)
                    for (; n = n.nextSibling;)
                        if (n === t) return -1;
                return e ? 1 : -1
            }

            function s(e) {
                return r(function(t) {
                    return t = +t, r(function(n, r) {
                        for (var i, o = e([], n.length, t), a = o.length; a--;) n[i = o[a]] && (n[i] = !(r[i] = n[i]))
                    })
                })
            }

            function l(e) {
                return e && void 0 !== e.getElementsByTagName && e
            }

            function u() {}

            function c(e) {
                for (var t = 0, n = e.length, r = ""; t < n; t++) r += e[t].value;
                return r
            }

            function f(e, t, n) {
                var r = t.dir,
                    i = n && "parentNode" === r,
                    o = I++;
                return t.first ? function(t, n, o) {
                    for (; t = t[r];)
                        if (1 === t.nodeType || i) return e(t, n, o)
                } : function(t, n, a) {
                    var s, l, u, c = [M, o];
                    if (a) {
                        for (; t = t[r];)
                            if ((1 === t.nodeType || i) && e(t, n, a)) return !0
                    } else
                        for (; t = t[r];)
                            if (1 === t.nodeType || i) {
                                if (u = t[$] || (t[$] = {}), l = u[t.uniqueID] || (u[t.uniqueID] = {}), (s = l[r]) && s[0] === M && s[1] === o) return c[2] = s[2];
                                if (l[r] = c, c[2] = e(t, n, a)) return !0
                            }
                }
            }

            function d(e) {
                return e.length > 1 ? function(t, n, r) {
                    for (var i = e.length; i--;)
                        if (!e[i](t, n, r)) return !1;
                    return !0
                } : e[0]
            }

            function p(e, n, r) {
                for (var i = 0, o = n.length; i < o; i++) t(e, n[i], r);
                return r
            }

            function h(e, t, n, r, i) {
                for (var o, a = [], s = 0, l = e.length, u = null != t; s < l; s++)(o = e[s]) && (n && !n(o, r, i) || (a.push(o), u && t.push(s)));
                return a
            }

            function g(e, t, n, i, o, a) {
                return i && !i[$] && (i = g(i)), o && !o[$] && (o = g(o, a)), r(function(r, a, s, l) {
                    var u, c, f, d = [],
                        g = [],
                        m = a.length,
                        v = r || p(t || "*", s.nodeType ? [s] : s, []),
                        y = !e || !r && t ? v : h(v, d, e, s, l),
                        b = n ? o || (r ? e : m || i) ? [] : a : y;
                    if (n && n(y, b, s, l), i)
                        for (u = h(b, g), i(u, [], s, l), c = u.length; c--;)(f = u[c]) && (b[g[c]] = !(y[g[c]] = f));
                    if (r) {
                        if (o || e) {
                            if (o) {
                                for (u = [], c = b.length; c--;)(f = b[c]) && u.push(y[c] = f);
                                o(null, b = [], u, l)
                            }
                            for (c = b.length; c--;)(f = b[c]) && (u = o ? K(r, f) : d[c]) > -1 && (r[u] = !(a[u] = f))
                        }
                    } else b = h(b === a ? b.splice(m, b.length) : b), o ? o(null, a, b, l) : J.apply(a, b)
                })
            }

            function m(e) {
                for (var t, n, r, i = e.length, o = x.relative[e[0].type], a = o || x.relative[" "], s = o ? 1 : 0, l = f(function(e) {
                        return e === t
                    }, a, !0), u = f(function(e) {
                        return K(t, e) > -1
                    }, a, !0), p = [function(e, n, r) {
                        var i = !o && (r || n !== N) || ((t = n).nodeType ? l(e, n, r) : u(e, n, r));
                        return t = null, i
                    }]; s < i; s++)
                    if (n = x.relative[e[s].type]) p = [f(d(p), n)];
                    else {
                        if (n = x.filter[e[s].type].apply(null, e[s].matches), n[$]) {
                            for (r = ++s; r < i && !x.relative[e[r].type]; r++);
                            return g(s > 1 && d(p), s > 1 && c(e.slice(0, s - 1).concat({
                                value: " " === e[s - 2].type ? "*" : ""
                            })).replace(oe, "$1"), n, s < r && m(e.slice(s, r)), r < i && m(e = e.slice(r)), r < i && c(e))
                        }
                        p.push(n)
                    }
                return d(p)
            }

            function v(e, n) {
                var i = n.length > 0,
                    o = e.length > 0,
                    a = function(r, a, s, l, u) {
                        var c, f, d, p = 0,
                            g = "0",
                            m = r && [],
                            v = [],
                            y = N,
                            b = r || o && x.find.TAG("*", u),
                            w = M += null == y ? 1 : Math.random() || .1,
                            T = b.length;
                        for (u && (N = a === j || a || u); g !== T && null != (c = b[g]); g++) {
                            if (o && c) {
                                for (f = 0, a || c.ownerDocument === j || (L(c), s = !O); d = e[f++];)
                                    if (d(c, a || j, s)) {
                                        l.push(c);
                                        break
                                    }
                                u && (M = w)
                            }
                            i && ((c = !d && c) && p--, r && m.push(c))
                        }
                        if (p += g, i && g !== p) {
                            for (f = 0; d = n[f++];) d(m, v, a, s);
                            if (r) {
                                if (p > 0)
                                    for (; g--;) m[g] || v[g] || (v[g] = Y.call(l));
                                v = h(v)
                            }
                            J.apply(l, v), u && !r && v.length > 0 && p + n.length > 1 && t.uniqueSort(l)
                        }
                        return u && (M = w, N = y), m
                    };
                return i ? r(a) : a
            }
            var y, b, x, w, T, k, E, C, N, S, A, L, j, D, O, H, _, F, q, $ = "sizzle" + 1 * new Date,
                P = e.document,
                M = 0,
                I = 0,
                R = n(),
                z = n(),
                B = n(),
                W = function(e, t) {
                    return e === t && (A = !0), 0
                },
                U = 1 << 31,
                V = {}.hasOwnProperty,
                X = [],
                Y = X.pop,
                G = X.push,
                J = X.push,
                Q = X.slice,
                K = function(e, t) {
                    for (var n = 0, r = e.length; n < r; n++)
                        if (e[n] === t) return n;
                    return -1
                },
                Z = "checked|selected|async|autofocus|autoplay|controls|defer|disabled|hidden|ismap|loop|multiple|open|readonly|required|scoped",
                ee = "[\\x20\\t\\r\\n\\f]",
                te = "(?:\\\\.|[\\w-]|[^\\x00-\\xa0])+",
                ne = "\\[" + ee + "*(" + te + ")(?:" + ee + "*([*^$|!~]?=)" + ee + "*(?:'((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\"|(" + te + "))|)" + ee + "*\\]",
                re = ":(" + te + ")(?:\\((('((?:\\\\.|[^\\\\'])*)'|\"((?:\\\\.|[^\\\\\"])*)\")|((?:\\\\.|[^\\\\()[\\]]|" + ne + ")*)|.*)\\)|)",
                ie = new RegExp(ee + "+", "g"),
                oe = new RegExp("^" + ee + "+|((?:^|[^\\\\])(?:\\\\.)*)" + ee + "+$", "g"),
                ae = new RegExp("^" + ee + "*," + ee + "*"),
                se = new RegExp("^" + ee + "*([>+~]|" + ee + ")" + ee + "*"),
                le = new RegExp("=" + ee + "*([^\\]'\"]*?)" + ee + "*\\]", "g"),
                ue = new RegExp(re),
                ce = new RegExp("^" + te + "$"),
                fe = {
                    ID: new RegExp("^#(" + te + ")"),
                    CLASS: new RegExp("^\\.(" + te + ")"),
                    TAG: new RegExp("^(" + te + "|[*])"),
                    ATTR: new RegExp("^" + ne),
                    PSEUDO: new RegExp("^" + re),
                    CHILD: new RegExp("^:(only|first|last|nth|nth-last)-(child|of-type)(?:\\(" + ee + "*(even|odd|(([+-]|)(\\d*)n|)" + ee + "*(?:([+-]|)" + ee + "*(\\d+)|))" + ee + "*\\)|)", "i"),
                    bool: new RegExp("^(?:" + Z + ")$", "i"),
                    needsContext: new RegExp("^" + ee + "*[>+~]|:(even|odd|eq|gt|lt|nth|first|last)(?:\\(" + ee + "*((?:-\\d)?\\d*)" + ee + "*\\)|)(?=[^-]|$)", "i")
                },
                de = /^(?:input|select|textarea|button)$/i,
                pe = /^h\d$/i,
                he = /^[^{]+\{\s*\[native \w/,
                ge = /^(?:#([\w-]+)|(\w+)|\.([\w-]+))$/,
                me = /[+~]/,
                ve = /'|\\/g,
                ye = new RegExp("\\\\([\\da-f]{1,6}" + ee + "?|(" + ee + ")|.)", "ig"),
                be = function(e, t, n) {
                    var r = "0x" + t - 65536;
                    return r !== r || n ? t : r < 0 ? String.fromCharCode(r + 65536) : String.fromCharCode(r >> 10 | 55296, 1023 & r | 56320)
                },
                xe = function() {
                    L()
                };
            try {
                J.apply(X = Q.call(P.childNodes), P.childNodes), X[P.childNodes.length].nodeType
            } catch (e) {
                J = {
                    apply: X.length ? function(e, t) {
                        G.apply(e, Q.call(t))
                    } : function(e, t) {
                        for (var n = e.length, r = 0; e[n++] = t[r++];);
                        e.length = n - 1
                    }
                }
            }
            b = t.support = {}, T = t.isXML = function(e) {
                var t = e && (e.ownerDocument || e).documentElement;
                return !!t && "HTML" !== t.nodeName
            }, L = t.setDocument = function(e) {
                var t, n, r = e ? e.ownerDocument || e : P;
                return r !== j && 9 === r.nodeType && r.documentElement ? (j = r, D = j.documentElement, O = !T(j), (n = j.defaultView) && n.top !== n && (n.addEventListener ? n.addEventListener("unload", xe, !1) : n.attachEvent && n.attachEvent("onunload", xe)), b.attributes = i(function(e) {
                    return e.className = "i", !e.getAttribute("className")
                }), b.getElementsByTagName = i(function(e) {
                    return e.appendChild(j.createComment("")), !e.getElementsByTagName("*").length
                }), b.getElementsByClassName = he.test(j.getElementsByClassName), b.getById = i(function(e) {
                    return D.appendChild(e).id = $, !j.getElementsByName || !j.getElementsByName($).length
                }), b.getById ? (x.find.ID = function(e, t) {
                    if (void 0 !== t.getElementById && O) {
                        var n = t.getElementById(e);
                        return n ? [n] : []
                    }
                }, x.filter.ID = function(e) {
                    var t = e.replace(ye, be);
                    return function(e) {
                        return e.getAttribute("id") === t
                    }
                }) : (delete x.find.ID, x.filter.ID = function(e) {
                    var t = e.replace(ye, be);
                    return function(e) {
                        var n = void 0 !== e.getAttributeNode && e.getAttributeNode("id");
                        return n && n.value === t
                    }
                }), x.find.TAG = b.getElementsByTagName ? function(e, t) {
                    return void 0 !== t.getElementsByTagName ? t.getElementsByTagName(e) : b.qsa ? t.querySelectorAll(e) : void 0
                } : function(e, t) {
                    var n, r = [],
                        i = 0,
                        o = t.getElementsByTagName(e);
                    if ("*" === e) {
                        for (; n = o[i++];) 1 === n.nodeType && r.push(n);
                        return r
                    }
                    return o
                }, x.find.CLASS = b.getElementsByClassName && function(e, t) {
                    if (void 0 !== t.getElementsByClassName && O) return t.getElementsByClassName(e)
                }, _ = [], H = [], (b.qsa = he.test(j.querySelectorAll)) && (i(function(e) {
                    D.appendChild(e).innerHTML = "<a id='" + $ + "'></a><select id='" + $ + "-\r\\' msallowcapture=''><option selected=''></option></select>", e.querySelectorAll("[msallowcapture^='']").length && H.push("[*^$]=" + ee + "*(?:''|\"\")"), e.querySelectorAll("[selected]").length || H.push("\\[" + ee + "*(?:value|" + Z + ")"), e.querySelectorAll("[id~=" + $ + "-]").length || H.push("~="), e.querySelectorAll(":checked").length || H.push(":checked"), e.querySelectorAll("a#" + $ + "+*").length || H.push(".#.+[+~]")
                }), i(function(e) {
                    var t = j.createElement("input");
                    t.setAttribute("type", "hidden"), e.appendChild(t).setAttribute("name", "D"), e.querySelectorAll("[name=d]").length && H.push("name" + ee + "*[*^$|!~]?="), e.querySelectorAll(":enabled").length || H.push(":enabled", ":disabled"), e.querySelectorAll("*,:x"), H.push(",.*:")
                })), (b.matchesSelector = he.test(F = D.matches || D.webkitMatchesSelector || D.mozMatchesSelector || D.oMatchesSelector || D.msMatchesSelector)) && i(function(e) {
                    b.disconnectedMatch = F.call(e, "div"), F.call(e, "[s!='']:x"), _.push("!=", re)
                }), H = H.length && new RegExp(H.join("|")), _ = _.length && new RegExp(_.join("|")), t = he.test(D.compareDocumentPosition), q = t || he.test(D.contains) ? function(e, t) {
                    var n = 9 === e.nodeType ? e.documentElement : e,
                        r = t && t.parentNode;
                    return e === r || !(!r || 1 !== r.nodeType || !(n.contains ? n.contains(r) : e.compareDocumentPosition && 16 & e.compareDocumentPosition(r)))
                } : function(e, t) {
                    if (t)
                        for (; t = t.parentNode;)
                            if (t === e) return !0;
                    return !1
                }, W = t ? function(e, t) {
                    if (e === t) return A = !0, 0;
                    var n = !e.compareDocumentPosition - !t.compareDocumentPosition;
                    return n || (n = (e.ownerDocument || e) === (t.ownerDocument || t) ? e.compareDocumentPosition(t) : 1, 1 & n || !b.sortDetached && t.compareDocumentPosition(e) === n ? e === j || e.ownerDocument === P && q(P, e) ? -1 : t === j || t.ownerDocument === P && q(P, t) ? 1 : S ? K(S, e) - K(S, t) : 0 : 4 & n ? -1 : 1)
                } : function(e, t) {
                    if (e === t) return A = !0, 0;
                    var n, r = 0,
                        i = e.parentNode,
                        o = t.parentNode,
                        s = [e],
                        l = [t];
                    if (!i || !o) return e === j ? -1 : t === j ? 1 : i ? -1 : o ? 1 : S ? K(S, e) - K(S, t) : 0;
                    if (i === o) return a(e, t);
                    for (n = e; n = n.parentNode;) s.unshift(n);
                    for (n = t; n = n.parentNode;) l.unshift(n);
                    for (; s[r] === l[r];) r++;
                    return r ? a(s[r], l[r]) : s[r] === P ? -1 : l[r] === P ? 1 : 0
                }, j) : j
            }, t.matches = function(e, n) {
                return t(e, null, null, n)
            }, t.matchesSelector = function(e, n) {
                if ((e.ownerDocument || e) !== j && L(e), n = n.replace(le, "='$1']"), b.matchesSelector && O && !B[n + " "] && (!_ || !_.test(n)) && (!H || !H.test(n))) try {
                    var r = F.call(e, n);
                    if (r || b.disconnectedMatch || e.document && 11 !== e.document.nodeType) return r
                } catch (e) {}
                return t(n, j, null, [e]).length > 0
            }, t.contains = function(e, t) {
                return (e.ownerDocument || e) !== j && L(e), q(e, t)
            }, t.attr = function(e, t) {
                (e.ownerDocument || e) !== j && L(e);
                var n = x.attrHandle[t.toLowerCase()],
                    r = n && V.call(x.attrHandle, t.toLowerCase()) ? n(e, t, !O) : void 0;
                return void 0 !== r ? r : b.attributes || !O ? e.getAttribute(t) : (r = e.getAttributeNode(t)) && r.specified ? r.value : null
            }, t.error = function(e) {
                throw new Error("Syntax error, unrecognized expression: " + e)
            }, t.uniqueSort = function(e) {
                var t, n = [],
                    r = 0,
                    i = 0;
                if (A = !b.detectDuplicates, S = !b.sortStable && e.slice(0), e.sort(W), A) {
                    for (; t = e[i++];) t === e[i] && (r = n.push(i));
                    for (; r--;) e.splice(n[r], 1)
                }
                return S = null, e
            }, w = t.getText = function(e) {
                var t, n = "",
                    r = 0,
                    i = e.nodeType;
                if (i) {
                    if (1 === i || 9 === i || 11 === i) {
                        if ("string" == typeof e.textContent) return e.textContent;
                        for (e = e.firstChild; e; e = e.nextSibling) n += w(e)
                    } else if (3 === i || 4 === i) return e.nodeValue
                } else
                    for (; t = e[r++];) n += w(t);
                return n
            }, x = t.selectors = {
                cacheLength: 50,
                createPseudo: r,
                match: fe,
                attrHandle: {},
                find: {},
                relative: {
                    ">": {
                        dir: "parentNode",
                        first: !0
                    },
                    " ": {
                        dir: "parentNode"
                    },
                    "+": {
                        dir: "previousSibling",
                        first: !0
                    },
                    "~": {
                        dir: "previousSibling"
                    }
                },
                preFilter: {
                    ATTR: function(e) {
                        return e[1] = e[1].replace(ye, be), e[3] = (e[3] || e[4] || e[5] || "").replace(ye, be), "~=" === e[2] && (e[3] = " " + e[3] + " "), e.slice(0, 4)
                    },
                    CHILD: function(e) {
                        return e[1] = e[1].toLowerCase(), "nth" === e[1].slice(0, 3) ? (e[3] || t.error(e[0]), e[4] = +(e[4] ? e[5] + (e[6] || 1) : 2 * ("even" === e[3] || "odd" === e[3])), e[5] = +(e[7] + e[8] || "odd" === e[3])) : e[3] && t.error(e[0]), e
                    },
                    PSEUDO: function(e) {
                        var t, n = !e[6] && e[2];
                        return fe.CHILD.test(e[0]) ? null : (e[3] ? e[2] = e[4] || e[5] || "" : n && ue.test(n) && (t = k(n, !0)) && (t = n.indexOf(")", n.length - t) - n.length) && (e[0] = e[0].slice(0, t), e[2] = n.slice(0, t)), e.slice(0, 3))
                    }
                },
                filter: {
                    TAG: function(e) {
                        var t = e.replace(ye, be).toLowerCase();
                        return "*" === e ? function() {
                            return !0
                        } : function(e) {
                            return e.nodeName && e.nodeName.toLowerCase() === t
                        }
                    },
                    CLASS: function(e) {
                        var t = R[e + " "];
                        return t || (t = new RegExp("(^|" + ee + ")" + e + "(" + ee + "|$)")) && R(e, function(e) {
                            return t.test("string" == typeof e.className && e.className || void 0 !== e.getAttribute && e.getAttribute("class") || "")
                        })
                    },
                    ATTR: function(e, n, r) {
                        return function(i) {
                            var o = t.attr(i, e);
                            return null == o ? "!=" === n : !n || (o += "", "=" === n ? o === r : "!=" === n ? o !== r : "^=" === n ? r && 0 === o.indexOf(r) : "*=" === n ? r && o.indexOf(r) > -1 : "$=" === n ? r && o.slice(-r.length) === r : "~=" === n ? (" " + o.replace(ie, " ") + " ").indexOf(r) > -1 : "|=" === n && (o === r || o.slice(0, r.length + 1) === r + "-"))
                        }
                    },
                    CHILD: function(e, t, n, r, i) {
                        var o = "nth" !== e.slice(0, 3),
                            a = "last" !== e.slice(-4),
                            s = "of-type" === t;
                        return 1 === r && 0 === i ? function(e) {
                            return !!e.parentNode
                        } : function(t, n, l) {
                            var u, c, f, d, p, h, g = o !== a ? "nextSibling" : "previousSibling",
                                m = t.parentNode,
                                v = s && t.nodeName.toLowerCase(),
                                y = !l && !s,
                                b = !1;
                            if (m) {
                                if (o) {
                                    for (; g;) {
                                        for (d = t; d = d[g];)
                                            if (s ? d.nodeName.toLowerCase() === v : 1 === d.nodeType) return !1;
                                        h = g = "only" === e && !h && "nextSibling"
                                    }
                                    return !0
                                }
                                if (h = [a ? m.firstChild : m.lastChild], a && y) {
                                    for (d = m, f = d[$] || (d[$] = {}), c = f[d.uniqueID] || (f[d.uniqueID] = {}), u = c[e] || [], p = u[0] === M && u[1], b = p && u[2], d = p && m.childNodes[p]; d = ++p && d && d[g] || (b = p = 0) || h.pop();)
                                        if (1 === d.nodeType && ++b && d === t) {
                                            c[e] = [M, p, b];
                                            break
                                        }
                                } else if (y && (d = t, f = d[$] || (d[$] = {}), c = f[d.uniqueID] || (f[d.uniqueID] = {}), u = c[e] || [], p = u[0] === M && u[1], b = p), !1 === b)
                                    for (;
                                        (d = ++p && d && d[g] || (b = p = 0) || h.pop()) && ((s ? d.nodeName.toLowerCase() !== v : 1 !== d.nodeType) || !++b || (y && (f = d[$] || (d[$] = {}), c = f[d.uniqueID] || (f[d.uniqueID] = {}), c[e] = [M, b]), d !== t)););
                                return (b -= i) === r || b % r == 0 && b / r >= 0
                            }
                        }
                    },
                    PSEUDO: function(e, n) {
                        var i, o = x.pseudos[e] || x.setFilters[e.toLowerCase()] || t.error("unsupported pseudo: " + e);
                        return o[$] ? o(n) : o.length > 1 ? (i = [e, e, "", n], x.setFilters.hasOwnProperty(e.toLowerCase()) ? r(function(e, t) {
                            for (var r, i = o(e, n), a = i.length; a--;) r = K(e, i[a]), e[r] = !(t[r] = i[a])
                        }) : function(e) {
                            return o(e, 0, i)
                        }) : o
                    }
                },
                pseudos: {
                    not: r(function(e) {
                        var t = [],
                            n = [],
                            i = E(e.replace(oe, "$1"));
                        return i[$] ? r(function(e, t, n, r) {
                            for (var o, a = i(e, null, r, []), s = e.length; s--;)(o = a[s]) && (e[s] = !(t[s] = o))
                        }) : function(e, r, o) {
                            return t[0] = e, i(t, null, o, n), t[0] = null, !n.pop()
                        }
                    }),
                    has: r(function(e) {
                        return function(n) {
                            return t(e, n).length > 0
                        }
                    }),
                    contains: r(function(e) {
                        return e = e.replace(ye, be),
                            function(t) {
                                return (t.textContent || t.innerText || w(t)).indexOf(e) > -1
                            }
                    }),
                    lang: r(function(e) {
                        return ce.test(e || "") || t.error("unsupported lang: " + e), e = e.replace(ye, be).toLowerCase(),
                            function(t) {
                                var n;
                                do {
                                    if (n = O ? t.lang : t.getAttribute("xml:lang") || t.getAttribute("lang")) return (n = n.toLowerCase()) === e || 0 === n.indexOf(e + "-")
                                } while ((t = t.parentNode) && 1 === t.nodeType);
                                return !1
                            }
                    }),
                    target: function(t) {
                        var n = e.location && e.location.hash;
                        return n && n.slice(1) === t.id
                    },
                    root: function(e) {
                        return e === D
                    },
                    focus: function(e) {
                        return e === j.activeElement && (!j.hasFocus || j.hasFocus()) && !!(e.type || e.href || ~e.tabIndex)
                    },
                    enabled: function(e) {
                        return !1 === e.disabled
                    },
                    disabled: function(e) {
                        return !0 === e.disabled
                    },
                    checked: function(e) {
                        var t = e.nodeName.toLowerCase();
                        return "input" === t && !!e.checked || "option" === t && !!e.selected
                    },
                    selected: function(e) {
                        return e.parentNode && e.parentNode.selectedIndex, !0 === e.selected
                    },
                    empty: function(e) {
                        for (e = e.firstChild; e; e = e.nextSibling)
                            if (e.nodeType < 6) return !1;
                        return !0
                    },
                    parent: function(e) {
                        return !x.pseudos.empty(e)
                    },
                    header: function(e) {
                        return pe.test(e.nodeName)
                    },
                    input: function(e) {
                        return de.test(e.nodeName)
                    },
                    button: function(e) {
                        var t = e.nodeName.toLowerCase();
                        return "input" === t && "button" === e.type || "button" === t
                    },
                    text: function(e) {
                        var t;
                        return "input" === e.nodeName.toLowerCase() && "text" === e.type && (null == (t = e.getAttribute("type")) || "text" === t.toLowerCase())
                    },
                    first: s(function() {
                        return [0]
                    }),
                    last: s(function(e, t) {
                        return [t - 1]
                    }),
                    eq: s(function(e, t, n) {
                        return [n < 0 ? n + t : n]
                    }),
                    even: s(function(e, t) {
                        for (var n = 0; n < t; n += 2) e.push(n);
                        return e
                    }),
                    odd: s(function(e, t) {
                        for (var n = 1; n < t; n += 2) e.push(n);
                        return e
                    }),
                    lt: s(function(e, t, n) {
                        for (var r = n < 0 ? n + t : n; --r >= 0;) e.push(r);
                        return e
                    }),
                    gt: s(function(e, t, n) {
                        for (var r = n < 0 ? n + t : n; ++r < t;) e.push(r);
                        return e
                    })
                }
            }, x.pseudos.nth = x.pseudos.eq;
            for (y in {
                    radio: !0,
                    checkbox: !0,
                    file: !0,
                    password: !0,
                    image: !0
                }) x.pseudos[y] = function(e) {
                return function(t) {
                    return "input" === t.nodeName.toLowerCase() && t.type === e
                }
            }(y);
            for (y in {
                    submit: !0,
                    reset: !0
                }) x.pseudos[y] = function(e) {
                return function(t) {
                    var n = t.nodeName.toLowerCase();
                    return ("input" === n || "button" === n) && t.type === e
                }
            }(y);
            return u.prototype = x.filters = x.pseudos, x.setFilters = new u, k = t.tokenize = function(e, n) {
                var r, i, o, a, s, l, u, c = z[e + " "];
                if (c) return n ? 0 : c.slice(0);
                for (s = e, l = [], u = x.preFilter; s;) {
                    r && !(i = ae.exec(s)) || (i && (s = s.slice(i[0].length) || s), l.push(o = [])), r = !1, (i = se.exec(s)) && (r = i.shift(), o.push({
                        value: r,
                        type: i[0].replace(oe, " ")
                    }), s = s.slice(r.length));
                    for (a in x.filter) !(i = fe[a].exec(s)) || u[a] && !(i = u[a](i)) || (r = i.shift(), o.push({
                        value: r,
                        type: a,
                        matches: i
                    }), s = s.slice(r.length));
                    if (!r) break
                }
                return n ? s.length : s ? t.error(e) : z(e, l).slice(0)
            }, E = t.compile = function(e, t) {
                var n, r = [],
                    i = [],
                    o = B[e + " "];
                if (!o) {
                    for (t || (t = k(e)), n = t.length; n--;) o = m(t[n]), o[$] ? r.push(o) : i.push(o);
                    o = B(e, v(i, r)), o.selector = e
                }
                return o
            }, C = t.select = function(e, t, n, r) {
                var i, o, a, s, u, f = "function" == typeof e && e,
                    d = !r && k(e = f.selector || e);
                if (n = n || [], 1 === d.length) {
                    if (o = d[0] = d[0].slice(0), o.length > 2 && "ID" === (a = o[0]).type && b.getById && 9 === t.nodeType && O && x.relative[o[1].type]) {
                        if (!(t = (x.find.ID(a.matches[0].replace(ye, be), t) || [])[0])) return n;
                        f && (t = t.parentNode), e = e.slice(o.shift().value.length)
                    }
                    for (i = fe.needsContext.test(e) ? 0 : o.length; i-- && (a = o[i], !x.relative[s = a.type]);)
                        if ((u = x.find[s]) && (r = u(a.matches[0].replace(ye, be), me.test(o[0].type) && l(t.parentNode) || t))) {
                            if (o.splice(i, 1), !(e = r.length && c(o))) return J.apply(n, r), n;
                            break
                        }
                }
                return (f || E(e, d))(r, t, !O, n, !t || me.test(e) && l(t.parentNode) || t), n
            }, b.sortStable = $.split("").sort(W).join("") === $, b.detectDuplicates = !!A, L(), b.sortDetached = i(function(e) {
                return 1 & e.compareDocumentPosition(j.createElement("div"))
            }), i(function(e) {
                return e.innerHTML = "<a href='#'></a>", "#" === e.firstChild.getAttribute("href")
            }) || o("type|href|height|width", function(e, t, n) {
                if (!n) return e.getAttribute(t, "type" === t.toLowerCase() ? 1 : 2)
            }), b.attributes && i(function(e) {
                return e.innerHTML = "<input/>", e.firstChild.setAttribute("value", ""), "" === e.firstChild.getAttribute("value")
            }) || o("value", function(e, t, n) {
                if (!n && "input" === e.nodeName.toLowerCase()) return e.defaultValue
            }), i(function(e) {
                return null == e.getAttribute("disabled")
            }) || o(Z, function(e, t, n) {
                var r;
                if (!n) return !0 === e[t] ? t.toLowerCase() : (r = e.getAttributeNode(t)) && r.specified ? r.value : null
            }), t
        }(n);
        me.find = we, me.expr = we.selectors, me.expr[":"] = me.expr.pseudos, me.uniqueSort = me.unique = we.uniqueSort, me.text = we.getText, me.isXMLDoc = we.isXML, me.contains = we.contains;
        var Te = function(e, t, n) {
                for (var r = [], i = void 0 !== n;
                    (e = e[t]) && 9 !== e.nodeType;)
                    if (1 === e.nodeType) {
                        if (i && me(e).is(n)) break;
                        r.push(e)
                    }
                return r
            },
            ke = function(e, t) {
                for (var n = []; e; e = e.nextSibling) 1 === e.nodeType && e !== t && n.push(e);
                return n
            },
            Ee = me.expr.match.needsContext,
            Ce = /^<([\w-]+)\s*\/?>(?:<\/\1>|)$/,
            Ne = /^.[^:#\[\.,]*$/;
        me.filter = function(e, t, n) {
            var r = t[0];
            return n && (e = ":not(" + e + ")"), 1 === t.length && 1 === r.nodeType ? me.find.matchesSelector(r, e) ? [r] : [] : me.find.matches(e, me.grep(t, function(e) {
                return 1 === e.nodeType
            }))
        }, me.fn.extend({
            find: function(e) {
                var t, n = [],
                    r = this,
                    i = r.length;
                if ("string" != typeof e) return this.pushStack(me(e).filter(function() {
                    for (t = 0; t < i; t++)
                        if (me.contains(r[t], this)) return !0
                }));
                for (t = 0; t < i; t++) me.find(e, r[t], n);
                return n = this.pushStack(i > 1 ? me.unique(n) : n), n.selector = this.selector ? this.selector + " " + e : e, n
            },
            filter: function(e) {
                return this.pushStack(s(this, e || [], !1))
            },
            not: function(e) {
                return this.pushStack(s(this, e || [], !0))
            },
            is: function(e) {
                return !!s(this, "string" == typeof e && Ee.test(e) ? me(e) : e || [], !1).length
            }
        });
        var Se, Ae = /^(?:\s*(<[\w\W]+>)[^>]*|#([\w-]*))$/;
        (me.fn.init = function(e, t, n) {
            var r, i;
            if (!e) return this;
            if (n = n || Se, "string" == typeof e) {
                if (!(r = "<" === e.charAt(0) && ">" === e.charAt(e.length - 1) && e.length >= 3 ? [null, e, null] : Ae.exec(e)) || !r[1] && t) return !t || t.jquery ? (t || n).find(e) : this.constructor(t).find(e);
                if (r[1]) {
                    if (t = t instanceof me ? t[0] : t, me.merge(this, me.parseHTML(r[1], t && t.nodeType ? t.ownerDocument || t : se, !0)), Ce.test(r[1]) && me.isPlainObject(t))
                        for (r in t) me.isFunction(this[r]) ? this[r](t[r]) : this.attr(r, t[r]);
                    return this
                }
                if ((i = se.getElementById(r[2])) && i.parentNode) {
                    if (i.id !== r[2]) return Se.find(e);
                    this.length = 1, this[0] = i
                }
                return this.context = se, this.selector = e, this
            }
            return e.nodeType ? (this.context = this[0] = e, this.length = 1, this) : me.isFunction(e) ? void 0 !== n.ready ? n.ready(e) : e(me) : (void 0 !== e.selector && (this.selector = e.selector, this.context = e.context), me.makeArray(e, this))
        }).prototype = me.fn, Se = me(se);
        var Le = /^(?:parents|prev(?:Until|All))/,
            je = {
                children: !0,
                contents: !0,
                next: !0,
                prev: !0
            };
        me.fn.extend({
            has: function(e) {
                var t, n = me(e, this),
                    r = n.length;
                return this.filter(function() {
                    for (t = 0; t < r; t++)
                        if (me.contains(this, n[t])) return !0
                })
            },
            closest: function(e, t) {
                for (var n, r = 0, i = this.length, o = [], a = Ee.test(e) || "string" != typeof e ? me(e, t || this.context) : 0; r < i; r++)
                    for (n = this[r]; n && n !== t; n = n.parentNode)
                        if (n.nodeType < 11 && (a ? a.index(n) > -1 : 1 === n.nodeType && me.find.matchesSelector(n, e))) {
                            o.push(n);
                            break
                        }
                return this.pushStack(o.length > 1 ? me.uniqueSort(o) : o)
            },
            index: function(e) {
                return e ? "string" == typeof e ? me.inArray(this[0], me(e)) : me.inArray(e.jquery ? e[0] : e, this) : this[0] && this[0].parentNode ? this.first().prevAll().length : -1
            },
            add: function(e, t) {
                return this.pushStack(me.uniqueSort(me.merge(this.get(), me(e, t))))
            },
            addBack: function(e) {
                return this.add(null == e ? this.prevObject : this.prevObject.filter(e))
            }
        }), me.each({
            parent: function(e) {
                var t = e.parentNode;
                return t && 11 !== t.nodeType ? t : null
            },
            parents: function(e) {
                return Te(e, "parentNode")
            },
            parentsUntil: function(e, t, n) {
                return Te(e, "parentNode", n)
            },
            next: function(e) {
                return l(e, "nextSibling")
            },
            prev: function(e) {
                return l(e, "previousSibling")
            },
            nextAll: function(e) {
                return Te(e, "nextSibling")
            },
            prevAll: function(e) {
                return Te(e, "previousSibling")
            },
            nextUntil: function(e, t, n) {
                return Te(e, "nextSibling", n)
            },
            prevUntil: function(e, t, n) {
                return Te(e, "previousSibling", n)
            },
            siblings: function(e) {
                return ke((e.parentNode || {}).firstChild, e)
            },
            children: function(e) {
                return ke(e.firstChild)
            },
            contents: function(e) {
                return me.nodeName(e, "iframe") ? e.contentDocument || e.contentWindow.document : me.merge([], e.childNodes)
            }
        }, function(e, t) {
            me.fn[e] = function(n, r) {
                var i = me.map(this, t, n);
                return "Until" !== e.slice(-5) && (r = n), r && "string" == typeof r && (i = me.filter(r, i)), this.length > 1 && (je[e] || (i = me.uniqueSort(i)), Le.test(e) && (i = i.reverse())), this.pushStack(i)
            }
        });
        var De = /\S+/g;
        me.Callbacks = function(e) {
            e = "string" == typeof e ? u(e) : me.extend({}, e);
            var t, n, r, i, o = [],
                a = [],
                s = -1,
                l = function() {
                    for (i = e.once, r = t = !0; a.length; s = -1)
                        for (n = a.shift(); ++s < o.length;) !1 === o[s].apply(n[0], n[1]) && e.stopOnFalse && (s = o.length, n = !1);
                    e.memory || (n = !1), t = !1, i && (o = n ? [] : "")
                },
                c = {
                    add: function() {
                        return o && (n && !t && (s = o.length - 1, a.push(n)), function t(n) {
                            me.each(n, function(n, r) {
                                me.isFunction(r) ? e.unique && c.has(r) || o.push(r) : r && r.length && "string" !== me.type(r) && t(r)
                            })
                        }(arguments), n && !t && l()), this
                    },
                    remove: function() {
                        return me.each(arguments, function(e, t) {
                            for (var n;
                                (n = me.inArray(t, o, n)) > -1;) o.splice(n, 1), n <= s && s--
                        }), this
                    },
                    has: function(e) {
                        return e ? me.inArray(e, o) > -1 : o.length > 0
                    },
                    empty: function() {
                        return o && (o = []), this
                    },
                    disable: function() {
                        return i = a = [], o = n = "", this
                    },
                    disabled: function() {
                        return !o
                    },
                    lock: function() {
                        return i = !0, n || c.disable(), this
                    },
                    locked: function() {
                        return !!i
                    },
                    fireWith: function(e, n) {
                        return i || (n = n || [], n = [e, n.slice ? n.slice() : n], a.push(n), t || l()), this
                    },
                    fire: function() {
                        return c.fireWith(this, arguments), this
                    },
                    fired: function() {
                        return !!r
                    }
                };
            return c
        }, me.extend({
            Deferred: function(e) {
                var t = [
                        ["resolve", "done", me.Callbacks("once memory"), "resolved"],
                        ["reject", "fail", me.Callbacks("once memory"), "rejected"],
                        ["notify", "progress", me.Callbacks("memory")]
                    ],
                    n = "pending",
                    r = {
                        state: function() {
                            return n
                        },
                        always: function() {
                            return i.done(arguments).fail(arguments), this
                        },
                        then: function() {
                            var e = arguments;
                            return me.Deferred(function(n) {
                                me.each(t, function(t, o) {
                                    var a = me.isFunction(e[t]) && e[t];
                                    i[o[1]](function() {
                                        var e = a && a.apply(this, arguments);
                                        e && me.isFunction(e.promise) ? e.promise().progress(n.notify).done(n.resolve).fail(n.reject) : n[o[0] + "With"](this === r ? n.promise() : this, a ? [e] : arguments)
                                    })
                                }), e = null
                            }).promise()
                        },
                        promise: function(e) {
                            return null != e ? me.extend(e, r) : r
                        }
                    },
                    i = {};
                return r.pipe = r.then, me.each(t, function(e, o) {
                    var a = o[2],
                        s = o[3];
                    r[o[1]] = a.add, s && a.add(function() {
                        n = s
                    }, t[1 ^ e][2].disable, t[2][2].lock), i[o[0]] = function() {
                        return i[o[0] + "With"](this === i ? r : this, arguments), this
                    }, i[o[0] + "With"] = a.fireWith
                }), r.promise(i), e && e.call(i, i), i
            },
            when: function(e) {
                var t, n, r, i = 0,
                    o = le.call(arguments),
                    a = o.length,
                    s = 1 !== a || e && me.isFunction(e.promise) ? a : 0,
                    l = 1 === s ? e : me.Deferred(),
                    u = function(e, n, r) {
                        return function(i) {
                            n[e] = this, r[e] = arguments.length > 1 ? le.call(arguments) : i, r === t ? l.notifyWith(n, r) : --s || l.resolveWith(n, r)
                        }
                    };
                if (a > 1)
                    for (t = new Array(a), n = new Array(a), r = new Array(a); i < a; i++) o[i] && me.isFunction(o[i].promise) ? o[i].promise().progress(u(i, n, t)).done(u(i, r, o)).fail(l.reject) : --s;
                return s || l.resolveWith(r, o), l.promise()
            }
        });
        var Oe;
        me.fn.ready = function(e) {
            return me.ready.promise().done(e), this
        }, me.extend({
            isReady: !1,
            readyWait: 1,
            holdReady: function(e) {
                e ? me.readyWait++ : me.ready(!0)
            },
            ready: function(e) {
                (!0 === e ? --me.readyWait : me.isReady) || (me.isReady = !0, !0 !== e && --me.readyWait > 0 || (Oe.resolveWith(se, [me]), me.fn.triggerHandler && (me(se).triggerHandler("ready"), me(se).off("ready"))))
            }
        }), me.ready.promise = function(e) {
            if (!Oe)
                if (Oe = me.Deferred(), "complete" === se.readyState || "loading" !== se.readyState && !se.documentElement.doScroll) n.setTimeout(me.ready);
                else if (se.addEventListener) se.addEventListener("DOMContentLoaded", f), n.addEventListener("load", f);
            else {
                se.attachEvent("onreadystatechange", f), n.attachEvent("onload", f);
                var t = !1;
                try {
                    t = null == n.frameElement && se.documentElement
                } catch (e) {}
                t && t.doScroll && function e() {
                    if (!me.isReady) {
                        try {
                            t.doScroll("left")
                        } catch (t) {
                            return n.setTimeout(e, 50)
                        }
                        c(), me.ready()
                    }
                }()
            }
            return Oe.promise(e)
        }, me.ready.promise();
        var He;
        for (He in me(ge)) break;
        ge.ownFirst = "0" === He, ge.inlineBlockNeedsLayout = !1, me(function() {
                var e, t, n, r;
                (n = se.getElementsByTagName("body")[0]) && n.style && (t = se.createElement("div"), r = se.createElement("div"), r.style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px", n.appendChild(r).appendChild(t), void 0 !== t.style.zoom && (t.style.cssText = "display:inline;margin:0;border:0;padding:1px;width:1px;zoom:1", ge.inlineBlockNeedsLayout = e = 3 === t.offsetWidth, e && (n.style.zoom = 1)), n.removeChild(r))
            }),
            function() {
                var e = se.createElement("div");
                ge.deleteExpando = !0;
                try {
                    delete e.test
                } catch (e) {
                    ge.deleteExpando = !1
                }
                e = null
            }();
        var _e = function(e) {
                var t = me.noData[(e.nodeName + " ").toLowerCase()],
                    n = +e.nodeType || 1;
                return (1 === n || 9 === n) && (!t || !0 !== t && e.getAttribute("classid") === t)
            },
            Fe = /^(?:\{[\w\W]*\}|\[[\w\W]*\])$/,
            qe = /([A-Z])/g;
        me.extend({
                cache: {},
                noData: {
                    "applet ": !0,
                    "embed ": !0,
                    "object ": "clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
                },
                hasData: function(e) {
                    return !!(e = e.nodeType ? me.cache[e[me.expando]] : e[me.expando]) && !p(e)
                },
                data: function(e, t, n) {
                    return h(e, t, n)
                },
                removeData: function(e, t) {
                    return g(e, t)
                },
                _data: function(e, t, n) {
                    return h(e, t, n, !0)
                },
                _removeData: function(e, t) {
                    return g(e, t, !0)
                }
            }), me.fn.extend({
                data: function(e, t) {
                    var n, r, i, o = this[0],
                        a = o && o.attributes;
                    if (void 0 === e) {
                        if (this.length && (i = me.data(o), 1 === o.nodeType && !me._data(o, "parsedAttrs"))) {
                            for (n = a.length; n--;) a[n] && (r = a[n].name, 0 === r.indexOf("data-") && (r = me.camelCase(r.slice(5)), d(o, r, i[r])));
                            me._data(o, "parsedAttrs", !0)
                        }
                        return i
                    }
                    return "object" == typeof e ? this.each(function() {
                        me.data(this, e)
                    }) : arguments.length > 1 ? this.each(function() {
                        me.data(this, e, t)
                    }) : o ? d(o, e, me.data(o, e)) : void 0
                },
                removeData: function(e) {
                    return this.each(function() {
                        me.removeData(this, e)
                    })
                }
            }), me.extend({
                queue: function(e, t, n) {
                    var r;
                    if (e) return t = (t || "fx") + "queue", r = me._data(e, t), n && (!r || me.isArray(n) ? r = me._data(e, t, me.makeArray(n)) : r.push(n)), r || []
                },
                dequeue: function(e, t) {
                    t = t || "fx";
                    var n = me.queue(e, t),
                        r = n.length,
                        i = n.shift(),
                        o = me._queueHooks(e, t),
                        a = function() {
                            me.dequeue(e, t)
                        };
                    "inprogress" === i && (i = n.shift(), r--), i && ("fx" === t && n.unshift("inprogress"), delete o.stop, i.call(e, a, o)), !r && o && o.empty.fire()
                },
                _queueHooks: function(e, t) {
                    var n = t + "queueHooks";
                    return me._data(e, n) || me._data(e, n, {
                        empty: me.Callbacks("once memory").add(function() {
                            me._removeData(e, t + "queue"), me._removeData(e, n)
                        })
                    })
                }
            }), me.fn.extend({
                queue: function(e, t) {
                    var n = 2;
                    return "string" != typeof e && (t = e, e = "fx", n--), arguments.length < n ? me.queue(this[0], e) : void 0 === t ? this : this.each(function() {
                        var n = me.queue(this, e, t);
                        me._queueHooks(this, e), "fx" === e && "inprogress" !== n[0] && me.dequeue(this, e)
                    })
                },
                dequeue: function(e) {
                    return this.each(function() {
                        me.dequeue(this, e)
                    })
                },
                clearQueue: function(e) {
                    return this.queue(e || "fx", [])
                },
                promise: function(e, t) {
                    var n, r = 1,
                        i = me.Deferred(),
                        o = this,
                        a = this.length,
                        s = function() {
                            --r || i.resolveWith(o, [o])
                        };
                    for ("string" != typeof e && (t = e, e = void 0), e = e || "fx"; a--;)(n = me._data(o[a], e + "queueHooks")) && n.empty && (r++, n.empty.add(s));
                    return s(), i.promise(t)
                }
            }),
            function() {
                var e;
                ge.shrinkWrapBlocks = function() {
                    if (null != e) return e;
                    e = !1;
                    var t, n, r;
                    return (n = se.getElementsByTagName("body")[0]) && n.style ? (t = se.createElement("div"), r = se.createElement("div"), r.style.cssText = "position:absolute;border:0;width:0;height:0;top:0;left:-9999px", n.appendChild(r).appendChild(t), void 0 !== t.style.zoom && (t.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:1px;width:1px;zoom:1", t.appendChild(se.createElement("div")).style.width = "5px", e = 3 !== t.offsetWidth), n.removeChild(r), e) : void 0
                }
            }();
        var $e = /[+-]?(?:\d*\.|)\d+(?:[eE][+-]?\d+|)/.source,
            Pe = new RegExp("^(?:([+-])=|)(" + $e + ")([a-z%]*)$", "i"),
            Me = ["Top", "Right", "Bottom", "Left"],
            Ie = function(e, t) {
                return e = t || e, "none" === me.css(e, "display") || !me.contains(e.ownerDocument, e)
            },
            Re = function(e, t, n, r, i, o, a) {
                var s = 0,
                    l = e.length,
                    u = null == n;
                if ("object" === me.type(n)) {
                    i = !0;
                    for (s in n) Re(e, t, s, n[s], !0, o, a)
                } else if (void 0 !== r && (i = !0, me.isFunction(r) || (a = !0), u && (a ? (t.call(e, r), t = null) : (u = t, t = function(e, t, n) {
                        return u.call(me(e), n)
                    })), t))
                    for (; s < l; s++) t(e[s], n, a ? r : r.call(e[s], s, t(e[s], n)));
                return i ? e : u ? t.call(e) : l ? t(e[0], n) : o
            },
            ze = /^(?:checkbox|radio)$/i,
            Be = /<([\w:-]+)/,
            We = /^$|\/(?:java|ecma)script/i,
            Ue = /^\s+/,
            Ve = "abbr|article|aside|audio|bdi|canvas|data|datalist|details|dialog|figcaption|figure|footer|header|hgroup|main|mark|meter|nav|output|picture|progress|section|summary|template|time|video";
        ! function() {
            var e = se.createElement("div"),
                t = se.createDocumentFragment(),
                n = se.createElement("input");
            e.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", ge.leadingWhitespace = 3 === e.firstChild.nodeType, ge.tbody = !e.getElementsByTagName("tbody").length, ge.htmlSerialize = !!e.getElementsByTagName("link").length, ge.html5Clone = "<:nav></:nav>" !== se.createElement("nav").cloneNode(!0).outerHTML, n.type = "checkbox", n.checked = !0, t.appendChild(n), ge.appendChecked = n.checked, e.innerHTML = "<textarea>x</textarea>", ge.noCloneChecked = !!e.cloneNode(!0).lastChild.defaultValue, t.appendChild(e), n = se.createElement("input"), n.setAttribute("type", "radio"), n.setAttribute("checked", "checked"), n.setAttribute("name", "t"), e.appendChild(n), ge.checkClone = e.cloneNode(!0).cloneNode(!0).lastChild.checked, ge.noCloneEvent = !!e.addEventListener, e[me.expando] = 1, ge.attributes = !e.getAttribute(me.expando)
        }();
        var Xe = {
            option: [1, "<select multiple='multiple'>", "</select>"],
            legend: [1, "<fieldset>", "</fieldset>"],
            area: [1, "<map>", "</map>"],
            param: [1, "<object>", "</object>"],
            thead: [1, "<table>", "</table>"],
            tr: [2, "<table><tbody>", "</tbody></table>"],
            col: [2, "<table><tbody></tbody><colgroup>", "</colgroup></table>"],
            td: [3, "<table><tbody><tr>", "</tr></tbody></table>"],
            _default: ge.htmlSerialize ? [0, "", ""] : [1, "X<div>", "</div>"]
        };
        Xe.optgroup = Xe.option, Xe.tbody = Xe.tfoot = Xe.colgroup = Xe.caption = Xe.thead, Xe.th = Xe.td;
        var Ye = /<|&#?\w+;/,
            Ge = /<tbody/i;
        ! function() {
            var e, t, r = se.createElement("div");
            for (e in {
                    submit: !0,
                    change: !0,
                    focusin: !0
                }) t = "on" + e, (ge[e] = t in n) || (r.setAttribute(t, "t"), ge[e] = !1 === r.attributes[t].expando);
            r = null
        }();
        var Je = /^(?:input|select|textarea)$/i,
            Qe = /^key/,
            Ke = /^(?:mouse|pointer|contextmenu|drag|drop)|click/,
            Ze = /^(?:focusinfocus|focusoutblur)$/,
            et = /^([^.]*)(?:\.(.+)|)/;
        me.event = {
            global: {},
            add: function(e, t, n, r, i) {
                var o, a, s, l, u, c, f, d, p, h, g, m = me._data(e);
                if (m) {
                    for (n.handler && (l = n, n = l.handler, i = l.selector), n.guid || (n.guid = me.guid++), (a = m.events) || (a = m.events = {}), (c = m.handle) || (c = m.handle = function(e) {
                            return void 0 === me || e && me.event.triggered === e.type ? void 0 : me.event.dispatch.apply(c.elem, arguments)
                        }, c.elem = e), t = (t || "").match(De) || [""], s = t.length; s--;) o = et.exec(t[s]) || [], p = g = o[1], h = (o[2] || "").split(".").sort(), p && (u = me.event.special[p] || {}, p = (i ? u.delegateType : u.bindType) || p, u = me.event.special[p] || {}, f = me.extend({
                        type: p,
                        origType: g,
                        data: r,
                        handler: n,
                        guid: n.guid,
                        selector: i,
                        needsContext: i && me.expr.match.needsContext.test(i),
                        namespace: h.join(".")
                    }, l), (d = a[p]) || (d = a[p] = [], d.delegateCount = 0, u.setup && !1 !== u.setup.call(e, r, h, c) || (e.addEventListener ? e.addEventListener(p, c, !1) : e.attachEvent && e.attachEvent("on" + p, c))), u.add && (u.add.call(e, f), f.handler.guid || (f.handler.guid = n.guid)), i ? d.splice(d.delegateCount++, 0, f) : d.push(f), me.event.global[p] = !0);
                    e = null
                }
            },
            remove: function(e, t, n, r, i) {
                var o, a, s, l, u, c, f, d, p, h, g, m = me.hasData(e) && me._data(e);
                if (m && (c = m.events)) {
                    for (t = (t || "").match(De) || [""], u = t.length; u--;)
                        if (s = et.exec(t[u]) || [], p = g = s[1], h = (s[2] || "").split(".").sort(), p) {
                            for (f = me.event.special[p] || {}, p = (r ? f.delegateType : f.bindType) || p, d = c[p] || [], s = s[2] && new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)"), l = o = d.length; o--;) a = d[o], !i && g !== a.origType || n && n.guid !== a.guid || s && !s.test(a.namespace) || r && r !== a.selector && ("**" !== r || !a.selector) || (d.splice(o, 1), a.selector && d.delegateCount--, f.remove && f.remove.call(e, a));
                            l && !d.length && (f.teardown && !1 !== f.teardown.call(e, h, m.handle) || me.removeEvent(e, p, m.handle), delete c[p])
                        } else
                            for (p in c) me.event.remove(e, p + t[u], n, r, !0);
                    me.isEmptyObject(c) && (delete m.handle, me._removeData(e, "events"))
                }
            },
            trigger: function(e, t, r, i) {
                var o, a, s, l, u, c, f, d = [r || se],
                    p = he.call(e, "type") ? e.type : e,
                    h = he.call(e, "namespace") ? e.namespace.split(".") : [];
                if (s = c = r = r || se, 3 !== r.nodeType && 8 !== r.nodeType && !Ze.test(p + me.event.triggered) && (p.indexOf(".") > -1 && (h = p.split("."), p = h.shift(), h.sort()), a = p.indexOf(":") < 0 && "on" + p, e = e[me.expando] ? e : new me.Event(p, "object" == typeof e && e), e.isTrigger = i ? 2 : 3, e.namespace = h.join("."), e.rnamespace = e.namespace ? new RegExp("(^|\\.)" + h.join("\\.(?:.*\\.|)") + "(\\.|$)") : null, e.result = void 0, e.target || (e.target = r), t = null == t ? [e] : me.makeArray(t, [e]), u = me.event.special[p] || {}, i || !u.trigger || !1 !== u.trigger.apply(r, t))) {
                    if (!i && !u.noBubble && !me.isWindow(r)) {
                        for (l = u.delegateType || p, Ze.test(l + p) || (s = s.parentNode); s; s = s.parentNode) d.push(s), c = s;
                        c === (r.ownerDocument || se) && d.push(c.defaultView || c.parentWindow || n)
                    }
                    for (f = 0;
                        (s = d[f++]) && !e.isPropagationStopped();) e.type = f > 1 ? l : u.bindType || p, o = (me._data(s, "events") || {})[e.type] && me._data(s, "handle"), o && o.apply(s, t), (o = a && s[a]) && o.apply && _e(s) && (e.result = o.apply(s, t), !1 === e.result && e.preventDefault());
                    if (e.type = p, !i && !e.isDefaultPrevented() && (!u._default || !1 === u._default.apply(d.pop(), t)) && _e(r) && a && r[p] && !me.isWindow(r)) {
                        c = r[a], c && (r[a] = null), me.event.triggered = p;
                        try {
                            r[p]()
                        } catch (e) {}
                        me.event.triggered = void 0, c && (r[a] = c)
                    }
                    return e.result
                }
            },
            dispatch: function(e) {
                e = me.event.fix(e);
                var t, n, r, i, o, a = [],
                    s = le.call(arguments),
                    l = (me._data(this, "events") || {})[e.type] || [],
                    u = me.event.special[e.type] || {};
                if (s[0] = e, e.delegateTarget = this, !u.preDispatch || !1 !== u.preDispatch.call(this, e)) {
                    for (a = me.event.handlers.call(this, e, l), t = 0;
                        (i = a[t++]) && !e.isPropagationStopped();)
                        for (e.currentTarget = i.elem, n = 0;
                            (o = i.handlers[n++]) && !e.isImmediatePropagationStopped();) e.rnamespace && !e.rnamespace.test(o.namespace) || (e.handleObj = o, e.data = o.data, void 0 !== (r = ((me.event.special[o.origType] || {}).handle || o.handler).apply(i.elem, s)) && !1 === (e.result = r) && (e.preventDefault(), e.stopPropagation()));
                    return u.postDispatch && u.postDispatch.call(this, e), e.result
                }
            },
            handlers: function(e, t) {
                var n, r, i, o, a = [],
                    s = t.delegateCount,
                    l = e.target;
                if (s && l.nodeType && ("click" !== e.type || isNaN(e.button) || e.button < 1))
                    for (; l != this; l = l.parentNode || this)
                        if (1 === l.nodeType && (!0 !== l.disabled || "click" !== e.type)) {
                            for (r = [], n = 0; n < s; n++) o = t[n], i = o.selector + " ", void 0 === r[i] && (r[i] = o.needsContext ? me(i, this).index(l) > -1 : me.find(i, this, null, [l]).length), r[i] && r.push(o);
                            r.length && a.push({
                                elem: l,
                                handlers: r
                            })
                        }
                return s < t.length && a.push({
                    elem: this,
                    handlers: t.slice(s)
                }), a
            },
            fix: function(e) {
                if (e[me.expando]) return e;
                var t, n, r, i = e.type,
                    o = e,
                    a = this.fixHooks[i];
                for (a || (this.fixHooks[i] = a = Ke.test(i) ? this.mouseHooks : Qe.test(i) ? this.keyHooks : {}), r = a.props ? this.props.concat(a.props) : this.props, e = new me.Event(o), t = r.length; t--;) n = r[t], e[n] = o[n];
                return e.target || (e.target = o.srcElement || se), 3 === e.target.nodeType && (e.target = e.target.parentNode), e.metaKey = !!e.metaKey, a.filter ? a.filter(e, o) : e
            },
            props: "altKey bubbles cancelable ctrlKey currentTarget detail eventPhase metaKey relatedTarget shiftKey target timeStamp view which".split(" "),
            fixHooks: {},
            keyHooks: {
                props: "char charCode key keyCode".split(" "),
                filter: function(e, t) {
                    return null == e.which && (e.which = null != t.charCode ? t.charCode : t.keyCode), e
                }
            },
            mouseHooks: {
                props: "button buttons clientX clientY fromElement offsetX offsetY pageX pageY screenX screenY toElement".split(" "),
                filter: function(e, t) {
                    var n, r, i, o = t.button,
                        a = t.fromElement;
                    return null == e.pageX && null != t.clientX && (r = e.target.ownerDocument || se, i = r.documentElement, n = r.body, e.pageX = t.clientX + (i && i.scrollLeft || n && n.scrollLeft || 0) - (i && i.clientLeft || n && n.clientLeft || 0), e.pageY = t.clientY + (i && i.scrollTop || n && n.scrollTop || 0) - (i && i.clientTop || n && n.clientTop || 0)), !e.relatedTarget && a && (e.relatedTarget = a === e.target ? t.toElement : a), e.which || void 0 === o || (e.which = 1 & o ? 1 : 2 & o ? 3 : 4 & o ? 2 : 0), e
                }
            },
            special: {
                load: {
                    noBubble: !0
                },
                focus: {
                    trigger: function() {
                        if (this !== E() && this.focus) try {
                            return this.focus(), !1
                        } catch (e) {}
                    },
                    delegateType: "focusin"
                },
                blur: {
                    trigger: function() {
                        if (this === E() && this.blur) return this.blur(), !1
                    },
                    delegateType: "focusout"
                },
                click: {
                    trigger: function() {
                        if (me.nodeName(this, "input") && "checkbox" === this.type && this.click) return this.click(), !1
                    },
                    _default: function(e) {
                        return me.nodeName(e.target, "a")
                    }
                },
                beforeunload: {
                    postDispatch: function(e) {
                        void 0 !== e.result && e.originalEvent && (e.originalEvent.returnValue = e.result)
                    }
                }
            },
            simulate: function(e, t, n) {
                var r = me.extend(new me.Event, n, {
                    type: e,
                    isSimulated: !0
                });
                me.event.trigger(r, null, t), r.isDefaultPrevented() && n.preventDefault()
            }
        }, me.removeEvent = se.removeEventListener ? function(e, t, n) {
            e.removeEventListener && e.removeEventListener(t, n)
        } : function(e, t, n) {
            var r = "on" + t;
            e.detachEvent && (void 0 === e[r] && (e[r] = null), e.detachEvent(r, n))
        }, me.Event = function(e, t) {
            if (!(this instanceof me.Event)) return new me.Event(e, t);
            e && e.type ? (this.originalEvent = e, this.type = e.type, this.isDefaultPrevented = e.defaultPrevented || void 0 === e.defaultPrevented && !1 === e.returnValue ? T : k) : this.type = e, t && me.extend(this, t), this.timeStamp = e && e.timeStamp || me.now(), this[me.expando] = !0
        }, me.Event.prototype = {
            constructor: me.Event,
            isDefaultPrevented: k,
            isPropagationStopped: k,
            isImmediatePropagationStopped: k,
            preventDefault: function() {
                var e = this.originalEvent;
                this.isDefaultPrevented = T, e && (e.preventDefault ? e.preventDefault() : e.returnValue = !1)
            },
            stopPropagation: function() {
                var e = this.originalEvent;
                this.isPropagationStopped = T, e && !this.isSimulated && (e.stopPropagation && e.stopPropagation(), e.cancelBubble = !0)
            },
            stopImmediatePropagation: function() {
                var e = this.originalEvent;
                this.isImmediatePropagationStopped = T, e && e.stopImmediatePropagation && e.stopImmediatePropagation(), this.stopPropagation()
            }
        }, me.each({
            mouseenter: "mouseover",
            mouseleave: "mouseout",
            pointerenter: "pointerover",
            pointerleave: "pointerout"
        }, function(e, t) {
            me.event.special[e] = {
                delegateType: t,
                bindType: t,
                handle: function(e) {
                    var n, r = this,
                        i = e.relatedTarget,
                        o = e.handleObj;
                    return i && (i === r || me.contains(r, i)) || (e.type = o.origType, n = o.handler.apply(this, arguments), e.type = t), n
                }
            }
        }), ge.submit || (me.event.special.submit = {
            setup: function() {
                if (me.nodeName(this, "form")) return !1;
                me.event.add(this, "click._submit keypress._submit", function(e) {
                    var t = e.target,
                        n = me.nodeName(t, "input") || me.nodeName(t, "button") ? me.prop(t, "form") : void 0;
                    n && !me._data(n, "submit") && (me.event.add(n, "submit._submit", function(e) {
                        e._submitBubble = !0
                    }), me._data(n, "submit", !0))
                })
            },
            postDispatch: function(e) {
                e._submitBubble && (delete e._submitBubble, this.parentNode && !e.isTrigger && me.event.simulate("submit", this.parentNode, e))
            },
            teardown: function() {
                if (me.nodeName(this, "form")) return !1;
                me.event.remove(this, "._submit")
            }
        }), ge.change || (me.event.special.change = {
            setup: function() {
                if (Je.test(this.nodeName)) return "checkbox" !== this.type && "radio" !== this.type || (me.event.add(this, "propertychange._change", function(e) {
                    "checked" === e.originalEvent.propertyName && (this._justChanged = !0)
                }), me.event.add(this, "click._change", function(e) {
                    this._justChanged && !e.isTrigger && (this._justChanged = !1), me.event.simulate("change", this, e)
                })), !1;
                me.event.add(this, "beforeactivate._change", function(e) {
                    var t = e.target;
                    Je.test(t.nodeName) && !me._data(t, "change") && (me.event.add(t, "change._change", function(e) {
                        !this.parentNode || e.isSimulated || e.isTrigger || me.event.simulate("change", this.parentNode, e)
                    }), me._data(t, "change", !0))
                })
            },
            handle: function(e) {
                var t = e.target;
                if (this !== t || e.isSimulated || e.isTrigger || "radio" !== t.type && "checkbox" !== t.type) return e.handleObj.handler.apply(this, arguments)
            },
            teardown: function() {
                return me.event.remove(this, "._change"), !Je.test(this.nodeName)
            }
        }), ge.focusin || me.each({
            focus: "focusin",
            blur: "focusout"
        }, function(e, t) {
            var n = function(e) {
                me.event.simulate(t, e.target, me.event.fix(e))
            };
            me.event.special[t] = {
                setup: function() {
                    var r = this.ownerDocument || this,
                        i = me._data(r, t);
                    i || r.addEventListener(e, n, !0), me._data(r, t, (i || 0) + 1)
                },
                teardown: function() {
                    var r = this.ownerDocument || this,
                        i = me._data(r, t) - 1;
                    i ? me._data(r, t, i) : (r.removeEventListener(e, n, !0), me._removeData(r, t))
                }
            }
        }), me.fn.extend({
            on: function(e, t, n, r) {
                return C(this, e, t, n, r)
            },
            one: function(e, t, n, r) {
                return C(this, e, t, n, r, 1)
            },
            off: function(e, t, n) {
                var r, i;
                if (e && e.preventDefault && e.handleObj) return r = e.handleObj, me(e.delegateTarget).off(r.namespace ? r.origType + "." + r.namespace : r.origType, r.selector, r.handler), this;
                if ("object" == typeof e) {
                    for (i in e) this.off(i, t, e[i]);
                    return this
                }
                return !1 !== t && "function" != typeof t || (n = t, t = void 0), !1 === n && (n = k), this.each(function() {
                    me.event.remove(this, e, n, t)
                })
            },
            trigger: function(e, t) {
                return this.each(function() {
                    me.event.trigger(e, t, this)
                })
            },
            triggerHandler: function(e, t) {
                var n = this[0];
                if (n) return me.event.trigger(e, t, n, !0)
            }
        });
        var tt = / jQuery\d+="(?:null|\d+)"/g,
            nt = new RegExp("<(?:" + Ve + ")[\\s/>]", "i"),
            rt = /<(?!area|br|col|embed|hr|img|input|link|meta|param)(([\w:-]+)[^>]*)\/>/gi,
            it = /<script|<style|<link/i,
            ot = /checked\s*(?:[^=]|=\s*.checked.)/i,
            at = /^true\/(.*)/,
            st = /^\s*<!(?:\[CDATA\[|--)|(?:\]\]|--)>\s*$/g,
            lt = v(se),
            ut = lt.appendChild(se.createElement("div"));
        me.extend({
            htmlPrefilter: function(e) {
                return e.replace(rt, "<$1></$2>")
            },
            clone: function(e, t, n) {
                var r, i, o, a, s, l = me.contains(e.ownerDocument, e);
                if (ge.html5Clone || me.isXMLDoc(e) || !nt.test("<" + e.nodeName + ">") ? o = e.cloneNode(!0) : (ut.innerHTML = e.outerHTML, ut.removeChild(o = ut.firstChild)), !(ge.noCloneEvent && ge.noCloneChecked || 1 !== e.nodeType && 11 !== e.nodeType || me.isXMLDoc(e)))
                    for (r = y(o), s = y(e), a = 0; null != (i = s[a]); ++a) r[a] && j(i, r[a]);
                if (t)
                    if (n)
                        for (s = s || y(e), r = r || y(o), a = 0; null != (i = s[a]); a++) L(i, r[a]);
                    else L(e, o);
                return r = y(o, "script"), r.length > 0 && b(r, !l && y(e, "script")), r = s = i = null, o
            },
            cleanData: function(e, t) {
                for (var n, r, i, o, a = 0, s = me.expando, l = me.cache, u = ge.attributes, c = me.event.special; null != (n = e[a]); a++)
                    if ((t || _e(n)) && (i = n[s], o = i && l[i])) {
                        if (o.events)
                            for (r in o.events) c[r] ? me.event.remove(n, r) : me.removeEvent(n, r, o.handle);
                        l[i] && (delete l[i], u || void 0 === n.removeAttribute ? n[s] = void 0 : n.removeAttribute(s), ae.push(i))
                    }
            }
        }), me.fn.extend({
            domManip: D,
            detach: function(e) {
                return O(this, e, !0)
            },
            remove: function(e) {
                return O(this, e)
            },
            text: function(e) {
                return Re(this, function(e) {
                    return void 0 === e ? me.text(this) : this.empty().append((this[0] && this[0].ownerDocument || se).createTextNode(e))
                }, null, e, arguments.length)
            },
            append: function() {
                return D(this, arguments, function(e) {
                    if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                        N(this, e).appendChild(e)
                    }
                })
            },
            prepend: function() {
                return D(this, arguments, function(e) {
                    if (1 === this.nodeType || 11 === this.nodeType || 9 === this.nodeType) {
                        var t = N(this, e);
                        t.insertBefore(e, t.firstChild)
                    }
                })
            },
            before: function() {
                return D(this, arguments, function(e) {
                    this.parentNode && this.parentNode.insertBefore(e, this)
                })
            },
            after: function() {
                return D(this, arguments, function(e) {
                    this.parentNode && this.parentNode.insertBefore(e, this.nextSibling)
                })
            },
            empty: function() {
                for (var e, t = 0; null != (e = this[t]); t++) {
                    for (1 === e.nodeType && me.cleanData(y(e, !1)); e.firstChild;) e.removeChild(e.firstChild);
                    e.options && me.nodeName(e, "select") && (e.options.length = 0)
                }
                return this
            },
            clone: function(e, t) {
                return e = null != e && e, t = null == t ? e : t, this.map(function() {
                    return me.clone(this, e, t)
                })
            },
            html: function(e) {
                return Re(this, function(e) {
                    var t = this[0] || {},
                        n = 0,
                        r = this.length;
                    if (void 0 === e) return 1 === t.nodeType ? t.innerHTML.replace(tt, "") : void 0;
                    if ("string" == typeof e && !it.test(e) && (ge.htmlSerialize || !nt.test(e)) && (ge.leadingWhitespace || !Ue.test(e)) && !Xe[(Be.exec(e) || ["", ""])[1].toLowerCase()]) {
                        e = me.htmlPrefilter(e);
                        try {
                            for (; n < r; n++) t = this[n] || {}, 1 === t.nodeType && (me.cleanData(y(t, !1)), t.innerHTML = e);
                            t = 0
                        } catch (e) {}
                    }
                    t && this.empty().append(e)
                }, null, e, arguments.length)
            },
            replaceWith: function() {
                var e = [];
                return D(this, arguments, function(t) {
                    var n = this.parentNode;
                    me.inArray(this, e) < 0 && (me.cleanData(y(this)), n && n.replaceChild(t, this))
                }, e)
            }
        }), me.each({
            appendTo: "append",
            prependTo: "prepend",
            insertBefore: "before",
            insertAfter: "after",
            replaceAll: "replaceWith"
        }, function(e, t) {
            me.fn[e] = function(e) {
                for (var n, r = 0, i = [], o = me(e), a = o.length - 1; r <= a; r++) n = r === a ? this : this.clone(!0), me(o[r])[t](n), ce.apply(i, n.get());
                return this.pushStack(i)
            }
        });
        var ct, ft = {
                HTML: "block",
                BODY: "block"
            },
            dt = /^margin/,
            pt = new RegExp("^(" + $e + ")(?!px)[a-z%]+$", "i"),
            ht = function(e, t, n, r) {
                var i, o, a = {};
                for (o in t) a[o] = e.style[o], e.style[o] = t[o];
                i = n.apply(e, r || []);
                for (o in t) e.style[o] = a[o];
                return i
            },
            gt = se.documentElement;
        ! function() {
            function e() {
                var e, c, f = se.documentElement;
                f.appendChild(l), u.style.cssText = "-webkit-box-sizing:border-box;box-sizing:border-box;position:relative;display:block;margin:auto;border:1px;padding:1px;top:1%;width:50%", t = i = s = !1, r = a = !0, n.getComputedStyle && (c = n.getComputedStyle(u), t = "1%" !== (c || {}).top, s = "2px" === (c || {}).marginLeft, i = "4px" === (c || {
                    width: "4px"
                }).width, u.style.marginRight = "50%", r = "4px" === (c || {
                    marginRight: "4px"
                }).marginRight, e = u.appendChild(se.createElement("div")), e.style.cssText = u.style.cssText = "-webkit-box-sizing:content-box;-moz-box-sizing:content-box;box-sizing:content-box;display:block;margin:0;border:0;padding:0", e.style.marginRight = e.style.width = "0", u.style.width = "1px", a = !parseFloat((n.getComputedStyle(e) || {}).marginRight), u.removeChild(e)), u.style.display = "none", o = 0 === u.getClientRects().length, o && (u.style.display = "", u.innerHTML = "<table><tr><td></td><td>t</td></tr></table>", u.childNodes[0].style.borderCollapse = "separate", e = u.getElementsByTagName("td"), e[0].style.cssText = "margin:0;border:0;padding:0;display:none", (o = 0 === e[0].offsetHeight) && (e[0].style.display = "", e[1].style.display = "none", o = 0 === e[0].offsetHeight)), f.removeChild(l)
            }
            var t, r, i, o, a, s, l = se.createElement("div"),
                u = se.createElement("div");
            u.style && (u.style.cssText = "float:left;opacity:.5", ge.opacity = "0.5" === u.style.opacity, ge.cssFloat = !!u.style.cssFloat, u.style.backgroundClip = "content-box", u.cloneNode(!0).style.backgroundClip = "", ge.clearCloneStyle = "content-box" === u.style.backgroundClip, l = se.createElement("div"), l.style.cssText = "border:0;width:8px;height:0;top:0;left:-9999px;padding:0;margin-top:1px;position:absolute", u.innerHTML = "", l.appendChild(u), ge.boxSizing = "" === u.style.boxSizing || "" === u.style.MozBoxSizing || "" === u.style.WebkitBoxSizing, me.extend(ge, {
                reliableHiddenOffsets: function() {
                    return null == t && e(), o
                },
                boxSizingReliable: function() {
                    return null == t && e(), i
                },
                pixelMarginRight: function() {
                    return null == t && e(), r
                },
                pixelPosition: function() {
                    return null == t && e(), t
                },
                reliableMarginRight: function() {
                    return null == t && e(), a
                },
                reliableMarginLeft: function() {
                    return null == t && e(), s
                }
            }))
        }();
        var mt, vt, yt = /^(top|right|bottom|left)$/;
        n.getComputedStyle ? (mt = function(e) {
            var t = e.ownerDocument.defaultView;
            return t && t.opener || (t = n), t.getComputedStyle(e)
        }, vt = function(e, t, n) {
            var r, i, o, a, s = e.style;
            return n = n || mt(e), a = n ? n.getPropertyValue(t) || n[t] : void 0, "" !== a && void 0 !== a || me.contains(e.ownerDocument, e) || (a = me.style(e, t)), n && !ge.pixelMarginRight() && pt.test(a) && dt.test(t) && (r = s.width, i = s.minWidth, o = s.maxWidth, s.minWidth = s.maxWidth = s.width = a, a = n.width, s.width = r, s.minWidth = i, s.maxWidth = o), void 0 === a ? a : a + ""
        }) : gt.currentStyle && (mt = function(e) {
            return e.currentStyle
        }, vt = function(e, t, n) {
            var r, i, o, a, s = e.style;
            return n = n || mt(e), a = n ? n[t] : void 0, null == a && s && s[t] && (a = s[t]), pt.test(a) && !yt.test(t) && (r = s.left, i = e.runtimeStyle, o = i && i.left, o && (i.left = e.currentStyle.left), s.left = "fontSize" === t ? "1em" : a, a = s.pixelLeft + "px", s.left = r, o && (i.left = o)), void 0 === a ? a : a + "" || "auto"
        });
        var bt = /alpha\([^)]*\)/i,
            xt = /opacity\s*=\s*([^)]*)/i,
            wt = /^(none|table(?!-c[ea]).+)/,
            Tt = new RegExp("^(" + $e + ")(.*)$", "i"),
            kt = {
                position: "absolute",
                visibility: "hidden",
                display: "block"
            },
            Et = {
                letterSpacing: "0",
                fontWeight: "400"
            },
            Ct = ["Webkit", "O", "Moz", "ms"],
            Nt = se.createElement("div").style;
        me.extend({
            cssHooks: {
                opacity: {
                    get: function(e, t) {
                        if (t) {
                            var n = vt(e, "opacity");
                            return "" === n ? "1" : n
                        }
                    }
                }
            },
            cssNumber: {
                animationIterationCount: !0,
                columnCount: !0,
                fillOpacity: !0,
                flexGrow: !0,
                flexShrink: !0,
                fontWeight: !0,
                lineHeight: !0,
                opacity: !0,
                order: !0,
                orphans: !0,
                widows: !0,
                zIndex: !0,
                zoom: !0
            },
            cssProps: {
                float: ge.cssFloat ? "cssFloat" : "styleFloat"
            },
            style: function(e, t, n, r) {
                if (e && 3 !== e.nodeType && 8 !== e.nodeType && e.style) {
                    var i, o, a, s = me.camelCase(t),
                        l = e.style;
                    if (t = me.cssProps[s] || (me.cssProps[s] = q(s) || s), a = me.cssHooks[t] || me.cssHooks[s], void 0 === n) return a && "get" in a && void 0 !== (i = a.get(e, !1, r)) ? i : l[t];
                    if (o = typeof n, "string" === o && (i = Pe.exec(n)) && i[1] && (n = m(e, t, i), o = "number"), null != n && n === n && ("number" === o && (n += i && i[3] || (me.cssNumber[s] ? "" : "px")), ge.clearCloneStyle || "" !== n || 0 !== t.indexOf("background") || (l[t] = "inherit"), !(a && "set" in a && void 0 === (n = a.set(e, n, r))))) try {
                        l[t] = n
                    } catch (e) {}
                }
            },
            css: function(e, t, n, r) {
                var i, o, a, s = me.camelCase(t);
                return t = me.cssProps[s] || (me.cssProps[s] = q(s) || s), a = me.cssHooks[t] || me.cssHooks[s], a && "get" in a && (o = a.get(e, !0, n)), void 0 === o && (o = vt(e, t, r)), "normal" === o && t in Et && (o = Et[t]), "" === n || n ? (i = parseFloat(o), !0 === n || isFinite(i) ? i || 0 : o) : o
            }
        }), me.each(["height", "width"], function(e, t) {
            me.cssHooks[t] = {
                get: function(e, n, r) {
                    if (n) return wt.test(me.css(e, "display")) && 0 === e.offsetWidth ? ht(e, kt, function() {
                        return I(e, t, r)
                    }) : I(e, t, r)
                },
                set: function(e, n, r) {
                    var i = r && mt(e);
                    return P(e, n, r ? M(e, t, r, ge.boxSizing && "border-box" === me.css(e, "boxSizing", !1, i), i) : 0)
                }
            }
        }), ge.opacity || (me.cssHooks.opacity = {
            get: function(e, t) {
                return xt.test((t && e.currentStyle ? e.currentStyle.filter : e.style.filter) || "") ? .01 * parseFloat(RegExp.$1) + "" : t ? "1" : ""
            },
            set: function(e, t) {
                var n = e.style,
                    r = e.currentStyle,
                    i = me.isNumeric(t) ? "alpha(opacity=" + 100 * t + ")" : "",
                    o = r && r.filter || n.filter || "";
                n.zoom = 1, (t >= 1 || "" === t) && "" === me.trim(o.replace(bt, "")) && n.removeAttribute && (n.removeAttribute("filter"), "" === t || r && !r.filter) || (n.filter = bt.test(o) ? o.replace(bt, i) : o + " " + i)
            }
        }), me.cssHooks.marginRight = F(ge.reliableMarginRight, function(e, t) {
            if (t) return ht(e, {
                display: "inline-block"
            }, vt, [e, "marginRight"])
        }), me.cssHooks.marginLeft = F(ge.reliableMarginLeft, function(e, t) {
            if (t) return (parseFloat(vt(e, "marginLeft")) || (me.contains(e.ownerDocument, e) ? e.getBoundingClientRect().left - ht(e, {
                marginLeft: 0
            }, function() {
                return e.getBoundingClientRect().left
            }) : 0)) + "px"
        }), me.each({
            margin: "",
            padding: "",
            border: "Width"
        }, function(e, t) {
            me.cssHooks[e + t] = {
                expand: function(n) {
                    for (var r = 0, i = {}, o = "string" == typeof n ? n.split(" ") : [n]; r < 4; r++) i[e + Me[r] + t] = o[r] || o[r - 2] || o[0];
                    return i
                }
            }, dt.test(e) || (me.cssHooks[e + t].set = P)
        }), me.fn.extend({
            css: function(e, t) {
                return Re(this, function(e, t, n) {
                    var r, i, o = {},
                        a = 0;
                    if (me.isArray(t)) {
                        for (r = mt(e), i = t.length; a < i; a++) o[t[a]] = me.css(e, t[a], !1, r);
                        return o
                    }
                    return void 0 !== n ? me.style(e, t, n) : me.css(e, t)
                }, e, t, arguments.length > 1)
            },
            show: function() {
                return $(this, !0)
            },
            hide: function() {
                return $(this)
            },
            toggle: function(e) {
                return "boolean" == typeof e ? e ? this.show() : this.hide() : this.each(function() {
                    Ie(this) ? me(this).show() : me(this).hide()
                })
            }
        }), me.Tween = R, R.prototype = {
            constructor: R,
            init: function(e, t, n, r, i, o) {
                this.elem = e, this.prop = n, this.easing = i || me.easing._default, this.options = t, this.start = this.now = this.cur(), this.end = r, this.unit = o || (me.cssNumber[n] ? "" : "px")
            },
            cur: function() {
                var e = R.propHooks[this.prop];
                return e && e.get ? e.get(this) : R.propHooks._default.get(this)
            },
            run: function(e) {
                var t, n = R.propHooks[this.prop];
                return this.options.duration ? this.pos = t = me.easing[this.easing](e, this.options.duration * e, 0, 1, this.options.duration) : this.pos = t = e, this.now = (this.end - this.start) * t + this.start, this.options.step && this.options.step.call(this.elem, this.now, this), n && n.set ? n.set(this) : R.propHooks._default.set(this), this
            }
        }, R.prototype.init.prototype = R.prototype, R.propHooks = {
            _default: {
                get: function(e) {
                    var t;
                    return 1 !== e.elem.nodeType || null != e.elem[e.prop] && null == e.elem.style[e.prop] ? e.elem[e.prop] : (t = me.css(e.elem, e.prop, ""), t && "auto" !== t ? t : 0)
                },
                set: function(e) {
                    me.fx.step[e.prop] ? me.fx.step[e.prop](e) : 1 !== e.elem.nodeType || null == e.elem.style[me.cssProps[e.prop]] && !me.cssHooks[e.prop] ? e.elem[e.prop] = e.now : me.style(e.elem, e.prop, e.now + e.unit)
                }
            }
        }, R.propHooks.scrollTop = R.propHooks.scrollLeft = {
            set: function(e) {
                e.elem.nodeType && e.elem.parentNode && (e.elem[e.prop] = e.now)
            }
        }, me.easing = {
            linear: function(e) {
                return e
            },
            swing: function(e) {
                return .5 - Math.cos(e * Math.PI) / 2
            },
            _default: "swing"
        }, me.fx = R.prototype.init, me.fx.step = {};
        var St, At, Lt = /^(?:toggle|show|hide)$/,
            jt = /queueHooks$/;
        me.Animation = me.extend(X, {
                tweeners: {
                    "*": [function(e, t) {
                        var n = this.createTween(e, t);
                        return m(n.elem, e, Pe.exec(t), n), n
                    }]
                },
                tweener: function(e, t) {
                    me.isFunction(e) ? (t = e, e = ["*"]) : e = e.match(De);
                    for (var n, r = 0, i = e.length; r < i; r++) n = e[r], X.tweeners[n] = X.tweeners[n] || [], X.tweeners[n].unshift(t)
                },
                prefilters: [U],
                prefilter: function(e, t) {
                    t ? X.prefilters.unshift(e) : X.prefilters.push(e)
                }
            }), me.speed = function(e, t, n) {
                var r = e && "object" == typeof e ? me.extend({}, e) : {
                    complete: n || !n && t || me.isFunction(e) && e,
                    duration: e,
                    easing: n && t || t && !me.isFunction(t) && t
                };
                return r.duration = me.fx.off ? 0 : "number" == typeof r.duration ? r.duration : r.duration in me.fx.speeds ? me.fx.speeds[r.duration] : me.fx.speeds._default, null != r.queue && !0 !== r.queue || (r.queue = "fx"), r.old = r.complete, r.complete = function() {
                    me.isFunction(r.old) && r.old.call(this), r.queue && me.dequeue(this, r.queue)
                }, r
            }, me.fn.extend({
                fadeTo: function(e, t, n, r) {
                    return this.filter(Ie).css("opacity", 0).show().end().animate({
                        opacity: t
                    }, e, n, r)
                },
                animate: function(e, t, n, r) {
                    var i = me.isEmptyObject(e),
                        o = me.speed(t, n, r),
                        a = function() {
                            var t = X(this, me.extend({}, e), o);
                            (i || me._data(this, "finish")) && t.stop(!0)
                        };
                    return a.finish = a, i || !1 === o.queue ? this.each(a) : this.queue(o.queue, a)
                },
                stop: function(e, t, n) {
                    var r = function(e) {
                        var t = e.stop;
                        delete e.stop, t(n)
                    };
                    return "string" != typeof e && (n = t, t = e, e = void 0), t && !1 !== e && this.queue(e || "fx", []), this.each(function() {
                        var t = !0,
                            i = null != e && e + "queueHooks",
                            o = me.timers,
                            a = me._data(this);
                        if (i) a[i] && a[i].stop && r(a[i]);
                        else
                            for (i in a) a[i] && a[i].stop && jt.test(i) && r(a[i]);
                        for (i = o.length; i--;) o[i].elem !== this || null != e && o[i].queue !== e || (o[i].anim.stop(n), t = !1, o.splice(i, 1));
                        !t && n || me.dequeue(this, e)
                    })
                },
                finish: function(e) {
                    return !1 !== e && (e = e || "fx"), this.each(function() {
                        var t, n = me._data(this),
                            r = n[e + "queue"],
                            i = n[e + "queueHooks"],
                            o = me.timers,
                            a = r ? r.length : 0;
                        for (n.finish = !0, me.queue(this, e, []), i && i.stop && i.stop.call(this, !0), t = o.length; t--;) o[t].elem === this && o[t].queue === e && (o[t].anim.stop(!0), o.splice(t, 1));
                        for (t = 0; t < a; t++) r[t] && r[t].finish && r[t].finish.call(this);
                        delete n.finish
                    })
                }
            }), me.each(["toggle", "show", "hide"], function(e, t) {
                var n = me.fn[t];
                me.fn[t] = function(e, r, i) {
                    return null == e || "boolean" == typeof e ? n.apply(this, arguments) : this.animate(B(t, !0), e, r, i)
                }
            }), me.each({
                slideDown: B("show"),
                slideUp: B("hide"),
                slideToggle: B("toggle"),
                fadeIn: {
                    opacity: "show"
                },
                fadeOut: {
                    opacity: "hide"
                },
                fadeToggle: {
                    opacity: "toggle"
                }
            }, function(e, t) {
                me.fn[e] = function(e, n, r) {
                    return this.animate(t, e, n, r)
                }
            }), me.timers = [], me.fx.tick = function() {
                var e, t = me.timers,
                    n = 0;
                for (St = me.now(); n < t.length; n++)(e = t[n])() || t[n] !== e || t.splice(n--, 1);
                t.length || me.fx.stop(), St = void 0
            }, me.fx.timer = function(e) {
                me.timers.push(e), e() ? me.fx.start() : me.timers.pop()
            }, me.fx.interval = 13, me.fx.start = function() {
                At || (At = n.setInterval(me.fx.tick, me.fx.interval))
            }, me.fx.stop = function() {
                n.clearInterval(At), At = null
            }, me.fx.speeds = {
                slow: 600,
                fast: 200,
                _default: 400
            }, me.fn.delay = function(e, t) {
                return e = me.fx ? me.fx.speeds[e] || e : e, t = t || "fx", this.queue(t, function(t, r) {
                    var i = n.setTimeout(t, e);
                    r.stop = function() {
                        n.clearTimeout(i)
                    }
                })
            },
            function() {
                var e, t = se.createElement("input"),
                    n = se.createElement("div"),
                    r = se.createElement("select"),
                    i = r.appendChild(se.createElement("option"));
                n = se.createElement("div"), n.setAttribute("className", "t"), n.innerHTML = "  <link/><table></table><a href='/a'>a</a><input type='checkbox'/>", e = n.getElementsByTagName("a")[0], t.setAttribute("type", "checkbox"), n.appendChild(t), e = n.getElementsByTagName("a")[0], e.style.cssText = "top:1px", ge.getSetAttribute = "t" !== n.className, ge.style = /top/.test(e.getAttribute("style")), ge.hrefNormalized = "/a" === e.getAttribute("href"), ge.checkOn = !!t.value, ge.optSelected = i.selected, ge.enctype = !!se.createElement("form").enctype, r.disabled = !0, ge.optDisabled = !i.disabled, t = se.createElement("input"), t.setAttribute("value", ""), ge.input = "" === t.getAttribute("value"), t.value = "t", t.setAttribute("type", "radio"), ge.radioValue = "t" === t.value
            }();
        var Dt = /\r/g,
            Ot = /[\x20\t\r\n\f]+/g;
        me.fn.extend({
            val: function(e) {
                var t, n, r, i = this[0]; {
                    if (arguments.length) return r = me.isFunction(e), this.each(function(n) {
                        var i;
                        1 === this.nodeType && (i = r ? e.call(this, n, me(this).val()) : e, null == i ? i = "" : "number" == typeof i ? i += "" : me.isArray(i) && (i = me.map(i, function(e) {
                            return null == e ? "" : e + ""
                        })), (t = me.valHooks[this.type] || me.valHooks[this.nodeName.toLowerCase()]) && "set" in t && void 0 !== t.set(this, i, "value") || (this.value = i))
                    });
                    if (i) return (t = me.valHooks[i.type] || me.valHooks[i.nodeName.toLowerCase()]) && "get" in t && void 0 !== (n = t.get(i, "value")) ? n : (n = i.value, "string" == typeof n ? n.replace(Dt, "") : null == n ? "" : n)
                }
            }
        }), me.extend({
            valHooks: {
                option: {
                    get: function(e) {
                        var t = me.find.attr(e, "value");
                        return null != t ? t : me.trim(me.text(e)).replace(Ot, " ")
                    }
                },
                select: {
                    get: function(e) {
                        for (var t, n, r = e.options, i = e.selectedIndex, o = "select-one" === e.type || i < 0, a = o ? null : [], s = o ? i + 1 : r.length, l = i < 0 ? s : o ? i : 0; l < s; l++)
                            if (n = r[l], (n.selected || l === i) && (ge.optDisabled ? !n.disabled : null === n.getAttribute("disabled")) && (!n.parentNode.disabled || !me.nodeName(n.parentNode, "optgroup"))) {
                                if (t = me(n).val(), o) return t;
                                a.push(t)
                            }
                        return a
                    },
                    set: function(e, t) {
                        for (var n, r, i = e.options, o = me.makeArray(t), a = i.length; a--;)
                            if (r = i[a], me.inArray(me.valHooks.option.get(r), o) > -1) try {
                                r.selected = n = !0
                            } catch (e) {
                                r.scrollHeight
                            } else r.selected = !1;
                        return n || (e.selectedIndex = -1), i
                    }
                }
            }
        }), me.each(["radio", "checkbox"], function() {
            me.valHooks[this] = {
                set: function(e, t) {
                    if (me.isArray(t)) return e.checked = me.inArray(me(e).val(), t) > -1
                }
            }, ge.checkOn || (me.valHooks[this].get = function(e) {
                return null === e.getAttribute("value") ? "on" : e.value
            })
        });
        var Ht, _t, Ft = me.expr.attrHandle,
            qt = /^(?:checked|selected)$/i,
            $t = ge.getSetAttribute,
            Pt = ge.input;
        me.fn.extend({
            attr: function(e, t) {
                return Re(this, me.attr, e, t, arguments.length > 1)
            },
            removeAttr: function(e) {
                return this.each(function() {
                    me.removeAttr(this, e)
                })
            }
        }), me.extend({
            attr: function(e, t, n) {
                var r, i, o = e.nodeType;
                if (3 !== o && 8 !== o && 2 !== o) return void 0 === e.getAttribute ? me.prop(e, t, n) : (1 === o && me.isXMLDoc(e) || (t = t.toLowerCase(), i = me.attrHooks[t] || (me.expr.match.bool.test(t) ? _t : Ht)), void 0 !== n ? null === n ? void me.removeAttr(e, t) : i && "set" in i && void 0 !== (r = i.set(e, n, t)) ? r : (e.setAttribute(t, n + ""), n) : i && "get" in i && null !== (r = i.get(e, t)) ? r : (r = me.find.attr(e, t), null == r ? void 0 : r))
            },
            attrHooks: {
                type: {
                    set: function(e, t) {
                        if (!ge.radioValue && "radio" === t && me.nodeName(e, "input")) {
                            var n = e.value;
                            return e.setAttribute("type", t), n && (e.value = n), t
                        }
                    }
                }
            },
            removeAttr: function(e, t) {
                var n, r, i = 0,
                    o = t && t.match(De);
                if (o && 1 === e.nodeType)
                    for (; n = o[i++];) r = me.propFix[n] || n, me.expr.match.bool.test(n) ? Pt && $t || !qt.test(n) ? e[r] = !1 : e[me.camelCase("default-" + n)] = e[r] = !1 : me.attr(e, n, ""), e.removeAttribute($t ? n : r)
            }
        }), _t = {
            set: function(e, t, n) {
                return !1 === t ? me.removeAttr(e, n) : Pt && $t || !qt.test(n) ? e.setAttribute(!$t && me.propFix[n] || n, n) : e[me.camelCase("default-" + n)] = e[n] = !0, n
            }
        }, me.each(me.expr.match.bool.source.match(/\w+/g), function(e, t) {
            var n = Ft[t] || me.find.attr;
            Pt && $t || !qt.test(t) ? Ft[t] = function(e, t, r) {
                var i, o;
                return r || (o = Ft[t], Ft[t] = i, i = null != n(e, t, r) ? t.toLowerCase() : null, Ft[t] = o), i
            } : Ft[t] = function(e, t, n) {
                if (!n) return e[me.camelCase("default-" + t)] ? t.toLowerCase() : null
            }
        }), Pt && $t || (me.attrHooks.value = {
            set: function(e, t, n) {
                if (!me.nodeName(e, "input")) return Ht && Ht.set(e, t, n);
                e.defaultValue = t
            }
        }), $t || (Ht = {
            set: function(e, t, n) {
                var r = e.getAttributeNode(n);
                if (r || e.setAttributeNode(r = e.ownerDocument.createAttribute(n)), r.value = t += "", "value" === n || t === e.getAttribute(n)) return t
            }
        }, Ft.id = Ft.name = Ft.coords = function(e, t, n) {
            var r;
            if (!n) return (r = e.getAttributeNode(t)) && "" !== r.value ? r.value : null
        }, me.valHooks.button = {
            get: function(e, t) {
                var n = e.getAttributeNode(t);
                if (n && n.specified) return n.value
            },
            set: Ht.set
        }, me.attrHooks.contenteditable = {
            set: function(e, t, n) {
                Ht.set(e, "" !== t && t, n)
            }
        }, me.each(["width", "height"], function(e, t) {
            me.attrHooks[t] = {
                set: function(e, n) {
                    if ("" === n) return e.setAttribute(t, "auto"), n
                }
            }
        })), ge.style || (me.attrHooks.style = {
            get: function(e) {
                return e.style.cssText || void 0
            },
            set: function(e, t) {
                return e.style.cssText = t + ""
            }
        });
        var Mt = /^(?:input|select|textarea|button|object)$/i,
            It = /^(?:a|area)$/i;
        me.fn.extend({
            prop: function(e, t) {
                return Re(this, me.prop, e, t, arguments.length > 1)
            },
            removeProp: function(e) {
                return e = me.propFix[e] || e, this.each(function() {
                    try {
                        this[e] = void 0, delete this[e]
                    } catch (e) {}
                })
            }
        }), me.extend({
            prop: function(e, t, n) {
                var r, i, o = e.nodeType;
                if (3 !== o && 8 !== o && 2 !== o) return 1 === o && me.isXMLDoc(e) || (t = me.propFix[t] || t, i = me.propHooks[t]), void 0 !== n ? i && "set" in i && void 0 !== (r = i.set(e, n, t)) ? r : e[t] = n : i && "get" in i && null !== (r = i.get(e, t)) ? r : e[t]
            },
            propHooks: {
                tabIndex: {
                    get: function(e) {
                        var t = me.find.attr(e, "tabindex");
                        return t ? parseInt(t, 10) : Mt.test(e.nodeName) || It.test(e.nodeName) && e.href ? 0 : -1
                    }
                }
            },
            propFix: {
                for: "htmlFor",
                class: "className"
            }
        }), ge.hrefNormalized || me.each(["href", "src"], function(e, t) {
            me.propHooks[t] = {
                get: function(e) {
                    return e.getAttribute(t, 4)
                }
            }
        }), ge.optSelected || (me.propHooks.selected = {
            get: function(e) {
                var t = e.parentNode;
                return t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex), null
            },
            set: function(e) {
                var t = e.parentNode;
                t && (t.selectedIndex, t.parentNode && t.parentNode.selectedIndex)
            }
        }), me.each(["tabIndex", "readOnly", "maxLength", "cellSpacing", "cellPadding", "rowSpan", "colSpan", "useMap", "frameBorder", "contentEditable"], function() {
            me.propFix[this.toLowerCase()] = this
        }), ge.enctype || (me.propFix.enctype = "encoding");
        var Rt = /[\t\r\n\f]/g;
        me.fn.extend({
            addClass: function(e) {
                var t, n, r, i, o, a, s, l = 0;
                if (me.isFunction(e)) return this.each(function(t) {
                    me(this).addClass(e.call(this, t, Y(this)))
                });
                if ("string" == typeof e && e)
                    for (t = e.match(De) || []; n = this[l++];)
                        if (i = Y(n), r = 1 === n.nodeType && (" " + i + " ").replace(Rt, " ")) {
                            for (a = 0; o = t[a++];) r.indexOf(" " + o + " ") < 0 && (r += o + " ");
                            s = me.trim(r), i !== s && me.attr(n, "class", s)
                        }
                return this
            },
            removeClass: function(e) {
                var t, n, r, i, o, a, s, l = 0;
                if (me.isFunction(e)) return this.each(function(t) {
                    me(this).removeClass(e.call(this, t, Y(this)))
                });
                if (!arguments.length) return this.attr("class", "");
                if ("string" == typeof e && e)
                    for (t = e.match(De) || []; n = this[l++];)
                        if (i = Y(n), r = 1 === n.nodeType && (" " + i + " ").replace(Rt, " ")) {
                            for (a = 0; o = t[a++];)
                                for (; r.indexOf(" " + o + " ") > -1;) r = r.replace(" " + o + " ", " ");
                            s = me.trim(r), i !== s && me.attr(n, "class", s)
                        }
                return this
            },
            toggleClass: function(e, t) {
                var n = typeof e;
                return "boolean" == typeof t && "string" === n ? t ? this.addClass(e) : this.removeClass(e) : me.isFunction(e) ? this.each(function(n) {
                    me(this).toggleClass(e.call(this, n, Y(this), t), t)
                }) : this.each(function() {
                    var t, r, i, o;
                    if ("string" === n)
                        for (r = 0, i = me(this), o = e.match(De) || []; t = o[r++];) i.hasClass(t) ? i.removeClass(t) : i.addClass(t);
                    else void 0 !== e && "boolean" !== n || (t = Y(this), t && me._data(this, "__className__", t), me.attr(this, "class", t || !1 === e ? "" : me._data(this, "__className__") || ""))
                })
            },
            hasClass: function(e) {
                var t, n, r = 0;
                for (t = " " + e + " "; n = this[r++];)
                    if (1 === n.nodeType && (" " + Y(n) + " ").replace(Rt, " ").indexOf(t) > -1) return !0;
                return !1
            }
        }), me.each("blur focus focusin focusout load resize scroll unload click dblclick mousedown mouseup mousemove mouseover mouseout mouseenter mouseleave change select submit keydown keypress keyup error contextmenu".split(" "), function(e, t) {
            me.fn[t] = function(e, n) {
                return arguments.length > 0 ? this.on(t, null, e, n) : this.trigger(t)
            }
        }), me.fn.extend({
            hover: function(e, t) {
                return this.mouseenter(e).mouseleave(t || e)
            }
        });
        var zt = n.location,
            Bt = me.now(),
            Wt = /\?/,
            Ut = /(,)|(\[|{)|(}|])|"(?:[^"\\\r\n]|\\["\\\/bfnrt]|\\u[\da-fA-F]{4})*"\s*:?|true|false|null|-?(?!0\d)\d+(?:\.\d+|)(?:[eE][+-]?\d+|)/g;
        me.parseJSON = function(e) {
            if (n.JSON && n.JSON.parse) return n.JSON.parse(e + "");
            var t, r = null,
                i = me.trim(e + "");
            return i && !me.trim(i.replace(Ut, function(e, n, i, o) {
                return t && n && (r = 0), 0 === r ? e : (t = i || n, r += !o - !i, "")
            })) ? Function("return " + i)() : me.error("Invalid JSON: " + e)
        }, me.parseXML = function(e) {
            var t, r;
            if (!e || "string" != typeof e) return null;
            try {
                n.DOMParser ? (r = new n.DOMParser, t = r.parseFromString(e, "text/xml")) : (t = new n.ActiveXObject("Microsoft.XMLDOM"), t.async = "false", t.loadXML(e))
            } catch (e) {
                t = void 0
            }
            return t && t.documentElement && !t.getElementsByTagName("parsererror").length || me.error("Invalid XML: " + e), t
        };
        var Vt = /#.*$/,
            Xt = /([?&])_=[^&]*/,
            Yt = /^(.*?):[ \t]*([^\r\n]*)\r?$/gm,
            Gt = /^(?:about|app|app-storage|.+-extension|file|res|widget):$/,
            Jt = /^(?:GET|HEAD)$/,
            Qt = /^\/\//,
            Kt = /^([\w.+-]+:)(?:\/\/(?:[^\/?#]*@|)([^\/?#:]*)(?::(\d+)|)|)/,
            Zt = {},
            en = {},
            tn = "*/".concat("*"),
            nn = zt.href,
            rn = Kt.exec(nn.toLowerCase()) || [];
        me.extend({
            active: 0,
            lastModified: {},
            etag: {},
            ajaxSettings: {
                url: nn,
                type: "GET",
                isLocal: Gt.test(rn[1]),
                global: !0,
                processData: !0,
                async: !0,
                contentType: "application/x-www-form-urlencoded; charset=UTF-8",
                accepts: {
                    "*": tn,
                    text: "text/plain",
                    html: "text/html",
                    xml: "application/xml, text/xml",
                    json: "application/json, text/javascript"
                },
                contents: {
                    xml: /\bxml\b/,
                    html: /\bhtml/,
                    json: /\bjson\b/
                },
                responseFields: {
                    xml: "responseXML",
                    text: "responseText",
                    json: "responseJSON"
                },
                converters: {
                    "* text": String,
                    "text html": !0,
                    "text json": me.parseJSON,
                    "text xml": me.parseXML
                },
                flatOptions: {
                    url: !0,
                    context: !0
                }
            },
            ajaxSetup: function(e, t) {
                return t ? Q(Q(e, me.ajaxSettings), t) : Q(me.ajaxSettings, e)
            },
            ajaxPrefilter: G(Zt),
            ajaxTransport: G(en),
            ajax: function(e, t) {
                function r(e, t, r, i) {
                    var o, f, y, b, w, k = t;
                    2 !== x && (x = 2, l && n.clearTimeout(l), c = void 0, s = i || "", T.readyState = e > 0 ? 4 : 0, o = e >= 200 && e < 300 || 304 === e, r && (b = K(d, T, r)), b = Z(d, b, T, o), o ? (d.ifModified && (w = T.getResponseHeader("Last-Modified"), w && (me.lastModified[a] = w), (w = T.getResponseHeader("etag")) && (me.etag[a] = w)), 204 === e || "HEAD" === d.type ? k = "nocontent" : 304 === e ? k = "notmodified" : (k = b.state, f = b.data, y = b.error, o = !y)) : (y = k, !e && k || (k = "error", e < 0 && (e = 0))), T.status = e, T.statusText = (t || k) + "", o ? g.resolveWith(p, [f, k, T]) : g.rejectWith(p, [T, k, y]), T.statusCode(v), v = void 0, u && h.trigger(o ? "ajaxSuccess" : "ajaxError", [T, d, o ? f : y]), m.fireWith(p, [T, k]), u && (h.trigger("ajaxComplete", [T, d]), --me.active || me.event.trigger("ajaxStop")))
                }
                "object" == typeof e && (t = e, e = void 0), t = t || {};
                var i, o, a, s, l, u, c, f, d = me.ajaxSetup({}, t),
                    p = d.context || d,
                    h = d.context && (p.nodeType || p.jquery) ? me(p) : me.event,
                    g = me.Deferred(),
                    m = me.Callbacks("once memory"),
                    v = d.statusCode || {},
                    y = {},
                    b = {},
                    x = 0,
                    w = "canceled",
                    T = {
                        readyState: 0,
                        getResponseHeader: function(e) {
                            var t;
                            if (2 === x) {
                                if (!f)
                                    for (f = {}; t = Yt.exec(s);) f[t[1].toLowerCase()] = t[2];
                                t = f[e.toLowerCase()]
                            }
                            return null == t ? null : t
                        },
                        getAllResponseHeaders: function() {
                            return 2 === x ? s : null
                        },
                        setRequestHeader: function(e, t) {
                            var n = e.toLowerCase();
                            return x || (e = b[n] = b[n] || e, y[e] = t), this
                        },
                        overrideMimeType: function(e) {
                            return x || (d.mimeType = e), this
                        },
                        statusCode: function(e) {
                            var t;
                            if (e)
                                if (x < 2)
                                    for (t in e) v[t] = [v[t], e[t]];
                                else T.always(e[T.status]);
                            return this
                        },
                        abort: function(e) {
                            var t = e || w;
                            return c && c.abort(t), r(0, t), this
                        }
                    };
                if (g.promise(T).complete = m.add, T.success = T.done, T.error = T.fail, d.url = ((e || d.url || nn) + "").replace(Vt, "").replace(Qt, rn[1] + "//"), d.type = t.method || t.type || d.method || d.type, d.dataTypes = me.trim(d.dataType || "*").toLowerCase().match(De) || [""], null == d.crossDomain && (i = Kt.exec(d.url.toLowerCase()), d.crossDomain = !(!i || i[1] === rn[1] && i[2] === rn[2] && (i[3] || ("http:" === i[1] ? "80" : "443")) === (rn[3] || ("http:" === rn[1] ? "80" : "443")))), d.data && d.processData && "string" != typeof d.data && (d.data = me.param(d.data, d.traditional)), J(Zt, d, t, T), 2 === x) return T;
                u = me.event && d.global, u && 0 == me.active++ && me.event.trigger("ajaxStart"), d.type = d.type.toUpperCase(), d.hasContent = !Jt.test(d.type), a = d.url, d.hasContent || (d.data && (a = d.url += (Wt.test(a) ? "&" : "?") + d.data, delete d.data), !1 === d.cache && (d.url = Xt.test(a) ? a.replace(Xt, "$1_=" + Bt++) : a + (Wt.test(a) ? "&" : "?") + "_=" + Bt++)), d.ifModified && (me.lastModified[a] && T.setRequestHeader("If-Modified-Since", me.lastModified[a]), me.etag[a] && T.setRequestHeader("If-None-Match", me.etag[a])), (d.data && d.hasContent && !1 !== d.contentType || t.contentType) && T.setRequestHeader("Content-Type", d.contentType), T.setRequestHeader("Accept", d.dataTypes[0] && d.accepts[d.dataTypes[0]] ? d.accepts[d.dataTypes[0]] + ("*" !== d.dataTypes[0] ? ", " + tn + "; q=0.01" : "") : d.accepts["*"]);
                for (o in d.headers) T.setRequestHeader(o, d.headers[o]);
                if (d.beforeSend && (!1 === d.beforeSend.call(p, T, d) || 2 === x)) return T.abort();
                w = "abort";
                for (o in {
                        success: 1,
                        error: 1,
                        complete: 1
                    }) T[o](d[o]);
                if (c = J(en, d, t, T)) {
                    if (T.readyState = 1, u && h.trigger("ajaxSend", [T, d]), 2 === x) return T;
                    d.async && d.timeout > 0 && (l = n.setTimeout(function() {
                        T.abort("timeout")
                    }, d.timeout));
                    try {
                        x = 1, c.send(y, r)
                    } catch (e) {
                        if (!(x < 2)) throw e;
                        r(-1, e)
                    }
                } else r(-1, "No Transport");
                return T
            },
            getJSON: function(e, t, n) {
                return me.get(e, t, n, "json")
            },
            getScript: function(e, t) {
                return me.get(e, void 0, t, "script")
            }
        }), me.each(["get", "post"], function(e, t) {
            me[t] = function(e, n, r, i) {
                return me.isFunction(n) && (i = i || r, r = n, n = void 0), me.ajax(me.extend({
                    url: e,
                    type: t,
                    dataType: i,
                    data: n,
                    success: r
                }, me.isPlainObject(e) && e))
            }
        }), me._evalUrl = function(e) {
            return me.ajax({
                url: e,
                type: "GET",
                dataType: "script",
                cache: !0,
                async: !1,
                global: !1,
                throws: !0
            })
        }, me.fn.extend({
            wrapAll: function(e) {
                if (me.isFunction(e)) return this.each(function(t) {
                    me(this).wrapAll(e.call(this, t))
                });
                if (this[0]) {
                    var t = me(e, this[0].ownerDocument).eq(0).clone(!0);
                    this[0].parentNode && t.insertBefore(this[0]), t.map(function() {
                        for (var e = this; e.firstChild && 1 === e.firstChild.nodeType;) e = e.firstChild;
                        return e
                    }).append(this)
                }
                return this
            },
            wrapInner: function(e) {
                return me.isFunction(e) ? this.each(function(t) {
                    me(this).wrapInner(e.call(this, t))
                }) : this.each(function() {
                    var t = me(this),
                        n = t.contents();
                    n.length ? n.wrapAll(e) : t.append(e)
                })
            },
            wrap: function(e) {
                var t = me.isFunction(e);
                return this.each(function(n) {
                    me(this).wrapAll(t ? e.call(this, n) : e)
                })
            },
            unwrap: function() {
                return this.parent().each(function() {
                    me.nodeName(this, "body") || me(this).replaceWith(this.childNodes)
                }).end()
            }
        }), me.expr.filters.hidden = function(e) {
            return ge.reliableHiddenOffsets() ? e.offsetWidth <= 0 && e.offsetHeight <= 0 && !e.getClientRects().length : te(e)
        }, me.expr.filters.visible = function(e) {
            return !me.expr.filters.hidden(e)
        };
        var on = /%20/g,
            an = /\[\]$/,
            sn = /\r?\n/g,
            ln = /^(?:submit|button|image|reset|file)$/i,
            un = /^(?:input|select|textarea|keygen)/i;
        me.param = function(e, t) {
            var n, r = [],
                i = function(e, t) {
                    t = me.isFunction(t) ? t() : null == t ? "" : t, r[r.length] = encodeURIComponent(e) + "=" + encodeURIComponent(t)
                };
            if (void 0 === t && (t = me.ajaxSettings && me.ajaxSettings.traditional), me.isArray(e) || e.jquery && !me.isPlainObject(e)) me.each(e, function() {
                i(this.name, this.value)
            });
            else
                for (n in e) ne(n, e[n], t, i);
            return r.join("&").replace(on, "+")
        }, me.fn.extend({
            serialize: function() {
                return me.param(this.serializeArray())
            },
            serializeArray: function() {
                return this.map(function() {
                    var e = me.prop(this, "elements");
                    return e ? me.makeArray(e) : this
                }).filter(function() {
                    var e = this.type;
                    return this.name && !me(this).is(":disabled") && un.test(this.nodeName) && !ln.test(e) && (this.checked || !ze.test(e))
                }).map(function(e, t) {
                    var n = me(this).val();
                    return null == n ? null : me.isArray(n) ? me.map(n, function(e) {
                        return {
                            name: t.name,
                            value: e.replace(sn, "\r\n")
                        }
                    }) : {
                        name: t.name,
                        value: n.replace(sn, "\r\n")
                    }
                }).get()
            }
        }), me.ajaxSettings.xhr = void 0 !== n.ActiveXObject ? function() {
            return this.isLocal ? ie() : se.documentMode > 8 ? re() : /^(get|post|head|put|delete|options)$/i.test(this.type) && re() || ie()
        } : re;
        var cn = 0,
            fn = {},
            dn = me.ajaxSettings.xhr();
        n.attachEvent && n.attachEvent("onunload", function() {
            for (var e in fn) fn[e](void 0, !0)
        }), ge.cors = !!dn && "withCredentials" in dn, dn = ge.ajax = !!dn, dn && me.ajaxTransport(function(e) {
            if (!e.crossDomain || ge.cors) {
                var t;
                return {
                    send: function(r, i) {
                        var o, a = e.xhr(),
                            s = ++cn;
                        if (a.open(e.type, e.url, e.async, e.username, e.password), e.xhrFields)
                            for (o in e.xhrFields) a[o] = e.xhrFields[o];
                        e.mimeType && a.overrideMimeType && a.overrideMimeType(e.mimeType), e.crossDomain || r["X-Requested-With"] || (r["X-Requested-With"] = "XMLHttpRequest");
                        for (o in r) void 0 !== r[o] && a.setRequestHeader(o, r[o] + "");
                        a.send(e.hasContent && e.data || null), t = function(n, r) {
                            var o, l, u;
                            if (t && (r || 4 === a.readyState))
                                if (delete fn[s], t = void 0, a.onreadystatechange = me.noop, r) 4 !== a.readyState && a.abort();
                                else {
                                    u = {}, o = a.status, "string" == typeof a.responseText && (u.text = a.responseText);
                                    try {
                                        l = a.statusText
                                    } catch (e) {
                                        l = ""
                                    }
                                    o || !e.isLocal || e.crossDomain ? 1223 === o && (o = 204) : o = u.text ? 200 : 404
                                }
                            u && i(o, l, u, a.getAllResponseHeaders())
                        }, e.async ? 4 === a.readyState ? n.setTimeout(t) : a.onreadystatechange = fn[s] = t : t()
                    },
                    abort: function() {
                        t && t(void 0, !0)
                    }
                }
            }
        }), me.ajaxSetup({
            accepts: {
                script: "text/javascript, application/javascript, application/ecmascript, application/x-ecmascript"
            },
            contents: {
                script: /\b(?:java|ecma)script\b/
            },
            converters: {
                "text script": function(e) {
                    return me.globalEval(e), e
                }
            }
        }), me.ajaxPrefilter("script", function(e) {
            void 0 === e.cache && (e.cache = !1), e.crossDomain && (e.type = "GET", e.global = !1)
        }), me.ajaxTransport("script", function(e) {
            if (e.crossDomain) {
                var t, n = se.head || me("head")[0] || se.documentElement;
                return {
                    send: function(r, i) {
                        t = se.createElement("script"), t.async = !0, e.scriptCharset && (t.charset = e.scriptCharset), t.src = e.url, t.onload = t.onreadystatechange = function(e, n) {
                            (n || !t.readyState || /loaded|complete/.test(t.readyState)) && (t.onload = t.onreadystatechange = null, t.parentNode && t.parentNode.removeChild(t), t = null, n || i(200, "success"))
                        }, n.insertBefore(t, n.firstChild)
                    },
                    abort: function() {
                        t && t.onload(void 0, !0)
                    }
                }
            }
        });
        var pn = [],
            hn = /(=)\?(?=&|$)|\?\?/;
        me.ajaxSetup({
            jsonp: "callback",
            jsonpCallback: function() {
                var e = pn.pop() || me.expando + "_" + Bt++;
                return this[e] = !0, e
            }
        }), me.ajaxPrefilter("json jsonp", function(e, t, r) {
            var i, o, a, s = !1 !== e.jsonp && (hn.test(e.url) ? "url" : "string" == typeof e.data && 0 === (e.contentType || "").indexOf("application/x-www-form-urlencoded") && hn.test(e.data) && "data");
            if (s || "jsonp" === e.dataTypes[0]) return i = e.jsonpCallback = me.isFunction(e.jsonpCallback) ? e.jsonpCallback() : e.jsonpCallback, s ? e[s] = e[s].replace(hn, "$1" + i) : !1 !== e.jsonp && (e.url += (Wt.test(e.url) ? "&" : "?") + e.jsonp + "=" + i), e.converters["script json"] = function() {
                return a || me.error(i + " was not called"), a[0]
            }, e.dataTypes[0] = "json", o = n[i], n[i] = function() {
                a = arguments
            }, r.always(function() {
                void 0 === o ? me(n).removeProp(i) : n[i] = o, e[i] && (e.jsonpCallback = t.jsonpCallback, pn.push(i)), a && me.isFunction(o) && o(a[0]), a = o = void 0
            }), "script"
        }), me.parseHTML = function(e, t, n) {
            if (!e || "string" != typeof e) return null;
            "boolean" == typeof t && (n = t, t = !1), t = t || se;
            var r = Ce.exec(e),
                i = !n && [];
            return r ? [t.createElement(r[1])] : (r = w([e], t, i), i && i.length && me(i).remove(), me.merge([], r.childNodes))
        };
        var gn = me.fn.load;
        me.fn.load = function(e, t, n) {
            if ("string" != typeof e && gn) return gn.apply(this, arguments);
            var r, i, o, a = this,
                s = e.indexOf(" ");
            return s > -1 && (r = me.trim(e.slice(s, e.length)), e = e.slice(0, s)), me.isFunction(t) ? (n = t, t = void 0) : t && "object" == typeof t && (i = "POST"), a.length > 0 && me.ajax({
                url: e,
                type: i || "GET",
                dataType: "html",
                data: t
            }).done(function(e) {
                o = arguments, a.html(r ? me("<div>").append(me.parseHTML(e)).find(r) : e)
            }).always(n && function(e, t) {
                a.each(function() {
                    n.apply(this, o || [e.responseText, t, e])
                })
            }), this
        }, me.each(["ajaxStart", "ajaxStop", "ajaxComplete", "ajaxError", "ajaxSuccess", "ajaxSend"], function(e, t) {
            me.fn[t] = function(e) {
                return this.on(t, e)
            }
        }), me.expr.filters.animated = function(e) {
            return me.grep(me.timers, function(t) {
                return e === t.elem
            }).length
        }, me.offset = {
            setOffset: function(e, t, n) {
                var r, i, o, a, s, l, u, c = me.css(e, "position"),
                    f = me(e),
                    d = {};
                "static" === c && (e.style.position = "relative"), s = f.offset(), o = me.css(e, "top"), l = me.css(e, "left"), u = ("absolute" === c || "fixed" === c) && me.inArray("auto", [o, l]) > -1, u ? (r = f.position(), a = r.top, i = r.left) : (a = parseFloat(o) || 0, i = parseFloat(l) || 0), me.isFunction(t) && (t = t.call(e, n, me.extend({}, s))), null != t.top && (d.top = t.top - s.top + a), null != t.left && (d.left = t.left - s.left + i), "using" in t ? t.using.call(e, d) : f.css(d)
            }
        }, me.fn.extend({
            offset: function(e) {
                if (arguments.length) return void 0 === e ? this : this.each(function(t) {
                    me.offset.setOffset(this, e, t)
                });
                var t, n, r = {
                        top: 0,
                        left: 0
                    },
                    i = this[0],
                    o = i && i.ownerDocument;
                if (o) return t = o.documentElement, me.contains(t, i) ? (void 0 !== i.getBoundingClientRect && (r = i.getBoundingClientRect()), n = oe(o), {
                    top: r.top + (n.pageYOffset || t.scrollTop) - (t.clientTop || 0),
                    left: r.left + (n.pageXOffset || t.scrollLeft) - (t.clientLeft || 0)
                }) : r
            },
            position: function() {
                if (this[0]) {
                    var e, t, n = {
                            top: 0,
                            left: 0
                        },
                        r = this[0];
                    return "fixed" === me.css(r, "position") ? t = r.getBoundingClientRect() : (e = this.offsetParent(), t = this.offset(), me.nodeName(e[0], "html") || (n = e.offset()), n.top += me.css(e[0], "borderTopWidth", !0), n.left += me.css(e[0], "borderLeftWidth", !0)), {
                        top: t.top - n.top - me.css(r, "marginTop", !0),
                        left: t.left - n.left - me.css(r, "marginLeft", !0)
                    }
                }
            },
            offsetParent: function() {
                return this.map(function() {
                    for (var e = this.offsetParent; e && !me.nodeName(e, "html") && "static" === me.css(e, "position");) e = e.offsetParent;
                    return e || gt
                })
            }
        }), me.each({
            scrollLeft: "pageXOffset",
            scrollTop: "pageYOffset"
        }, function(e, t) {
            var n = /Y/.test(t);
            me.fn[e] = function(r) {
                return Re(this, function(e, r, i) {
                    var o = oe(e);
                    if (void 0 === i) return o ? t in o ? o[t] : o.document.documentElement[r] : e[r];
                    o ? o.scrollTo(n ? me(o).scrollLeft() : i, n ? i : me(o).scrollTop()) : e[r] = i
                }, e, r, arguments.length, null)
            }
        }), me.each(["top", "left"], function(e, t) {
            me.cssHooks[t] = F(ge.pixelPosition, function(e, n) {
                if (n) return n = vt(e, t), pt.test(n) ? me(e).position()[t] + "px" : n
            })
        }), me.each({
            Height: "height",
            Width: "width"
        }, function(e, t) {
            me.each({
                padding: "inner" + e,
                content: t,
                "": "outer" + e
            }, function(n, r) {
                me.fn[r] = function(r, i) {
                    var o = arguments.length && (n || "boolean" != typeof r),
                        a = n || (!0 === r || !0 === i ? "margin" : "border");
                    return Re(this, function(t, n, r) {
                        var i;
                        return me.isWindow(t) ? t.document.documentElement["client" + e] : 9 === t.nodeType ? (i = t.documentElement, Math.max(t.body["scroll" + e], i["scroll" + e], t.body["offset" + e], i["offset" + e], i["client" + e])) : void 0 === r ? me.css(t, n, a) : me.style(t, n, r, a)
                    }, t, o ? r : void 0, o, null)
                }
            })
        }), me.fn.extend({
            bind: function(e, t, n) {
                return this.on(e, null, t, n)
            },
            unbind: function(e, t) {
                return this.off(e, null, t)
            },
            delegate: function(e, t, n, r) {
                return this.on(t, e, n, r)
            },
            undelegate: function(e, t, n) {
                return 1 === arguments.length ? this.off(e, "**") : this.off(t, e || "**", n)
            }
        }), me.fn.size = function() {
            return this.length
        }, me.fn.andSelf = me.fn.addBack, r = [], void 0 !== (i = function() {
            return me
        }.apply(t, r)) && (e.exports = i);
        var mn = n.jQuery,
            vn = n.$;
        return me.noConflict = function(e) {
            return n.$ === me && (n.$ = vn), e && n.jQuery === me && (n.jQuery = mn), me
        }, o || (n.jQuery = n.$ = me), me
    })
}, function(e, t, n) {
    var r, i, o;
    ! function(a, s) {
        i = [n(10), n(6), n(0)], r = s, void 0 !== (o = "function" == typeof r ? r.apply(t, i) : r) && (e.exports = o)
    }(0, function(e, t, n) {
        var r = 0,
            i = /{{(\S+)}}/g,
            o = function(e, t) {
                return e.replace(i, function(e, n) {
                    var r = 0 === n.indexOf("this."),
                        i = r ? t : window,
                        o = (r ? n.slice(5) : n).split(".");
                    for (var a in o)
                        if (void 0 === (i = i[o[a]])) throw new Error("Undefined variable in event string");
                    return i
                })
            },
            a = {
                document: window.document,
                window: window
            },
            s = e({
                delegatedEvents: !0,
                parseEventVariables: !0,
                assignOptions: !1,
                constructor: function(e) {
                    if (this.cid = "view" + ++r, e && e.$el && (this.$el = e.$el instanceof n ? e.$el : n(e.$el).eq(0), delete e.$el), this.assignOptions) {
                        var t = "function" == typeof this.defaults ? this.defaults() : this.defaults;
                        this.options = "deep" === this.assignOptions ? n.extend(!0, {}, t, e) : n.extend({}, t, e)
                    }
                    this.beforeInitialize && this.beforeInitialize.apply(this, arguments), this.initialize && this.initialize.apply(this, arguments), this.events && this.$el && this.setupEvents()
                },
                setupEvents: function(e) {
                    var t = e || this.events,
                        r = "function" == typeof t ? t.call(this) : t,
                        i = this;
                    if (r) {
                        var s = this.ens = this.ens || "." + this.cid;
                        n.each(r, function(e, t) {
                            i.parseEventVariables && (e = o(e, i));
                            var r = 0 === e.indexOf("one:"),
                                l = (r ? e.slice(4) : e).split(" "),
                                u = l[0] + s,
                                c = l.slice(1).join(" "),
                                f = i.$el;
                            a[c] ? (f = i["$" + c] = i["$" + c] || n(a[c]), c = void 0) : i.delegatedEvents || ((i.elementsWithBoundEvents = i.elementsWithBoundEvents || []).push(f = f.find(c)), c = void 0), f[r ? "one" : "on"](u, c, function() {
                                ("function" == typeof t ? t : i[t]).apply(i, arguments)
                            })
                        })
                    }
                    return this
                },
                removeEvents: function() {
                    var e = this.ens;
                    return e && (this.$el && this.$el.off(e), this.$document && this.$document.off(e), this.$window && this.$window.off(e), this.elementsWithBoundEvents && (n.each(this.elementsWithBoundEvents, function(t, r) {
                        n(r).off(e)
                    }), delete this.elementsWithBoundEvents), delete this.dismissListeners), this
                },
                addDismissListener: function(e, t) {
                    var r = this;
                    if (!e) throw new Error("Dismiss listener name not speficied");
                    return t = n.extend({
                        $el: this.$el
                    }, t), this.$document = this.$document || n(document), this.ens = this.ens || "." + this.cid, this.dismissListeners = this.dismissListeners || {}, this.dismissListeners[e] || (this.dismissListeners[e] = function(i) {
                        27 !== i.keyCode && (n(i.target).is(t.$el) || n.contains(t.$el.get(0), i.target)) || r[e].call(r)
                    }, this.$document.on("click" + this.ens + " keyup" + this.ens, this.dismissListeners[e])), this
                },
                removeDismissListener: function(e) {
                    if (!e) throw new Error("Name of dismiss listener to remove not specified");
                    return this.dismissListeners && this.dismissListeners[e] && (this.$document.off("click keyup", this.dismissListeners[e]), delete this.dismissListeners[e]), this
                },
                remove: function() {
                    return this.trigger("beforeRemove"), this.removeEvents().abortDeferreds().removeViews(), this.$el && this.$el.remove(), this.trigger("afterRemove"), this.off().stopListening(), this
                },
                addDeferred: function(e) {
                    return this.deferreds = this.deferreds || [], (!Array.prototype.indexOf || this.deferreds.indexOf(e) < 0) && this.deferreds.push(e), e
                },
                abortDeferreds: function() {
                    return this.deferreds && n.each(this.deferreds, function(e, t) {
                        "object" == typeof t && t.state && "pending" === t.state() && (t.abort ? t.abort() : t.reject())
                    }), delete this.deferreds, this
                },
                when: function(e, t, r) {
                    var i = this;
                    return n.each(e = n.isArray(e) ? e : [e], function(e, t) {
                        i.addDeferred(t)
                    }), n.when.apply(n, e).done(n.proxy(t, this)).fail(n.proxy(r, this))
                },
                addView: function(e) {
                    return this.views = this.views || {}, this.views[e.cid] = e, this.listenTo(e, "afterRemove", function() {
                        delete this.views[e.cid]
                    }), e
                },
                mapView: function(e, t, r) {
                    var i = ("string" == typeof e ? this.$(e) : n(e)).eq(0);
                    return i.length ? this.addView(new t(n.extend({
                        $el: i
                    }, r))) : void 0
                },
                mapViews: function(e, t, r) {
                    var i = this;
                    return ("string" == typeof e ? this.$(e) : n(e)).map(function(e, o) {
                        return i.addView(new t(n.extend({
                            $el: n(o)
                        }, r)))
                    }).get()
                },
                mapViewsAsync: function(e, t, r) {
                    var i = this,
                        o = n.Deferred(),
                        a = "string" == typeof e ? this.$(e) : n(e);
                    return a.length ? t(function(e) {
                        o.resolve(i.mapViews(a, e, r))
                    }) : o.resolve([]), o
                },
                removeViews: function() {
                    return this.views && n.each(this.views, function(e, t) {
                        t.remove()
                    }), delete this.views, this
                },
                $: function(e) {
                    return this.$el.find(e)
                }
            });
        return t(s.prototype), s
    })
}, function(e, t, n) {
    var r = window.$ = window.jQuery = n(0),
        i = n(1),
        o = n(4);
    n(5), e.exports = i.extend({
        setupCodeHighlight: function() {
            var e = n(8);
            n(7), e.plugins.NormalizeWhitespace.setDefaults({
                "remove-trailing": !0,
                "remove-indent": !0,
                "left-trim": !0,
                "right-trim": !0
            }), e.highlightAll(), r(".attireCodeToggleBlock").on("click", ".attireCodeToggleBtn", function(e) {
                r(e.delegateTarget).toggleClass("isActive"), o.checkAll()
            })
        },
        setupAttireQueue: function() {
            window.attireQueue && window.attireQueue.length && r.each(window.attireQueue, function(e, t) {
                t(r)
            }), window.attireQueue = {
                push: function(e) {
                    e(r)
                }
            }
        }
    })
}, function(e, t, n) {
    var r = n(0),
        i = n(1),
        o = n(9);
    e.exports = i.extend({
        initialize: function() {
            this.options = r.extend({}, this.$el.data()), this.$el.html('<p class="loader">Loading...</p>'), this.$el.whenInViewport(function() {
                this.loadRepos(function(e) {
                    this.render(this.options.user, o(e).slice(0, 3))
                })
            }, {
                threshold: 1e3,
                context: this
            })
        },
        loadRepos: function(e) {
            var t = this.options,
                n = this;
            r.get("https://api.github.com/users/" + t.user + "/repos", function(i) {
                var o = r('link[rel="canonical"]').attr("href"),
                    a = o ? r.map(o.split("/"), function(e) {
                        return e || void 0
                    }).slice(-1)[0] : void 0,
                    s = r.map(i, function(e) {
                        return t.onlyWithPages && !e.has_pages || t.excludeRepo && !(t.excludeRepo.split(",").indexOf(e.name) < 0) || a && a === e.name ? void 0 : {
                            title: e.name,
                            description: e.description,
                            url: e.homepage || e.html_url
                        }
                    });
                e && e.call(n, s)
            })
        },
        render: function(e, t) {
            var n = r("<ul />");
            r.each(t, function(e, t) {
                n.append('<li><a class="attireUserRepo" href="' + t.url + '"><h3 class="title">' + t.title + '</h3><p class="description">' + t.description + "</p></a></li>")
            }), this.$el.empty().append('<h2 class="title">More from ' + e + "</h2>").append(n)
        }
    })
}, function(e, t, n) {
    var r, i, o;
    ! function(n, a) {
        i = [], r = a, void 0 !== (o = "function" == typeof r ? r.apply(t, i) : r) && (e.exports = o)
    }(0, function() {
        function e(e, t, n) {
            u.setup(), this.registryItem = l.addItem(e, "function" == typeof t ? o(n || {}, {
                callback: t
            }) : t), l.processItem(this.registryItem)
        }

        function t() {
            return "innerHeight" in window ? window.innerHeight : document.documentElement.offsetHeight
        }

        function n() {
            return "pageYOffset" in window ? window.pageYOffset : document.documentElement.scrollTop || document.body.scrollTop
        }

        function r(e) {
            return e.getBoundingClientRect().top + n()
        }

        function i(e, t, n) {
            for (var r in e)
                if (e.hasOwnProperty(r) && !1 === t.call(n, e[r], r)) break
        }

        function o(e) {
            for (var t = 1; t < arguments.length; t++) i(arguments[t], function(t, n) {
                e[n] = t
            });
            return e
        }
        var a, s;
        e.prototype.stopListening = function() {
            l.removeItem(this.registryItem), u.removeIfStoreEmpty()
        }, e.defaults = {
            threshold: 0,
            context: null
        }, o(e, {
            setRateLimiter: function(e, t) {
                return u.rateLimiter = e, t && (u.rateLimitDelay = t), this
            },
            checkAll: function() {
                return s = n(), a = t(), l.adjustPositions(l.processItem), u.removeIfStoreEmpty(), this
            },
            destroy: function() {
                return l.store = {}, u.remove(), delete u.scrollHandler, delete u.resizeHandler, this
            },
            registerAsJqueryPlugin: function(t) {
                return t.fn.whenInViewport = function(n, r) {
                    var i, o = function(e) {
                        return function(n) {
                            e.call(this, t(n))
                        }
                    };
                    return i = "function" == typeof n ? t.extend({}, r, {
                        callback: o(n)
                    }) : t.extend(n, {
                        callback: o(n.callback)
                    }), this.each(function() {
                        i.setupOnce ? !t.data(this, "whenInViewport") && t.data(this, "whenInViewport", new e(this, i)) : t.data(this, "whenInViewport", new e(this, i))
                    })
                }, this
            }
        });
        var l = {
                store: {},
                counter: 0,
                addItem: function(t, n) {
                    var i = "whenInViewport" + ++this.counter,
                        a = o({}, e.defaults, n, {
                            storeKey: i,
                            element: t,
                            topOffset: r(t)
                        });
                    return this.store[i] = a
                },
                adjustPositions: function(e) {
                    i(this.store, function(t) {
                        t.topOffset = r(t.element), e && e.call(l, t)
                    })
                },
                processAll: function() {
                    i(this.store, this.processItem, this)
                },
                processItem: function(e) {
                    s + a >= e.topOffset - e.threshold && (this.removeItem(e), e.callback.call(e.context || window, e.element))
                },
                removeItem: function(e) {
                    delete this.store[e.storeKey]
                },
                isEmpty: function() {
                    var e = !0;
                    return i(this.store, function() {
                        return e = !1
                    }), e
                }
            },
            u = {
                setuped: !1,
                rateLimiter: function(e, t) {
                    return e
                },
                rateLimitDelay: 100,
                on: function(e, t) {
                    return window.addEventListener ? window.addEventListener(e, t, !1) : window.attachEvent && window.attachEvent(e, t), this
                },
                off: function(e, t) {
                    return window.removeEventListener ? window.removeEventListener(e, t, !1) : window.detachEvent && window.detachEvent("on" + e, t), this
                },
                setup: function() {
                    var e = this;
                    this.setuped || (s = n(), a = t(), this.scrollHandler = this.scrollHandler || this.rateLimiter(function() {
                        s = n(), l.processAll(), e.removeIfStoreEmpty()
                    }, this.rateLimitDelay), this.resizeHandler = this.resizeHandler || this.rateLimiter(function() {
                        a = t(), l.adjustPositions(l.processItem), e.removeIfStoreEmpty()
                    }, this.rateLimitDelay), this.on("scroll", this.scrollHandler).on("resize", this.resizeHandler), this.setuped = !0)
                },
                removeIfStoreEmpty: function() {
                    l.isEmpty() && this.remove()
                },
                remove: function() {
                    this.setuped && (this.off("scroll", this.scrollHandler).off("resize", this.resizeHandler), this.setuped = !1)
                }
            },
            c = window.jQuery || window.$;
        return c && e.registerAsJqueryPlugin(c), e
    })
}, function(e, t) {
    ! function(e) {
        "use strict";
        e.console || (e.console = {});
        for (var t, n, r = e.console, i = function() {}, o = ["memory"], a = "assert,clear,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profiles,profileEnd,show,table,time,timeEnd,timeline,timelineEnd,timeStamp,trace,warn".split(","); t = o.pop();) r[t] || (r[t] = {});
        for (; n = a.pop();) r[n] || (r[n] = i)
    }("undefined" == typeof window ? this : window)
}, function(e, t, n) {
    var r, i, o;
    ! function(n, a) {
        i = [], r = a, void 0 !== (o = "function" == typeof r ? r.apply(t, i) : r) && (e.exports = o)
    }(0, function() {
        function e(e, t) {
            if (e instanceof Array)
                for (var n = 0; n < e.length; n++) t(e[n], n);
            else
                for (var r in e) e.hasOwnProperty(r) && t(r, e[r])
        }

        function t(e, t) {
            if (Array.prototype.indexOf) return e.indexOf(t);
            for (var n = 0; n < e.length; n++)
                if (e[n] === t) return n;
            return -1
        }

        function n(e, t, n, r) {
            e._mittyOn = e._mittyOn || [], e._mittyOn.push({
                listener: t,
                eventName: n,
                callback: r
            })
        }

        function r(t, n, r, i) {
            if (t._mittyOn && t._mittyOn.length) {
                var o = {},
                    a = [];
                n && (o.listener = n), i && (o.callback = i), r && (o.eventName = r), e(t._mittyOn, function(t) {
                    var n = !0;
                    e(o, function(e, r) {
                        t[e] !== r && (n = !1)
                    }), !n && a.push(t)
                }), t._mittyOn = a
            }
        }

        function i(e, t) {
            if (e._mittyOn)
                for (var n = 0; n < e._mittyOn.length; n++)
                    if (e._mittyOn[n].listener === t) return !0;
            return !1
        }

        function o(n, o, a, s) {
            var l = n._mittyListenTo && n._mittyListenTo.length > 0;
            o && l ? (r(o, n, a, s), i(o, n) || n._mittyListenTo.splice(t(n._mittyListenTo, o), 1)) : l && (e(n._mittyListenTo, function(e) {
                r(e, n)
            }), n._mittyListenTo = [])
        }
        var a = {
            on: function(e, t) {
                return n(this, this, e, t), this
            },
            listenTo: function(e, r, i) {
                return n(e, this, r, i), this._mittyListenTo = this._mittyListenTo || [], t(this._mittyListenTo, e) < 0 && this._mittyListenTo.push(e), this
            },
            off: function(e, t) {
                return r(this, null, e, t), this
            },
            stopListening: function(e, t, n) {
                return o(this, e, t, n), this
            },
            trigger: function(t, n) {
                return this._mittyOn && e(this._mittyOn, function(e) {
                    e.eventName === t && e.callback.call(e.listener, n)
                }), this
            }
        };
        return function(t) {
            return e(a, function(e, n) {
                t[e] = n
            }), t
        }
    })
}, function(e, t) {
    ! function() {
        function t(e) {
            this.defaults = i({}, e)
        }

        function n(e) {
            return e.replace(/-(\w)/g, function(e, t) {
                return t.toUpperCase()
            })
        }

        function r(e) {
            for (var t = 0, n = 0; n < e.length; ++n) e.charCodeAt(n) == "\t".charCodeAt(0) && (t += 3);
            return e.length + t
        }
        var i = Object.assign || function(e, t) {
            for (var n in t) t.hasOwnProperty(n) && (e[n] = t[n]);
            return e
        };
        t.prototype = {
            setDefaults: function(e) {
                this.defaults = i(this.defaults, e)
            },
            normalize: function(e, t) {
                t = i(this.defaults, t);
                for (var r in t) {
                    var o = n(r);
                    "normalize" !== r && "setDefaults" !== o && t[r] && this[o] && (e = this[o].call(this, e, t[r]))
                }
                return e
            },
            leftTrim: function(e) {
                return e.replace(/^\s+/, "")
            },
            rightTrim: function(e) {
                return e.replace(/\s+$/, "")
            },
            tabsToSpaces: function(e, t) {
                return t = 0 | t || 4, e.replace(/\t/g, new Array(++t).join(" "))
            },
            spacesToTabs: function(e, t) {
                return t = 0 | t || 4, e.replace(new RegExp(" {" + t + "}", "g"), "\t")
            },
            removeTrailing: function(e) {
                return e.replace(/\s*?$/gm, "")
            },
            removeInitialLineFeed: function(e) {
                return e.replace(/^(?:\r?\n|\r)/, "")
            },
            removeIndent: function(e) {
                var t = e.match(/^[^\S\n\r]*(?=\S)/gm);
                return t && t[0].length ? (t.sort(function(e, t) {
                    return e.length - t.length
                }), t[0].length ? e.replace(new RegExp("^" + t[0], "gm"), "") : e) : e
            },
            indent: function(e, t) {
                return e.replace(/^[^\S\n\r]*(?=\S)/gm, new Array(++t).join("\t") + "$&")
            },
            breakLines: function(e, t) {
                t = !0 === t ? 80 : 0 | t || 80;
                for (var n = e.split("\n"), i = 0; i < n.length; ++i)
                    if (!(r(n[i]) <= t)) {
                        for (var o = n[i].split(/(\s+)/g), a = 0, s = 0; s < o.length; ++s) {
                            var l = r(o[s]);
                            a += l, a > t && (o[s] = "\n" + o[s], a = l)
                        }
                        n[i] = o.join("")
                    }
                return n.join("\n")
            }
        }, void 0 !== e && e.exports && (e.exports = t), "undefined" != typeof Prism && (Prism.plugins.NormalizeWhitespace = new t({
            "remove-trailing": !0,
            "remove-indent": !0,
            "left-trim": !0,
            "right-trim": !0
        }), Prism.hooks.add("before-sanity-check", function(e) {
            var t = Prism.plugins.NormalizeWhitespace;
            if (!e.settings || !1 !== e.settings["whitespace-normalization"]) {
                if ((!e.element || !e.element.parentNode) && e.code) return void(e.code = t.normalize(e.code, e.settings));
                var n = e.element.parentNode,
                    r = /\bno-whitespace-normalization\b/;
                if (e.code && n && "pre" === n.nodeName.toLowerCase() && !r.test(n.className) && !r.test(e.element.className)) {
                    for (var i = n.childNodes, o = "", a = "", s = !1, l = 0; l < i.length; ++l) {
                        var u = i[l];
                        u == e.element ? s = !0 : "#text" === u.nodeName && (s ? a += u.nodeValue : o += u.nodeValue, n.removeChild(u), --l)
                    }
                    if (e.element.children.length && Prism.plugins.KeepMarkup) {
                        var c = o + e.element.innerHTML + a;
                        e.element.innerHTML = t.normalize(c, e.settings), e.code = e.element.textContent
                    } else e.code = o + e.code + a, e.code = t.normalize(e.code, e.settings)
                }
            }
        }))
    }()
}, function(e, t, n) {
    (function(t) {
        var n = "undefined" != typeof window ? window : "undefined" != typeof WorkerGlobalScope && self instanceof WorkerGlobalScope ? self : {},
            r = function() {
                var e = /\blang(?:uage)?-(\w+)\b/i,
                    t = 0,
                    r = n.Prism = {
                        manual: n.Prism && n.Prism.manual,
                        disableWorkerMessageHandler: n.Prism && n.Prism.disableWorkerMessageHandler,
                        util: {
                            encode: function(e) {
                                return e instanceof i ? new i(e.type, r.util.encode(e.content), e.alias) : "Array" === r.util.type(e) ? e.map(r.util.encode) : e.replace(/&/g, "&amp;").replace(/</g, "&lt;").replace(/\u00a0/g, " ")
                            },
                            type: function(e) {
                                return Object.prototype.toString.call(e).match(/\[object (\w+)\]/)[1]
                            },
                            objId: function(e) {
                                return e.__id || Object.defineProperty(e, "__id", {
                                    value: ++t
                                }), e.__id
                            },
                            clone: function(e) {
                                switch (r.util.type(e)) {
                                    case "Object":
                                        var t = {};
                                        for (var n in e) e.hasOwnProperty(n) && (t[n] = r.util.clone(e[n]));
                                        return t;
                                    case "Array":
                                        return e.map(function(e) {
                                            return r.util.clone(e)
                                        })
                                }
                                return e
                            }
                        },
                        languages: {
                            extend: function(e, t) {
                                var n = r.util.clone(r.languages[e]);
                                for (var i in t) n[i] = t[i];
                                return n
                            },
                            insertBefore: function(e, t, n, i) {
                                i = i || r.languages;
                                var o = i[e];
                                if (2 == arguments.length) {
                                    n = arguments[1];
                                    for (var a in n) n.hasOwnProperty(a) && (o[a] = n[a]);
                                    return o
                                }
                                var s = {};
                                for (var l in o)
                                    if (o.hasOwnProperty(l)) {
                                        if (l == t)
                                            for (var a in n) n.hasOwnProperty(a) && (s[a] = n[a]);
                                        s[l] = o[l]
                                    }
                                return r.languages.DFS(r.languages, function(t, n) {
                                    n === i[e] && t != e && (this[t] = s)
                                }), i[e] = s
                            },
                            DFS: function(e, t, n, i) {
                                i = i || {};
                                for (var o in e) e.hasOwnProperty(o) && (t.call(e, o, e[o], n || o), "Object" !== r.util.type(e[o]) || i[r.util.objId(e[o])] ? "Array" !== r.util.type(e[o]) || i[r.util.objId(e[o])] || (i[r.util.objId(e[o])] = !0, r.languages.DFS(e[o], t, o, i)) : (i[r.util.objId(e[o])] = !0, r.languages.DFS(e[o], t, null, i)))
                            }
                        },
                        plugins: {},
                        highlightAll: function(e, t) {
                            r.highlightAllUnder(document, e, t)
                        },
                        highlightAllUnder: function(e, t, n) {
                            var i = {
                                callback: n,
                                selector: 'code[class*="language-"], [class*="language-"] code, code[class*="lang-"], [class*="lang-"] code'
                            };
                            r.hooks.run("before-highlightall", i);
                            for (var o, a = i.elements || e.querySelectorAll(i.selector), s = 0; o = a[s++];) r.highlightElement(o, !0 === t, i.callback)
                        },
                        highlightElement: function(t, i, o) {
                            for (var a, s, l = t; l && !e.test(l.className);) l = l.parentNode;
                            l && (a = (l.className.match(e) || [, ""])[1].toLowerCase(), s = r.languages[a]), t.className = t.className.replace(e, "").replace(/\s+/g, " ") + " language-" + a, t.parentNode && (l = t.parentNode, /pre/i.test(l.nodeName) && (l.className = l.className.replace(e, "").replace(/\s+/g, " ") + " language-" + a));
                            var u = t.textContent,
                                c = {
                                    element: t,
                                    language: a,
                                    grammar: s,
                                    code: u
                                };
                            if (r.hooks.run("before-sanity-check", c), !c.code || !c.grammar) return c.code && (r.hooks.run("before-highlight", c), c.element.textContent = c.code, r.hooks.run("after-highlight", c)), void r.hooks.run("complete", c);
                            if (r.hooks.run("before-highlight", c), i && n.Worker) {
                                var f = new Worker(r.filename);
                                f.onmessage = function(e) {
                                    c.highlightedCode = e.data, r.hooks.run("before-insert", c), c.element.innerHTML = c.highlightedCode, o && o.call(c.element), r.hooks.run("after-highlight", c), r.hooks.run("complete", c)
                                }, f.postMessage(JSON.stringify({
                                    language: c.language,
                                    code: c.code,
                                    immediateClose: !0
                                }))
                            } else c.highlightedCode = r.highlight(c.code, c.grammar, c.language), r.hooks.run("before-insert", c), c.element.innerHTML = c.highlightedCode, o && o.call(t), r.hooks.run("after-highlight", c), r.hooks.run("complete", c)
                        },
                        highlight: function(e, t, n) {
                            var o = r.tokenize(e, t);
                            return i.stringify(r.util.encode(o), n)
                        },
                        matchGrammar: function(e, t, n, i, o, a, s) {
                            var l = r.Token;
                            for (var u in n)
                                if (n.hasOwnProperty(u) && n[u]) {
                                    if (u == s) return;
                                    var c = n[u];
                                    c = "Array" === r.util.type(c) ? c : [c];
                                    for (var f = 0; f < c.length; ++f) {
                                        var d = c[f],
                                            p = d.inside,
                                            h = !!d.lookbehind,
                                            g = !!d.greedy,
                                            m = 0,
                                            v = d.alias;
                                        if (g && !d.pattern.global) {
                                            var y = d.pattern.toString().match(/[imuy]*$/)[0];
                                            d.pattern = RegExp(d.pattern.source, y + "g")
                                        }
                                        d = d.pattern || d;
                                        for (var b = i, x = o; b < t.length; x += t[b].length, ++b) {
                                            var w = t[b];
                                            if (t.length > e.length) return;
                                            if (!(w instanceof l)) {
                                                d.lastIndex = 0;
                                                var T = d.exec(w),
                                                    k = 1;
                                                if (!T && g && b != t.length - 1) {
                                                    if (d.lastIndex = x, !(T = d.exec(e))) break;
                                                    for (var E = T.index + (h ? T[1].length : 0), C = T.index + T[0].length, N = b, S = x, A = t.length; N < A && (S < C || !t[N].type && !t[N - 1].greedy); ++N) S += t[N].length, E >= S && (++b, x = S);
                                                    if (t[b] instanceof l || t[N - 1].greedy) continue;
                                                    k = N - b, w = e.slice(x, S), T.index -= x
                                                }
                                                if (T) {
                                                    h && (m = T[1].length);
                                                    var E = T.index + m,
                                                        T = T[0].slice(m),
                                                        C = E + T.length,
                                                        L = w.slice(0, E),
                                                        j = w.slice(C),
                                                        D = [b, k];
                                                    L && (++b, x += L.length, D.push(L));
                                                    var O = new l(u, p ? r.tokenize(T, p) : T, v, T, g);
                                                    if (D.push(O), j && D.push(j), Array.prototype.splice.apply(t, D), 1 != k && r.matchGrammar(e, t, n, b, x, !0, u), a) break
                                                } else if (a) break
                                            }
                                        }
                                    }
                                }
                        },
                        tokenize: function(e, t, n) {
                            var i = [e],
                                o = t.rest;
                            if (o) {
                                for (var a in o) t[a] = o[a];
                                delete t.rest
                            }
                            return r.matchGrammar(e, i, t, 0, 0, !1), i
                        },
                        hooks: {
                            all: {},
                            add: function(e, t) {
                                var n = r.hooks.all;
                                n[e] = n[e] || [], n[e].push(t)
                            },
                            run: function(e, t) {
                                var n = r.hooks.all[e];
                                if (n && n.length)
                                    for (var i, o = 0; i = n[o++];) i(t)
                            }
                        }
                    },
                    i = r.Token = function(e, t, n, r, i) {
                        this.type = e, this.content = t, this.alias = n, this.length = 0 | (r || "").length, this.greedy = !!i
                    };
                if (i.stringify = function(e, t, n) {
                        if ("string" == typeof e) return e;
                        if ("Array" === r.util.type(e)) return e.map(function(n) {
                            return i.stringify(n, t, e)
                        }).join("");
                        var o = {
                            type: e.type,
                            content: i.stringify(e.content, t, n),
                            tag: "span",
                            classes: ["token", e.type],
                            attributes: {},
                            language: t,
                            parent: n
                        };
                        if (e.alias) {
                            var a = "Array" === r.util.type(e.alias) ? e.alias : [e.alias];
                            Array.prototype.push.apply(o.classes, a)
                        }
                        r.hooks.run("wrap", o);
                        var s = Object.keys(o.attributes).map(function(e) {
                            return e + '="' + (o.attributes[e] || "").replace(/"/g, "&quot;") + '"'
                        }).join(" ");
                        return "<" + o.tag + ' class="' + o.classes.join(" ") + '"' + (s ? " " + s : "") + ">" + o.content + "</" + o.tag + ">"
                    }, !n.document) return n.addEventListener ? (r.disableWorkerMessageHandler || n.addEventListener("message", function(e) {
                    var t = JSON.parse(e.data),
                        i = t.language,
                        o = t.code,
                        a = t.immediateClose;
                    n.postMessage(r.highlight(o, r.languages[i], i)), a && n.close()
                }, !1), n.Prism) : n.Prism;
                var o = document.currentScript || [].slice.call(document.getElementsByTagName("script")).pop();
                return o && (r.filename = o.src, r.manual || o.hasAttribute("data-manual") || ("loading" !== document.readyState ? window.requestAnimationFrame ? window.requestAnimationFrame(r.highlightAll) : window.setTimeout(r.highlightAll, 16) : document.addEventListener("DOMContentLoaded", r.highlightAll))), n.Prism
            }();
        void 0 !== e && e.exports && (e.exports = r), void 0 !== t && (t.Prism = r), r.languages.markup = {
                comment: /<!--[\s\S]*?-->/,
                prolog: /<\?[\s\S]+?\?>/,
                doctype: /<!DOCTYPE[\s\S]+?>/i,
                cdata: /<!\[CDATA\[[\s\S]*?]]>/i,
                tag: {
                    pattern: /<\/?(?!\d)[^\s>\/=$<]+(?:\s+[^\s>\/=]+(?:=(?:("|')(?:\\[\s\S]|(?!\1)[^\\])*\1|[^\s'">=]+))?)*\s*\/?>/i,
                    inside: {
                        tag: {
                            pattern: /^<\/?[^\s>\/]+/i,
                            inside: {
                                punctuation: /^<\/?/,
                                namespace: /^[^\s>\/:]+:/
                            }
                        },
                        "attr-value": {
                            pattern: /=(?:("|')(?:\\[\s\S]|(?!\1)[^\\])*\1|[^\s'">=]+)/i,
                            inside: {
                                punctuation: [/^=/, {
                                    pattern: /(^|[^\\])["']/,
                                    lookbehind: !0
                                }]
                            }
                        },
                        punctuation: /\/?>/,
                        "attr-name": {
                            pattern: /[^\s>\/]+/,
                            inside: {
                                namespace: /^[^\s>\/:]+:/
                            }
                        }
                    }
                },
                entity: /&#?[\da-z]{1,8};/i
            }, r.languages.markup.tag.inside["attr-value"].inside.entity = r.languages.markup.entity, r.hooks.add("wrap", function(e) {
                "entity" === e.type && (e.attributes.title = e.content.replace(/&amp;/, "&"))
            }), r.languages.xml = r.languages.markup, r.languages.html = r.languages.markup, r.languages.mathml = r.languages.markup, r.languages.svg = r.languages.markup, r.languages.css = {
                comment: /\/\*[\s\S]*?\*\//,
                atrule: {
                    pattern: /@[\w-]+?.*?(?:;|(?=\s*\{))/i,
                    inside: {
                        rule: /@[\w-]+/
                    }
                },
                url: /url\((?:(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1|.*?)\)/i,
                selector: /[^{}\s][^{};]*?(?=\s*\{)/,
                string: {
                    pattern: /("|')(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
                    greedy: !0
                },
                property: /[-_a-z\xA0-\uFFFF][-\w\xA0-\uFFFF]*(?=\s*:)/i,
                important: /\B!important\b/i,
                function: /[-a-z0-9]+(?=\()/i,
                punctuation: /[(){};:]/
            }, r.languages.css.atrule.inside.rest = r.util.clone(r.languages.css), r.languages.markup && (r.languages.insertBefore("markup", "tag", {
                style: {
                    pattern: /(<style[\s\S]*?>)[\s\S]*?(?=<\/style>)/i,
                    lookbehind: !0,
                    inside: r.languages.css,
                    alias: "language-css",
                    greedy: !0
                }
            }), r.languages.insertBefore("inside", "attr-value", {
                "style-attr": {
                    pattern: /\s*style=("|')(?:\\[\s\S]|(?!\1)[^\\])*\1/i,
                    inside: {
                        "attr-name": {
                            pattern: /^\s*style/i,
                            inside: r.languages.markup.tag.inside
                        },
                        punctuation: /^\s*=\s*['"]|['"]\s*$/,
                        "attr-value": {
                            pattern: /.+/i,
                            inside: r.languages.css
                        }
                    },
                    alias: "language-css"
                }
            }, r.languages.markup.tag)), r.languages.clike = {
                comment: [{
                    pattern: /(^|[^\\])\/\*[\s\S]*?(?:\*\/|$)/,
                    lookbehind: !0
                }, {
                    pattern: /(^|[^\\:])\/\/.*/,
                    lookbehind: !0
                }],
                string: {
                    pattern: /(["'])(?:\\(?:\r\n|[\s\S])|(?!\1)[^\\\r\n])*\1/,
                    greedy: !0
                },
                "class-name": {
                    pattern: /((?:\b(?:class|interface|extends|implements|trait|instanceof|new)\s+)|(?:catch\s+\())[\w.\\]+/i,
                    lookbehind: !0,
                    inside: {
                        punctuation: /[.\\]/
                    }
                },
                keyword: /\b(?:if|else|while|do|for|return|in|instanceof|function|new|try|throw|catch|finally|null|break|continue)\b/,
                boolean: /\b(?:true|false)\b/,
                function: /[a-z0-9_]+(?=\()/i,
                number: /\b-?(?:0x[\da-f]+|\d*\.?\d+(?:e[+-]?\d+)?)\b/i,
                operator: /--?|\+\+?|!=?=?|<=?|>=?|==?=?|&&?|\|\|?|\?|\*|\/|~|\^|%/,
                punctuation: /[{}[\];(),.:]/
            }, r.languages.javascript = r.languages.extend("clike", {
                keyword: /\b(?:as|async|await|break|case|catch|class|const|continue|debugger|default|delete|do|else|enum|export|extends|finally|for|from|function|get|if|implements|import|in|instanceof|interface|let|new|null|of|package|private|protected|public|return|set|static|super|switch|this|throw|try|typeof|var|void|while|with|yield)\b/,
                number: /\b-?(?:0[xX][\dA-Fa-f]+|0[bB][01]+|0[oO][0-7]+|\d*\.?\d+(?:[Ee][+-]?\d+)?|NaN|Infinity)\b/,
                function: /[_$a-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\s*\()/i,
                operator: /-[-=]?|\+[+=]?|!=?=?|<<?=?|>>?>?=?|=(?:==?|>)?|&[&=]?|\|[|=]?|\*\*?=?|\/=?|~|\^=?|%=?|\?|\.{3}/
            }), r.languages.insertBefore("javascript", "keyword", {
                regex: {
                    pattern: /(^|[^\/])\/(?!\/)(\[[^\]\r\n]+]|\\.|[^\/\\\[\r\n])+\/[gimyu]{0,5}(?=\s*($|[\r\n,.;})]))/,
                    lookbehind: !0,
                    greedy: !0
                },
                "function-variable": {
                    pattern: /[_$a-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*(?=\s*=\s*(?:function\b|(?:\([^()]*\)|[_$a-z\xA0-\uFFFF][$\w\xA0-\uFFFF]*)\s*=>))/i,
                    alias: "function"
                }
            }), r.languages.insertBefore("javascript", "string", {
                "template-string": {
                    pattern: /`(?:\\[\s\S]|[^\\`])*`/,
                    greedy: !0,
                    inside: {
                        interpolation: {
                            pattern: /\$\{[^}]+\}/,
                            inside: {
                                "interpolation-punctuation": {
                                    pattern: /^\$\{|\}$/,
                                    alias: "punctuation"
                                },
                                rest: r.languages.javascript
                            }
                        },
                        string: /[\s\S]+/
                    }
                }
            }), r.languages.markup && r.languages.insertBefore("markup", "tag", {
                script: {
                    pattern: /(<script[\s\S]*?>)[\s\S]*?(?=<\/script>)/i,
                    lookbehind: !0,
                    inside: r.languages.javascript,
                    alias: "language-javascript",
                    greedy: !0
                }
            }), r.languages.js = r.languages.javascript,
            function() {
                "undefined" != typeof self && self.Prism && self.document && document.querySelector && (self.Prism.fileHighlight = function() {
                    var e = {
                        js: "javascript",
                        py: "python",
                        rb: "ruby",
                        ps1: "powershell",
                        psm1: "powershell",
                        sh: "bash",
                        bat: "batch",
                        h: "c",
                        tex: "latex"
                    };
                    Array.prototype.slice.call(document.querySelectorAll("pre[data-src]")).forEach(function(t) {
                        for (var n, i = t.getAttribute("data-src"), o = t, a = /\blang(?:uage)?-(?!\*)(\w+)\b/i; o && !a.test(o.className);) o = o.parentNode;
                        if (o && (n = (t.className.match(a) || [, ""])[1]), !n) {
                            var s = (i.match(/\.(\w+)$/) || [, ""])[1];
                            n = e[s] || s
                        }
                        var l = document.createElement("code");
                        l.className = "language-" + n, t.textContent = "", l.textContent = "Loading…", t.appendChild(l);
                        var u = new XMLHttpRequest;
                        u.open("GET", i, !0), u.onreadystatechange = function() {
                            4 == u.readyState && (u.status < 400 && u.responseText ? (l.textContent = u.responseText, r.highlightElement(l)) : u.status >= 400 ? l.textContent = "✖ Error " + u.status + " while fetching file: " + u.statusText : l.textContent = "✖ Error: File does not exist or is empty")
                        }, u.send(null)
                    })
                }, document.addEventListener("DOMContentLoaded", self.Prism.fileHighlight))
            }()
    }).call(t, n(11))
}, function(e, t, n) {
    "use strict";

    function r(e, t) {
        if (!Array.isArray(e)) throw new Error("shuffle expect an array as parameter.");
        t = t || {};
        var n, r, i = e,
            o = e.length,
            a = t.rng || Math.random;
        for (!0 === t.copy && (i = e.slice()); o;) n = Math.floor(a() * o), o -= 1, r = i[o], i[o] = i[n], i[n] = r;
        return i
    }
    r.pick = function(e, t) {
        if (!Array.isArray(e)) throw new Error("shuffle.pick() expect an array as parameter.");
        t = t || {};
        var n = t.rng || Math.random,
            r = t.picks || 1;
        if ("number" == typeof r && 1 !== r) {
            for (var i, o = e.length, a = e.slice(), s = []; r && o;) i = Math.floor(n() * o), s.push(a[i]), a.splice(i, 1), o -= 1, r -= 1;
            return s
        }
        return e[Math.floor(n() * e.length)]
    }, e.exports = r
}, function(e, t, n) {
    var r, i, o;
    ! function(n, a) {
        i = [], r = a, void 0 !== (o = "function" == typeof r ? r.apply(t, i) : r) && (e.exports = o)
    }(0, function() {
        function e(e, t) {
            for (var n in e) e.hasOwnProperty(n) && t(e[n], n)
        }

        function t(t) {
            for (var n = 1; n < arguments.length; n++) e(arguments[n], function(e, n) {
                void 0 !== e && (t[n] = e)
            });
            return t
        }

        function n(e, n, i) {
            n = n || {};
            var o = n.hasOwnProperty("constructor") ? n.constructor : function() {
                e ? e.apply(this, arguments) : (this.assignOptions && (this.writeOptions.apply(this, arguments), this.optionRules && this.validateOptions(this.options, this.optionRules)), this.initialize && this.initialize.apply(this, arguments))
            };
            if (e) {
                var a = function() {
                    this.constructor = o
                };
                a.prototype = e.prototype, o.prototype = new a, t(o, e)
            } else t(n, r);
            return i && t(o, i), t(o.prototype, n), o
        }
        var r = {
            writeOptions: function(n) {
                var r = "function" == typeof this.defaults ? this.defaults() : this.defaults,
                    i = {};
                this.optionRules && e(this.optionRules, function(e, t) {
                    i[t] = e.default
                }), this.options = t({}, r, i, n)
            },
            validateOptions: function(t, n) {
                var r = [];
                if (e(n, function(e, n) {
                        var i = t[n],
                            o = typeof i;
                        !1 === e.required && "undefined" === o || (e.type && o !== e.type && r.push('Option "' + n + '" is ' + o + ", expected " + e.type + "."), e.rule && !e.rule(i) && r.push('Option "' + n + '" breaks defined rule.'), !e.instanceOf || i instanceof e.instanceOf || r.push('Option "' + n + '" is not instance of defined constructor.'))
                    }), r.length) throw new Error(r.join(" "));
                return this
            }
        };
        return function(e, t) {
            var r = n(null, e, t);
            return r.extend = function(e, t) {
                return n(this, e, t)
            }, r
        }
    })
}, function(e, t) {
    var n;
    n = function() {
        return this
    }();
    try {
        n = n || Function("return this")() || (0, eval)("this")
    } catch (e) {
        "object" == typeof window && (n = window)
    }
    e.exports = n
}, function(e, t, n) {
    var r, i;
    ! function(o) {
        function a(e) {
            return l ? l[e] : (l = n(! function() {
                var e = new Error('Cannot find module "unicode/category/So"');
                throw e.code = "MODULE_NOT_FOUND", e
            }()), u = ["sign", "cross", "of", "symbol", "staff", "hand", "black", "white"].map(function(e) {
                return new RegExp(e, "gi")
            }), l[e])
        }

        function s(e, t) {
            e = e.toString(), "string" == typeof t && (t = {
                replacement: t
            }), t = t || {}, t.mode = t.mode || s.defaults.mode;
            for (var n, r = s.defaults.modes[t.mode], i = ["replacement", "multicharmap", "charmap", "remove", "lower"], o = 0, l = i.length; o < l; o++) n = i[o], t[n] = n in t ? t[n] : r[n];
            void 0 === t.symbols && (t.symbols = r.symbols);
            var c = [];
            for (var n in t.multicharmap)
                if (t.multicharmap.hasOwnProperty(n)) {
                    var f = n.length; - 1 === c.indexOf(f) && c.push(f)
                }
            for (var d, p, h, g = "", o = 0, l = e.length; o < l; o++) {
                if (h = e[o], !c.some(function(n) {
                        var r = e.substr(o, n);
                        return !!t.multicharmap[r] && (o += n - 1, h = t.multicharmap[r], !0)
                    }) && (t.charmap[h] ? (h = t.charmap[h], d = h.charCodeAt(0)) : d = e.charCodeAt(o), t.symbols && (p = a(d)))) {
                    h = p.name.toLowerCase();
                    for (var m = 0, v = u.length; m < v; m++) h = h.replace(u[m], "");
                    h = h.replace(/^\s+|\s+$/g, "")
                }
                h = h.replace(/[^\w\s\-\.\_~]/g, ""), t.remove && (h = h.replace(t.remove, "")), g += h
            }
            return g = g.replace(/^\s+|\s+$/g, ""), g = g.replace(/[-\s]+/g, t.replacement), g = g.replace(t.replacement + "$", ""), t.lower && (g = g.toLowerCase()), g
        }
        var l, u;
        s.defaults = {
            mode: "pretty"
        }, s.multicharmap = s.defaults.multicharmap = {
            "<3": "love",
            "&&": "and",
            "||": "or",
            "w/": "with"
        }, s.charmap = s.defaults.charmap = {
            "À": "A",
            "Á": "A",
            "Â": "A",
            "Ã": "A",
            "Ä": "A",
            "Å": "A",
            "Æ": "AE",
            "Ç": "C",
            "È": "E",
            "É": "E",
            "Ê": "E",
            "Ë": "E",
            "Ì": "I",
            "Í": "I",
            "Î": "I",
            "Ï": "I",
            "Ð": "D",
            "Ñ": "N",
            "Ò": "O",
            "Ó": "O",
            "Ô": "O",
            "Õ": "O",
            "Ö": "O",
            "Ő": "O",
            "Ø": "O",
            "Ù": "U",
            "Ú": "U",
            "Û": "U",
            "Ü": "U",
            "Ű": "U",
            "Ý": "Y",
            "Þ": "TH",
            "ß": "ss",
            "à": "a",
            "á": "a",
            "â": "a",
            "ã": "a",
            "ä": "a",
            "å": "a",
            "æ": "ae",
            "ç": "c",
            "è": "e",
            "é": "e",
            "ê": "e",
            "ë": "e",
            "ì": "i",
            "í": "i",
            "î": "i",
            "ï": "i",
            "ð": "d",
            "ñ": "n",
            "ò": "o",
            "ó": "o",
            "ô": "o",
            "õ": "o",
            "ö": "o",
            "ő": "o",
            "ø": "o",
            "ù": "u",
            "ú": "u",
            "û": "u",
            "ü": "u",
            "ű": "u",
            "ý": "y",
            "þ": "th",
            "ÿ": "y",
            "ẞ": "SS",
            "α": "a",
            "β": "b",
            "γ": "g",
            "δ": "d",
            "ε": "e",
            "ζ": "z",
            "η": "h",
            "θ": "8",
            "ι": "i",
            "κ": "k",
            "λ": "l",
            "μ": "m",
            "ν": "n",
            "ξ": "3",
            "ο": "o",
            "π": "p",
            "ρ": "r",
            "σ": "s",
            "τ": "t",
            "υ": "y",
            "φ": "f",
            "χ": "x",
            "ψ": "ps",
            "ω": "w",
            "ά": "a",
            "έ": "e",
            "ί": "i",
            "ό": "o",
            "ύ": "y",
            "ή": "h",
            "ώ": "w",
            "ς": "s",
            "ϊ": "i",
            "ΰ": "y",
            "ϋ": "y",
            "ΐ": "i",
            "Α": "A",
            "Β": "B",
            "Γ": "G",
            "Δ": "D",
            "Ε": "E",
            "Ζ": "Z",
            "Η": "H",
            "Θ": "8",
            "Ι": "I",
            "Κ": "K",
            "Λ": "L",
            "Μ": "M",
            "Ν": "N",
            "Ξ": "3",
            "Ο": "O",
            "Π": "P",
            "Ρ": "R",
            "Σ": "S",
            "Τ": "T",
            "Υ": "Y",
            "Φ": "F",
            "Χ": "X",
            "Ψ": "PS",
            "Ω": "W",
            "Ά": "A",
            "Έ": "E",
            "Ί": "I",
            "Ό": "O",
            "Ύ": "Y",
            "Ή": "H",
            "Ώ": "W",
            "Ϊ": "I",
            "Ϋ": "Y",
            "ş": "s",
            "Ş": "S",
            "ı": "i",
            "İ": "I",
            "ğ": "g",
            "Ğ": "G",
            "а": "a",
            "б": "b",
            "в": "v",
            "г": "g",
            "д": "d",
            "е": "e",
            "ё": "yo",
            "ж": "zh",
            "з": "z",
            "и": "i",
            "й": "j",
            "к": "k",
            "л": "l",
            "м": "m",
            "н": "n",
            "о": "o",
            "п": "p",
            "р": "r",
            "с": "s",
            "т": "t",
            "у": "u",
            "ф": "f",
            "х": "h",
            "ц": "c",
            "ч": "ch",
            "ш": "sh",
            "щ": "sh",
            "ъ": "u",
            "ы": "y",
            "ь": "",
            "э": "e",
            "ю": "yu",
            "я": "ya",
            "А": "A",
            "Б": "B",
            "В": "V",
            "Г": "G",
            "Д": "D",
            "Е": "E",
            "Ё": "Yo",
            "Ж": "Zh",
            "З": "Z",
            "И": "I",
            "Й": "J",
            "К": "K",
            "Л": "L",
            "М": "M",
            "Н": "N",
            "О": "O",
            "П": "P",
            "Р": "R",
            "С": "S",
            "Т": "T",
            "У": "U",
            "Ф": "F",
            "Х": "H",
            "Ц": "C",
            "Ч": "Ch",
            "Ш": "Sh",
            "Щ": "Sh",
            "Ъ": "U",
            "Ы": "Y",
            "Ь": "",
            "Э": "E",
            "Ю": "Yu",
            "Я": "Ya",
            "Є": "Ye",
            "І": "I",
            "Ї": "Yi",
            "Ґ": "G",
            "є": "ye",
            "і": "i",
            "ї": "yi",
            "ґ": "g",
            "č": "c",
            "ď": "d",
            "ě": "e",
            "ň": "n",
            "ř": "r",
            "š": "s",
            "ť": "t",
            "ů": "u",
            "ž": "z",
            "Č": "C",
            "Ď": "D",
            "Ě": "E",
            "Ň": "N",
            "Ř": "R",
            "Š": "S",
            "Ť": "T",
            "Ů": "U",
            "Ž": "Z",
            "ą": "a",
            "ć": "c",
            "ę": "e",
            "ł": "l",
            "ń": "n",
            "ś": "s",
            "ź": "z",
            "ż": "z",
            "Ą": "A",
            "Ć": "C",
            "Ę": "E",
            "Ł": "L",
            "Ń": "N",
            "Ś": "S",
            "Ź": "Z",
            "Ż": "Z",
            "ā": "a",
            "ē": "e",
            "ģ": "g",
            "ī": "i",
            "ķ": "k",
            "ļ": "l",
            "ņ": "n",
            "ū": "u",
            "Ā": "A",
            "Ē": "E",
            "Ģ": "G",
            "Ī": "I",
            "Ķ": "K",
            "Ļ": "L",
            "Ņ": "N",
            "Ū": "U",
            "ė": "e",
            "į": "i",
            "ų": "u",
            "Ė": "E",
            "Į": "I",
            "Ų": "U",
            "ț": "t",
            "Ț": "T",
            "ţ": "t",
            "Ţ": "T",
            "ș": "s",
            "Ș": "S",
            "ă": "a",
            "Ă": "A",
            "Ạ": "A",
            "Ả": "A",
            "Ầ": "A",
            "Ấ": "A",
            "Ậ": "A",
            "Ẩ": "A",
            "Ẫ": "A",
            "Ằ": "A",
            "Ắ": "A",
            "Ặ": "A",
            "Ẳ": "A",
            "Ẵ": "A",
            "Ẹ": "E",
            "Ẻ": "E",
            "Ẽ": "E",
            "Ề": "E",
            "Ế": "E",
            "Ệ": "E",
            "Ể": "E",
            "Ễ": "E",
            "Ị": "I",
            "Ỉ": "I",
            "Ĩ": "I",
            "Ọ": "O",
            "Ỏ": "O",
            "Ồ": "O",
            "Ố": "O",
            "Ộ": "O",
            "Ổ": "O",
            "Ỗ": "O",
            "Ơ": "O",
            "Ờ": "O",
            "Ớ": "O",
            "Ợ": "O",
            "Ở": "O",
            "Ỡ": "O",
            "Ụ": "U",
            "Ủ": "U",
            "Ũ": "U",
            "Ư": "U",
            "Ừ": "U",
            "Ứ": "U",
            "Ự": "U",
            "Ử": "U",
            "Ữ": "U",
            "Ỳ": "Y",
            "Ỵ": "Y",
            "Ỷ": "Y",
            "Ỹ": "Y",
            "Đ": "D",
            "ạ": "a",
            "ả": "a",
            "ầ": "a",
            "ấ": "a",
            "ậ": "a",
            "ẩ": "a",
            "ẫ": "a",
            "ằ": "a",
            "ắ": "a",
            "ặ": "a",
            "ẳ": "a",
            "ẵ": "a",
            "ẹ": "e",
            "ẻ": "e",
            "ẽ": "e",
            "ề": "e",
            "ế": "e",
            "ệ": "e",
            "ể": "e",
            "ễ": "e",
            "ị": "i",
            "ỉ": "i",
            "ĩ": "i",
            "ọ": "o",
            "ỏ": "o",
            "ồ": "o",
            "ố": "o",
            "ộ": "o",
            "ổ": "o",
            "ỗ": "o",
            "ơ": "o",
            "ờ": "o",
            "ớ": "o",
            "ợ": "o",
            "ở": "o",
            "ỡ": "o",
            "ụ": "u",
            "ủ": "u",
            "ũ": "u",
            "ư": "u",
            "ừ": "u",
            "ứ": "u",
            "ự": "u",
            "ử": "u",
            "ữ": "u",
            "ỳ": "y",
            "ỵ": "y",
            "ỷ": "y",
            "ỹ": "y",
            "đ": "d",
            "€": "euro",
            "₢": "cruzeiro",
            "₣": "french franc",
            "£": "pound",
            "₤": "lira",
            "₥": "mill",
            "₦": "naira",
            "₧": "peseta",
            "₨": "rupee",
            "₩": "won",
            "₪": "new shequel",
            "₫": "dong",
            "₭": "kip",
            "₮": "tugrik",
            "₯": "drachma",
            "₰": "penny",
            "₱": "peso",
            "₲": "guarani",
            "₳": "austral",
            "₴": "hryvnia",
            "₵": "cedi",
            "¢": "cent",
            "¥": "yen",
            "元": "yuan",
            "円": "yen",
            "﷼": "rial",
            "₠": "ecu",
            "¤": "currency",
            "฿": "baht",
            $: "dollar",
            "₹": "indian rupee",
            "©": "(c)",
            "œ": "oe",
            "Œ": "OE",
            "∑": "sum",
            "®": "(r)",
            "†": "+",
            "“": '"',
            "”": '"',
            "‘": "'",
            "’": "'",
            "∂": "d",
            "ƒ": "f",
            "™": "tm",
            "℠": "sm",
            "…": "...",
            "˚": "o",
            "º": "o",
            "ª": "a",
            "•": "*",
            "∆": "delta",
            "∞": "infinity",
            "♥": "love",
            "&": "and",
            "|": "or",
            "<": "less",
            ">": "greater"
        }, s.defaults.modes = {
            rfc3986: {
                replacement: "-",
                symbols: !0,
                remove: null,
                lower: !0,
                charmap: s.defaults.charmap,
                multicharmap: s.defaults.multicharmap
            },
            pretty: {
                replacement: "-",
                symbols: !0,
                remove: /[.]/g,
                lower: !1,
                charmap: s.defaults.charmap,
                multicharmap: s.defaults.multicharmap
            }
        };
        var c;
        for (var c in s.defaults.modes) s.defaults.modes.hasOwnProperty(c) && (s.defaults.modes[c].symbols = !1);
        r = [], void 0 !== (i = function() {
            return s
        }.apply(t, r)) && (e.exports = i)
    }()
}, function(e, t, n) {
    var r, i, o = n(0),
        a = n(1),
        s = n(2),
        l = n(3),
        u = n(12);
    r = s.extend({
        initialize: function() {
            this.addView(new i), this.setupCodeHighlight(), this.setupAttireQueue(), this.mapView(".attireUserRepositories", l)
        }
    }), i = a.extend({
        initialize: function() {
            this.$el = this.setupElement()
        },
        events: {
            "click > .toggleBtn": function(e) {
                this.$el.toggleClass("isActive")
            }
        },
        setupElement: function() {
            var e = o(".attireMainNav");
            if (e.length) return e;
            var t = o('<nav class="attireMainNav"><button class="toggleBtn iconMenu" type="button">Toggle navigation</button></nav>'),
                n = o("<ul>").appendTo(t);
            return o(".attireBlock").each(function(e, t) {
                var r = o(t),
                    i = r.find("h1, h2, h3, h4, h5").first();
                if (i.length) {
                    var a = i.data("nav-title") || i.text(),
                        s = u(a, {
                            lower: !0
                        });
                    o('<li><a href="#section-' + s + '">' + a + "</a></li>").appendTo(n), r.attr("id", "section-" + s)
                }
            }), t.prependTo("body")
        }
    }), o(document).ready(function() {
        new r({
            $el: "body"
        })
    })
}]);