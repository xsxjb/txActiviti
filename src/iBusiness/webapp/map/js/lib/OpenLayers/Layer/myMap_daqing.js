var tj = new OpenLayers.Projection("EPSG:4326"), resolutions = [];
OpenLayers.Layer.g = OpenLayers.Class(OpenLayers.Layer.HTTPRequest, {
	tileSize : null,	tileOriginCorner : "bl",
	tileOrigin : null,
	tileOptions : null,
	grid : null,	singleTile : !1,
	ratio : 1.5,	buffer : 0,
	numLoadingTiles : 0,	tileLoadingDelay : 100,
	timerId : null,	initialize : function(e, f, g, h) {
		OpenLayers.Layer.HTTPRequest.prototype.initialize.apply(this, arguments);
		this.events.addEventType("tileloaded");
		this.grid = [];		this._moveGriddedTiles = OpenLayers.Function.bind(
				this.moveGriddedTiles, this)
	},
	removeMap : function() {
		if (null != this.timerId) {
			window.clearTimeout(this.timerId), this.timerId = null
		}
	},
	destroy : function() {		this.clearGrid();
		this.tileSize = this.grid = null;
		OpenLayers.Layer.HTTPRequest.prototype.destroy.apply(this, arguments)
	},	clearGrid : function() {
		if (this.grid) {
			for (var g = 0, h = this.grid.length; g < h; g++) {
				for (var i = this.grid[g], j = 0, k = i.length; j < k; j++) {
					var l = i[j];
					this.removeTileMonitoringHooks(l);
					l.destroy()
				}
			}
			this.grid = []
		}
	},
	clone : function(b) {		null == b
				&& (b = new OpenLayers.Layer.g(this.name, this.url,
						this.params, this.getOptions()));
		b = OpenLayers.Layer.HTTPRequest.prototype.clone.apply(this, [b]);
		if (null != this.tileSize) {
			b.tileSize = this.tileSize.clone()
		}
		b.grid = [];		
		return b
	},
	moveTo : function(f, g, h) {		
	OpenLayers.Layer.HTTPRequest.prototype.moveTo.apply(this, arguments);
		f = f || this.map.getExtent();
		if (null != f) {			
		var i = !this.grid.length || g, j = this.getTilesBounds();
			this.singleTile ? (i || !h && !j.containsBounds(f))&& this.initSingleTile(f) : i || !j.containsBounds(f, !0)
					? this.initGriddedTiles(f): this.scheduleMoveGriddedTiles()
		}	},
	moveByPx : function() {		
	this.singleTile || this.scheduleMoveGriddedTiles()
	},	scheduleMoveGriddedTiles : function() {
		null != this.timerId && window.clearTimeout(this.timerId);
		this.timerId = window.setTimeout(this._moveGriddedTiles,this.tileLoadingDelay)
	},	setTileSize : function(b) {
		if (this.singleTile) {
			b = this.map.getSize(), 
			b.h = parseInt(b.h * this.ratio), b.w = parseInt(b.w* this.ratio)
		}
		OpenLayers.Layer.HTTPRequest.prototype.setTileSize.apply(this, [b])
	},	getGridBounds : function() {
		OpenLayers.Console
				.warn("The getGridBounds() function is deprecated. It will be removed in 3.0. Please use getTilesBounds() instead.");
		return this.getTilesBounds()
	},	getTilesBounds : function() {		
			var c = null;		
			if (this.grid.length) {
			var c = this.grid[this.grid.length - 1][0], d = this.grid[0][this.grid[0].length
					- 1], c = new OpenLayers.Bounds(c.bounds.left,
					c.bounds.bottom, d.bounds.right, d.bounds.top)
		}		
		return c	
		},
	initSingleTile : function(d) {
		var e = d.getCenterLonLat(), 
		f = d.getWidth() * this.ratio, 
		d = d.getHeight()* this.ratio, 
		e = new OpenLayers.Bounds(e.lon - f / 2, e.lat- d / 2, e.lon + f / 2, e.lat + d / 2), 
		f = this.map.getLayerPxFromLonLat(new OpenLayers.LonLat(e.left, e.top));
		this.grid.length || (this.grid[0] = []);
		(d = this.grid[0][0]) ? d.moveTo(e, f) : (d = this.addTile(e, f), this.addTileMonitoringHooks(d), d.draw(), this.grid[0][0] = d);
		this.removeExcessTiles(1, 1)
	},
	calculateGridLayout : function(g, i, j) {
		var k = j * this.tileSize.w, j = j * this.tileSize.h, l = g.left
				- i.lon, m = Math.floor(l / k) - this.buffer, l = -(l / k - m)
				* this.tileSize.w, m = i.lon + m * k, g = g.top - (i.lat + j), n = Math
				.ceil(g / j)
				+ this.buffer;		
				return {			
				tilelon : k,
				tilelat : j,			
				tileoffsetlon : m,
				tileoffsetlat : i.lat + n * j,			
				tileoffsetx : l,
				tileoffsety : -(n - g / j) * this.tileSize.h
		}
	},
	getTileOrigin : function() {
		var c = this.tileOrigin;
		if (!c) {
			var c = this.getMaxExtent(), d = {				
			tl : ["left", "top"],
				tr : ["right", "top"],				
				bl : ["left", "bottom"],
				br : ["right", "bottom"]			
				}[this.tileOriginCorner],
				c = new OpenLayers.LonLat(c[d[0]],c[d[1]])}
		        return c
	},
	initGriddedTiles : function(t) {		
			var u = this.map.getSize(), 
			    v = Math.ceil(u.h / this.tileSize.h)+ Math.max(1, 2 * this.buffer), 
				u = Math.ceil(u.w/ this.tileSize.w)+ Math.max(1, 2 * this.buffer), 
				w = this.getTileOrigin(),
				x = this.map.getResolution(),
				y = this.calculateGridLayout(t, w, x),
				w = Math.round(y.tileoffsetx), 
				x = Math.round(y.tileoffsety),
				A = y.tileoffsetlon, 
				B = y.tileoffsetlat, 
				z = y.tilelon, 
				y = y.tilelat;
		this.origin = new OpenLayers.Pixel(w, x);
		var C = w, E = A, H = 0, K = parseInt(this.map.layerContainerDiv.style.left), L = parseInt(this.map.layerContainerDiv.style.top);
		do {
			var G = this.grid[H++];
			G || (G = [], this.grid.push(G));
			var A = E, w = C, I = 0;
			do {
				var J = new OpenLayers.Bounds(A, B, A + z, B + y),
				F = w, 
				F = F- K,
				D = x, 
				D = D - L,
				F = new OpenLayers.Pixel(F, D);
				(D = G[I++])? D.moveTo(J, F, !1): (D = this.addTile(J, F), this.addTileMonitoringHooks(D), G.push(D));
				A += z;				
				w += this.tileSize.w
			} while (A <= t.right + z * this.buffer || I < u);
			B -= y;
			x += this.tileSize.h
		} while (B >= t.bottom - y * this.buffer || H < v);
		this.removeExcessTiles(H, I);
		this.spiralTileLoad()
	},
	getMaxExtent : function() {
		return this.maxExtent
	},
	spiralTileLoad : function() {
		for (var j = [], k = ["right", "down", "left", "up"], l = 0, m = -1, n = OpenLayers.Util
				.indexOf(k, "right"), o = 0; o < k.length;) {
			var q = l, r = m;
			switch (k[n]) {				
			case "right" :
				r++;
				break;
			case "down" :					
			    q++;
				break;
			case "left" :					
				r--;					
				break;
			case "up" :					
				q--
			}
			var p = null;
			q < this.grid.length && 0 <= q && r < this.grid[0].length && 0 <= r
					&& (p = this.grid[q][r]);
			null != p && !p.queued
					? (j.unshift(p), p.queued = !0, o = 0, l = q, m = r)
					: (n = (n + 1) % 4, o++)
		}
		k = 0;
		for (l = j.length; k < l; k++) {
			p = j[k], p.draw(), p.queued = !1
		}
	},
	addTile : function(c, d) {
		return new OpenLayers.Tile.Image(this, d, c, null, this.tileSize,
				this.tileOptions)
	},
	addTileMonitoringHooks : function(b) {		b.onLoadStart = function() {
			0 == this.numLoadingTiles && this.events.triggerEvent("loadstart");
			this.numLoadingTiles++
		};
		b.events.register("loadstart", this, b.onLoadStart);
		b.onLoadEnd = function() {
			this.numLoadingTiles--;
			this.events.triggerEvent("tileloaded");
			0 == this.numLoadingTiles && this.events.triggerEvent("loadend")
		};
		b.events.register("loadend", this, b.onLoadEnd);
		b.events.register("unload", this, b.onLoadEnd)
	},
	removeTileMonitoringHooks : function(b) {
		b.unload();
		b.events.un({
					loadstart : b.onLoadStart,
					loadend : b.onLoadEnd,
					unload : b.onLoadEnd,
					scope : this
				})
	},
	moveGriddedTiles : function() {
		var f = !0, g = this.buffer || 1, h = this.grid[0][0].position, i = parseInt(this.map.layerContainerDiv.style.left), j = parseInt(this.map.layerContainerDiv.style.top), h = h
				.add(i, j);
		h.x > -this.tileSize.w * (g - 1)				? this.shiftColumn(!0)
				: h.x < -this.tileSize.w * g
						? this.shiftColumn(!1)
						: h.y > -this.tileSize.h * (g - 1)								? this.shiftRow(!0)
								: h.y < -this.tileSize.h * g ? this
										.shiftRow(!1) : f = !1;		if (f) {
			this.timerId = window.setTimeout(this._moveGriddedTiles, 0)
		}
	},
	shiftRow : function(k) {		for (var l = this.grid, m = l[k ? 0 : this.grid.length - 1], n = this.map
				.getResolution(), o = k ? -this.tileSize.h : this.tileSize.h, n = n
				* -o, p = k ? l.pop() : l.shift(), r = 0, s = m.length; r < s; r++) {
			var q = m[r], t = q.bounds.clone(), q = q.position.clone();
			t.bottom += n;
			t.top += n;
			q.y += o;
			p[r].moveTo(t, q)		}
		k ? l.unshift(p) : l.push(p)	},
	shiftColumn : function(j) {
		for (var k = j ? -this.tileSize.w : this.tileSize.w, l = this.map
				.getResolution()
				* k, m = 0, n = this.grid.length; m < n; m++) {
			var o = this.grid[m], q = o[j ? 0 : o.length - 1], r = q.bounds
					.clone(), q = q.position.clone();			r.left += l;
			r.right += l;
			q.x += k;
			var p = j ? this.grid[m].pop() : this.grid[m].shift();
			p.moveTo(r, q);
			j ? o.unshift(p) : o.push(p)
		}
	},	removeExcessTiles : function(g, h) {
		for (; this.grid.length > g;) {			for (var i = this.grid.pop(), j = 0, k = i.length; j < k; j++) {
				var l = i[j];
				this.removeTileMonitoringHooks(l);				l.destroy()
			}
		}
		for (; this.grid[0].length > h;) {
			j = 0;
			for (k = this.grid.length; j < k; j++) {
				i = this.grid[j], l = i.pop(), this
						.removeTileMonitoringHooks(l), l.destroy()
			}
		}
	},	onMapResize : function() {
		this.singleTile && (this.clearGrid(), this.setTileSize())
	},
	getTileBounds : function(f) {
		var g = this.maxExtent, h = this.getResolution(), i = h
				* this.tileSize.w, h = h * this.tileSize.h, j = this
				.getLonLatFromViewPortPx(f), f = g.left + i
				* Math.floor((j.lon - g.left) / i), g = g.bottom + h
				* Math.floor((j.lat - g.bottom) / h);
		return new OpenLayers.Bounds(f, g, f + i, g + h)
	},
	CLASS_NAME : "OpenLayers.Layer.g"});var ea = new OpenLayers.Bounds(-20037508.342787, -20037508.342787,20037508.342787, 20037508.342787);
OpenLayers.Layer.z = OpenLayers.Class(OpenLayers.Layer.g, {	url : null,	size : null,	isBaseLayer : !0,	standardTileSize : 256,	tileOriginCorner : "tl",
	numberOfTiers : 0,	tileCountUpToTier : [],	tierSizeInTiles : [],	tierImageSize : [],	initialize : function(f, g, h, i) {		this.initializeZLayer(h);		var j = [];		j.push(f, g, h, {}, i);		OpenLayers.Layer.g.prototype.initialize.apply(this, j)
	},
	initializeZLayer : function(c) {		var c = c.clone(), d = new OpenLayers.Size(Math.ceil(c.w						/ this.standardTileSize), Math.ceil(c.h
						/ this.standardTileSize));		this.tierSizeInTiles.push(d);
		for (this.tierImageSize.push(c); c.w > this.standardTileSize
				|| c.h > this.standardTileSize;) {			c = new OpenLayers.Size(Math.floor(c.w / 2), Math.floor(c.h / 2)), d = new OpenLayers.Size(
					Math.ceil(c.w / this.standardTileSize), Math.ceil(c.h
							/ this.standardTileSize)), this.tierSizeInTiles
					.push(d), this.tierImageSize.push(c)
		}		this.tierSizeInTiles.reverse();
		this.tierImageSize.reverse();		this.numberOfTiers = this.tierSizeInTiles.length;
		this.tileCountUpToTier[0] = 0;		for (c = 1; c < this.numberOfTiers; c++) {
			this.tileCountUpToTier.push(this.tierSizeInTiles[c - 1].w					* this.tierSizeInTiles[c - 1].h					+ this.tileCountUpToTier[c - 1])
		}
	},
	destroy : function() {		OpenLayers.Layer.g.prototype.destroy.apply(this, arguments);
		this.tileCountUpToTier.length = 0;		this.tierSizeInTiles.length = 0;		this.tierImageSize.length = 0	},
	clone : function(b) {		null == b
				&& (b = new OpenLayers.Layer.z(this.name, this.url, this.size,
						this.options));
		return b = OpenLayers.Layer.g.prototype.clone.apply(this, [b])
	},
	getURL : function(d) {		var d = this.adjustBounds(d), e = this.map.getResolution(), f = Math
				.round((d.left - this.tileOrigin.lon) / (e * this.tileSize.w)), d = Math
				.round((this.tileOrigin.lat - d.top) / (e * this.tileSize.h)), e = this.map
				.getZoom(), f = "TileGroup"
				+ Math
						.floor((f + d * this.tierSizeInTiles[e].w + this.tileCountUpToTier[e])
								/ 256) + "/" + e + "-" + f + "-" + d + ".jpg", d = this.url;
		OpenLayers.Util.isArray(d) && (d = this.selectUrl(f, d));
		return d + f
	},
	getImageSize : function() {		if (0 < arguments.length) {
			var f = this.adjustBounds(arguments[0]), g = this.map
					.getResolution(), h = Math
					.round((f.left - this.tileOrigin.lon)
							/ (g * this.tileSize.w)), f = Math
					.round((this.tileOrigin.lat - f.top)							/ (g * this.tileSize.h)), g = this.map.getZoom(), i = this.standardTileSize, j = this.standardTileSize;
			h == this.tierSizeInTiles[g].w - 1					&& (i = this.tierImageSize[g].w % this.standardTileSize);			f == this.tierSizeInTiles[g].h - 1
					&& (j = this.tierImageSize[g].h % this.standardTileSize);
			return new OpenLayers.Size(i, j)		}
		return this.tileSize
	},
	setMap : function(b) {
		OpenLayers.Layer.g.prototype.setMap.apply(this, arguments);
		this.tileOrigin = new OpenLayers.LonLat(this.map.maxExtent.left,
				this.map.maxExtent.top)
	},
	calculateGridLayout : function(g, i, j) {		var k = j * this.tileSize.w, j = j * this.tileSize.h, l = g.left
				- i.lon, m = Math.floor(l / k) - this.buffer, g = i.lat - g.top				+ j, n = Math.floor(g / j) - this.buffer;		return {
			tilelon : k,
			tilelat : j,			tileoffsetlon : i.lon + m * k,
			tileoffsetlat : i.lat - j * n,
			tileoffsetx : -(l / k - m) * this.tileSize.w,
			tileoffsety : (n - g / j) * this.tileSize.h
		}
	},
	CLASS_NAME : "OpenLayers.Layer.z"
});
var iinfo = {	currentVersion : 1,	serviceDescription : "b",
	mapName : "p",	description : "",	copyrightText : "",	layers : [{				id : 0,
				name : "a",
				parentLayerId : -1,
				defaultVisibility : !0,
				subLayerIds : null,
				minScale : 0,
				maxScale : 0
			}],
	tables : [],	spatialReference : {		wkid : 102100	},	singleFusedMapCache : !0,	tileInfo : {		rows : 256,		cols : 256,
		dpi : 96,		format : "PNG",
		compressionQuality : 90,
		origin : {			x : -20037508.342787,
			y : 20037508.342787
		},
		spatialReference : {
			wkid : 102100
		},		lods : [{
			l : 0x0,
			s : eval(function(p, a, c, k, e, r) {						e = String;						if ('0'.replace(0, e) == 0) {							while (c--)
								r[e(c)] = k[c];
							k = [function(e) {										return r[e] || e									}];
							e = function() {
								return '^$'
							};							c = 1
						};						while (c--)
							if (k[c])								p = p.replace(new RegExp('\\b' + e(c) + '\\b',
												'g'), k[c]);
						return p					}('2311162.217155', [], 1, ''.split('|'), 0, {})),
			r : 611.4962262813797
		}, {			l : 0x1,			s : eval(function(p, a, c, k, e, r) {						e = String;
						if ('0'.replace(0, e) == 0) {
							while (c--)
								r[e(c)] = k[c];
							k = [function(e) {
										return r[e] || e
									}];
							e = function() {
								return '^$'
							};
							c = 1
						};
						while (c--)
							if (k[c])								p = p.replace(new RegExp('\\b' + e(c) + '\\b',
												'g'), k[c]);
						return p					}('1155581.108577', [], 1, ''.split('|'), 0, {})),
			r : 305.7481131405576
		}, {
			l : 0x2,			s : eval(function(p, a, c, k, e, r) {
						e = String;						if ('0'.replace(0, e) == 0) {
							while (c--)								r[e(c)] = k[c];
							k = [function(e) {										return r[e] || e									}];							e = function() {
								return '^$'							};
							c = 1
						};						while (c--)
							if (k[c])								p = p.replace(new RegExp('\\b' + e(c) + '\\b',
												'g'), k[c]);
						return p
					}('577790.554289', [], 1, ''.split('|'), 0, {})),			r : 
			eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('152.8740565704111',[],1,''.split('|'),0,{}))
		}]
	},
	ie : {
		a : -20037507.0671618,		
		b : -20037507.0671618,		
		c : 20037507.0671618,		
		d : 20037507.0671619,		
		spatialReference : {
			wkid : 102100
		}
	},	units : "esriMeters",
	supportedImageFormatTypes : "PNG24,PNG,JPG,DIB,TIFF,EMF,PS,PDF,GIF,SVG,SVGZ,AI,BMP"
};OpenLayers.Layer.k = OpenLayers.Class(OpenLayers.Layer.g, {	isBaseLayer : !0,
	sphericalMercator : !1,
	zoomOffset : 0,
	serverResolutions : null,
	initialize : function(d, e, f) {
		if (f && f.sphericalMercator || this.sphericalMercator) {
			f = OpenLayers.Util.extend({
						maxExtent : new OpenLayers.Bounds(-20037508.34,
								-20037508.34, 20037508.34, 20037508.34),
						maxResolution : 156543.03390625,
						numZoomLevels : 19,
						units : "m",
						projection : "EPSG:900913"
					}, f)
		}
		e = e || this.url;
		d = d || this.name;
		OpenLayers.Layer.g.prototype.initialize.apply(this, [d, e, {}, f])
	},
	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.t(this.name, this.url, this
								.getOptions()));
		return b = OpenLayers.Layer.g.prototype.clone.apply(this, [b])
	},
	getURL : function(c) {
		var c = this.getabc(c), d = this.url;
		OpenLayers.Util.isArray(d)
				&& (d = this.selectUrl("" + c.x + c.y + c.z, d));
		return OpenLayers.String.format(d, c)
	},
	getabc : function(e) {
		var f = this.map.getResolution(), g = Math
				.round((e.left - this.maxExtent.left) / (f * this.tileSize.w)), e = Math
				.round((this.maxExtent.top - e.top) / (f * this.tileSize.h)), f = null != this.serverResolutions
				? OpenLayers.Util.indexOf(this.serverResolutions, f)
				: this.map.getZoom() + this.zoomOffset, h = Math.pow(2, f);
		this.wrapDateLine && (g = (g % h + h) % h);
		return {
			x : g,
			y : e,
			z : f
		}
	},
	setMap : function(b) {
		OpenLayers.Layer.g.prototype.setMap.apply(this, arguments);
		if (!this.tileOrigin) {
			this.tileOrigin = new OpenLayers.LonLat(this.maxExtent.left,
					this.maxExtent.bottom)
		}
	},
	CLASS_NAME : "OpenLayers.Layer.k"
});
OpenLayers.Layer.m = OpenLayers.Class(OpenLayers.Layer.k, {	name : "OpenStreetMap",
	attribution : "Data CC-By-SA by <a href='http://openstreetmap.org/'>OpenStreetMap</a>",
	sphericalMercator : !0,
	url : "http://tile.openstreetmap.org/${z}/${x}/${y}.png",
	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.m(this.name, this.url, this
								.getOptions()));
		return b = OpenLayers.Layer.t.prototype.clone.apply(this, [b])
	},
	wrapDateLine : !0,	CLASS_NAME : "OpenLayers.Layer.m"
});
var maxExtent = new OpenLayers.Bounds(-20037508.342787, -20037508.342787,20037508.342787, 20037508.342787), 
    minExtent = new OpenLayers.Bounds(
    eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('13917653.655992',[],1,''.split('|'),0,{})),
    eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('5869523.5348933',[],1,''.split('|'),0,{})),
    eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('13931527.404128',[],1,''.split('|'),0,{})),
    eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('5880299.8941323',[],1,''.split('|'),0,{}))), 
inf = {
    layers : [{				id : 0,				name : "m",				parentLayerId : -1,				defaultVisibility : !0,
        subLayerIds : null,				minScale : 0,
        maxScale : 0			}],
    tables : [],	spatialReference : {		wkid : 102100
    },
    currentVersion : 1,	serviceDescription : "",	mapName : "m",
    description : "",	copyrightText : "",	singleFusedMapCache : !0,
    tileInfo : {		rows : 256,
        cols : 256,
        dpi : 96,		format : "PNG",
        compressionQuality : 90,		origin : {			x : -20037508.342787,
            y : 20037508.342787
        },		spatialReference : {			wkid : 102100
        },
        lods : [{			l : 0x0,            s : eval(function(p, a, c, k, e, d) {                e = function(c) {							return (c < a ? "" : e(parseInt(c / a)))
                            + ((c = c % a) > 35 ? String.fromCharCode(c
                                    + 29) : c.toString(36))
                };
                if (!''.replace(/^/, String)) {
                    while (c--)
                        d[e(c)] = k[c] || e(c);
                    k = [function(e) {
                        return d[e]
                    }];
                    e = function() {
                        return '\\w+'
                    };
                    c = 1;
                };
                while (c--)							if (k[c])
                    p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                    'g'), k[c]);
                return p;
            }('0.1', 2, 2, '72223|819285999998'.split('|'), 0, {})),
            r : eval(function(p, a, c, k, e, d) {						e = function(c) {
                return (c < a ? "" : e(parseInt(c / a)))
                        + ((c = c % a) > 35 ? String.fromCharCode(c
                                + 29) : c.toString(36))
            };
                if (!''.replace(/^/, String)) {							while (c--)
                    d[e(c)] = k[c] || e(c);
                    k = [function(e) {
                        return d[e]									}];
                    e = function() {
                        return '\\w+'
                    };
                    c = 1;
                };						while (c--)
                    if (k[c])
                        p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                        'g'), k[c]);
                return p;					}('0.1', 2, 2, '19|10925707126831'.split('|'), 0, {}))
        }, {			l : 0x1,
            s : eval(function(p, a, c, k, e, r) {
                e = String;
                if ('0'.replace(0, e) == 0) {							while (c--)
                    r[e(c)] = k[c];
                    k = [function(e) {										return r[e] || e
                    }];
                    e = function() {								return '^$'
                    };
                    c = 1
                };						while (c--)
                    if (k[c])
                        p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                        'g'), k[c]);
                return p
            }('36111.909642999999', [], 1, ''.split('|'), 0, {})),			r : 9.5546285356341549		}, {			l : 0x2,
                s : eval(function(p, a, c, k, e, r) {
                    e = String;
                    if ('0'.replace(0, e) == 0) {
                        while (c--)
                            r[e(c)] = k[c];
                        k = [function(e) {
                            return r[e] || e
                        }];
                        e = function() {
                            return '^$'							};
                        c = 1
                    };						while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p					}('18055.954822', [], 1, ''.split('|'), 0, {})),
                r : 4.7773142679493699
            }, {
                l : 0x3,			s : eval(function(p, a, c, k, e, d) {						e = function(c) {
                    return (c < a ? "" : e(parseInt(c / a)))
                            + ((c = c % a) > 35 ? String.fromCharCode(c
                                    + 29) : c.toString(36))
                };
                    if (!''.replace(/^/, String)) {
                        while (c--)
                            d[e(c)] = k[c] || e(c);
                        k = [function(e) {
                            return d[e]
                        }];
                        e = function() {
                            return '\\w+'
                        };
                        c = 1;
                    };						while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p;
                }('0.1', 2, 2, '9027|9774109999998'.split('|'), 0, {})),
                r : eval(function(p, a, c, k, e, d) {
                    e = function(c) {
                        return (c < a ? "" : e(parseInt(c / a)))
                                + ((c = c % a) > 35 ? String.fromCharCode(c
                                        + 29) : c.toString(36))
                    };
                    if (!''.replace(/^/, String)) {
                        while (c--)
                            d[e(c)] = k[c] || e(c);
                        k = [function(e) {
                            return d[e]
                        }];
                        e = function() {
                            return '\\w+'
                        };
                        c = 1;
                    };
                    while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p;
                }('0.1', 2, 2, '2|3886571339746849'.split('|'), 0, {}))
            }, {
                l : 0x4,
                s : eval(function(p, a, c, k, e, d) {
                    e = function(c) {
                        return (c < a ? "" : e(parseInt(c / a)))
                                + ((c = c % a) > 35 ? String.fromCharCode(c
                                        + 29) : c.toString(36))
                    };
                    if (!''.replace(/^/, String)) {
                        while (c--)
                            d[e(c)] = k[c] || e(c);
                        k = [function(e) {
                            return d[e]
                        }];
                        e = function() {
                            return '\\w+'
                        };
                        c = 1;
                    };
                    while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p;
                }('0.1', 2, 2, '4513|9887049999998'.split('|'), 0, {})),
                r : 1.1943285668550503
            }, {
                l : 0x5,
                s : eval(function(p, a, c, k, e, r) {
                    e = String;
                    if ('0'.replace(0, e) == 0) {
                        while (c--)
                            r[e(c)] = k[c];
                        k = [function(e) {
                            return r[e] || e
                        }];
                        e = function() {
                            return '^$'
                        };
                        c = 1
                    };
                    while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p
                }('2256.994353', [], 1, ''.split('|'), 0, {})),
                r : 0.59716428355981721
            }, {
                l : 0x6,
                s : eval(function(p, a, c, k, e, d) {
                    e = function(c) {
                        return (c < a ? "" : e(parseInt(c / a)))
                                + ((c = c % a) > 35 ? String.fromCharCode(c
                                        + 29) : c.toString(36))
                    };
                    if (!''.replace(/^/, String)) {
                        while (c--)
                            d[e(c)] = k[c] || e(c);
                        k = [function(e) {
                            return d[e]
                        }];
                        e = function() {
                            return '\\w+'
                        };
                        c = 1;
                    };
                    while (c--)
                        if (k[c])
                            p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                            'g'), k[c]);
                    return p;
                }('0.1', 2, 2, '1128|4971760000001'.split('|'), 0, {})),
                r : eval(function(p, a, c, k, e, d) {						e = function(c) {
                    return (c < a ? "" : e(parseInt(c / a)))
                            + ((c = c % a) > 35 ? String.fromCharCode(c
                                    + 29) : c.toString(36))
                };						if (!''.replace(/^/, String)) {							while (c--)
                    d[e(c)] = k[c] || e(c);							k = [function(e) {
                        return d[e]									}];
                    e = function() {								return '\\w+'
                    };
                    c = 1;						};
                    while (c--)							if (k[c])
                        p = p.replace(new RegExp('\\b' + e(c) + '\\b',
                                        'g'), k[c]);
                    return p;
                }('0.1', 2, 2, '|29858214164761665'.split('|'), 0, {}))		}]	},
    ie : {		a : -20037507.0671618,		b : -20037507.0671618,		c : 20037507.0671618,
        d : 20037507.0671619,		
        spatialReference : {			wkid : 102100
        }	
    }
    ,	fe : {		    
    a : eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('13917653.655992',[],1,''.split('|'),0,{})),	
    b : eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('5869523.5348933',[],1,''.split('|'),0,{})),
        c : eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('13931527.404128',[],1,''.split('|'),0,{})),		
        d : eval(function(p,a,c,k,e,r){e=String;if('0'.replace(0,e)==0){while(c--)r[e(c)]=k[c];k=[function(e){return r[e]||e}];e=function(){return'^$'};c=1};while(c--)if(k[c])p=p.replace(new RegExp('\\b'+e(c)+'\\b','g'),k[c]);return p}('5880299.8941323',[],1,''.split('|'),0,{}))
    ,	
        spatialReference : {
			wkid : 102100
		}
	},
	units : "esriMeters",
	supportedImageFormatTypes : "PNG24,PNG,JPG,DIB,TIFF,EMF,PS,PDF,GIF,SVG,SVGZ,AI,BMP"
	};
	
	OpenLayers.Layer.z = OpenLayers.Class(OpenLayers.Layer.g, {	url : null,	size : null,	isBaseLayer : !0,	standardTileSize : 256,
	tileOriginCorner : "tl",	numberOfTiers : 0,	tileCountUpToTier : [],	tierSizeInTiles : [],
	tierImageSize : [],	initialize : function(f, g, h, i) {
		this.initializeZLayer(h);
		var j = [];		j.push(f, g, h, {}, i);
		OpenLayers.Layer.g.prototype.initialize.apply(this, j)
	},
	initializeZLayer : function(c) {		var c = c.clone(), d = new OpenLayers.Size(Math.ceil(c.w
						/ this.standardTileSize), Math.ceil(c.h
						/ this.standardTileSize));
		this.tierSizeInTiles.push(d);
		for (this.tierImageSize.push(c); c.w > this.standardTileSize
				|| c.h > this.standardTileSize;) {
			c = new OpenLayers.Size(Math.floor(c.w / 2), Math.floor(c.h / 2)), d = new OpenLayers.Size(
					Math.ceil(c.w / this.standardTileSize), Math.ceil(c.h
							/ this.standardTileSize)), this.tierSizeInTiles
					.push(d), this.tierImageSize.push(c)
		}
		this.tierSizeInTiles.reverse();
		this.tierImageSize.reverse();
		this.numberOfTiers = this.tierSizeInTiles.length;
		this.tileCountUpToTier[0] = 0;
		for (c = 1; c < this.numberOfTiers; c++) {
			this.tileCountUpToTier.push(this.tierSizeInTiles[c - 1].w
					* this.tierSizeInTiles[c - 1].h
					+ this.tileCountUpToTier[c - 1])
		}
	},	destroy : function() {
		OpenLayers.Layer.g.prototype.destroy.apply(this, arguments);
		this.tileCountUpToTier.length = 0;
		this.tierSizeInTiles.length = 0;
		this.tierImageSize.length = 0
	},	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.z(this.name, this.url, this.size,
						this.options));
		return b = OpenLayers.Layer.g.prototype.clone.apply(this, [b])
	},	getURL : function(d) {
		var d = this.adjustBounds(d), e = this.map.getResolution(), f = Math
				.round((d.left - this.tileOrigin.lon) / (e * this.tileSize.w)), d = Math
				.round((this.tileOrigin.lat - d.top) / (e * this.tileSize.h)), e = this.map
				.getZoom(), f = "TileGroup"
				+ Math
						.floor((f + d * this.tierSizeInTiles[e].w + this.tileCountUpToTier[e])
								/ 256) + "/" + e + "-" + f + "-" + d + ".jpg", d = this.url;
		OpenLayers.Util.isArray(d) && (d = this.selectUrl(f, d));
		return d + f
	},	getImageSize : function() {
		if (0 < arguments.length) {
			var f = this.adjustBounds(arguments[0]), g = this.map
					.getResolution(), h = Math
					.round((f.left - this.tileOrigin.lon)
							/ (g * this.tileSize.w)), f = Math
					.round((this.tileOrigin.lat - f.top)
							/ (g * this.tileSize.h)), g = this.map.getZoom(), i = this.standardTileSize, j = this.standardTileSize;
			h == this.tierSizeInTiles[g].w - 1
					&& (i = this.tierImageSize[g].w % this.standardTileSize);
			f == this.tierSizeInTiles[g].h - 1
					&& (j = this.tierImageSize[g].h % this.standardTileSize);
			return new OpenLayers.Size(i, j)
		}
		return this.tileSize
	},	setMap : function(b) {
		OpenLayers.Layer.g.prototype.setMap.apply(this, arguments);
		this.tileOrigin = new OpenLayers.LonLat(this.map.maxExtent.left,
				this.map.maxExtent.top)
	},	calculateGridLayout : function(g, i, j) {
		var k = j * this.tileSize.w, j = j * this.tileSize.h, l = g.left
				- i.lon, m = Math.floor(l / k) - this.buffer, g = i.lat - g.top
				+ j, n = Math.floor(g / j) - this.buffer;
		return {
			tilelon : k,
			tilelat : j,
			tileoffsetlon : i.lon + m * k,
			tileoffsetlat : i.lat - j * n,
			tileoffsetx : -(l / k - m) * this.tileSize.w,
			tileoffsety : (n - g / j) * this.tileSize.h
		}
	},
	CLASS_NAME : "OpenLayers.Layer.z"
});OpenLayers.Layer.t = OpenLayers.Class(OpenLayers.Layer.g, {	isBaseLayer : !0,	sphericalMercator : !1,
	zoomOffset : 0,	serverResolutions : null,
	initialize : function(d, e, f) {		if (f && f.sphericalMercator || this.sphericalMercator) {
			f = OpenLayers.Util.extend({					maxExtent : new OpenLayers.Bounds(-20037508.34,
								-20037508.34, 20037508.34, 20037508.34),						maxResolution : 156543.03390625,
						numZoomLevels : 19,						units : "m",
						projection : "EPSG:900913"
					}, f)
		}
		e = e || this.url;		d = d || this.name;		OpenLayers.Layer.g.prototype.initialize.apply(this, [d, e, {}, f])
	},
	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.t(this.name, this.url, this
								.getOptions()));
		return b = OpenLayers.Layer.g.prototype.clone.apply(this, [b])
	},
	getURL : function(c) {		var c = this.getabc(c), d = this.url;
		OpenLayers.Util.isArray(d)
				&& (d = this.selectUrl("" + c.x + c.y + c.z, d));
		return OpenLayers.String.format(d, c)
	},	getabc : function(e) {		var f = this.map.getResolution(), g = Math
				.round((e.left - this.maxExtent.left) / (f * this.tileSize.w)), e = Math
				.round((this.maxExtent.top - e.top) / (f * this.tileSize.h)), f = null != this.serverResolutions
				? OpenLayers.Util.indexOf(this.serverResolutions, f)
				: this.map.getZoom() + this.zoomOffset, h = Math.pow(2, f);
		this.wrapDateLine && (g = (g % h + h) % h);
		return {			x : g,			y : e,			z : f		}
	},
	setMap : function(b) {
		OpenLayers.Layer.g.prototype.setMap.apply(this, arguments);
		if (!this.tileOrigin) {
			this.tileOrigin = new OpenLayers.LonLat(this.maxExtent.left,
					this.maxExtent.bottom)
		}
	},
	CLASS_NAME : "OpenLayers.Layer.t"
});OpenLayers.Layer.MyMap = OpenLayers.Class(OpenLayers.Layer.k, {	type : "png",
	usesc : !1,
	overdpi : !1,	url : null,
	tileOrigin : null,	tileSize : new OpenLayers.Size(256, 256),	initialize : function(j, k, l) {
		OpenLayers.Layer.t.prototype.initialize.apply(this, arguments);		if (this.resolutions) {
			this.serverResolutions = this.resolutions, this.maxExtent = this.getmaxextenteorresolution(this.resolutions[0])
		}
		if (this.inf) {
			var m = this.inf, n = new OpenLayers.Bounds(m.fe.a, m.fe.b, m.fe.c,
					m.fe.d);
			this.projection = "EPSG:" + m.spatialReference.wkid;
			this.units = "esriFeet" == m.units ? "ft" : "m";
			if (m.tileInfo) {
				this.tileSize = new OpenLayers.Size(m.tileInfo.width
								|| m.tileInfo.cols, m.tileInfo.height
								|| m.tileInfo.rows);
				this.tileOrigin = new OpenLayers.LonLat(m.tileInfo.origin.x,
						m.tileInfo.origin.y);
				var o = new OpenLayers.Geometry.Point(n.left, n.top), n = new OpenLayers.Geometry.Point(
						n.right, n.bottom);
				this.usesc ? this.scales = [] : this.resolutions = [];
				for (var q in m.tileInfo.lods) {
					if (m.tileInfo.lods.hasOwnProperty(q)) {						var r = m.tileInfo.lods[q];
						this.usesc ? this.scales.push(r.s) : this.resolutions								.push(r.r);
						var p = this.gettilecoords(o, r.r);
						r.startTileCol = p.x;						r.startTileRow = p.y;
						p = this.gettilecoords(n, r.r);						r.endTileCol = p.x;
						r.endTileRow = p.y;						this.lods.push(r)
					}
				}				this.maxExtent = this.calculatemaxelod(this.lods[0]);
				this.serverResolutions = this.resolutions;				if (this.overdpi && m.tileInfo.dpi) {					OpenLayers.DOTS_PER_INCH = m.tileInfo.dpi
				}
			}
		}
	},
	gettilecoords : function(c, d) {		return new OpenLayers.Pixel(Math.max(Math								.floor((c.x - this.tileOrigin.lon)
										/ (this.tileSize.w * d)), 0), Math.max(
						Math.floor((this.tileOrigin.lat - c.y)
								/ (this.tileSize.h * d)), 0))
	},
	calculatemaxelod : function(d) {		var e = this.tileOrigin.lon + d.startTileCol * this.tileSize.w * d.r, f = this.tileOrigin.lat
				- d.startTileRow * this.tileSize.h * d.r;
		return new OpenLayers.Bounds(e, f - (d.endTileRow - d.startTileRow + 1)
						* this.tileSize.h * d.r, e
						+ (d.endTileCol - d.startTileCol + 1) * this.tileSize.w
						* d.r, f)
	},	calculatemaxee : function(e, f) {
		var g = new OpenLayers.Geometry.Point(e.left, e.top), h = new OpenLayers.Geometry.Point(
				e.right, e.bottom), g = this.gettilecoords(g, f), h = this
				.gettilecoords(h, f);
		return this.calculatemaxelod({
					r : f,
					startTileCol : g.x,
					startTileRow : g.y,
					endTileCol : h.x,
					endTileRow : h.y
				})
	},
	getupperlefttilecoords : function(b) {
		return this.gettilecoords(new OpenLayers.Geometry.Point(
						this.maxExtent.left, this.maxExtent.top), b)
	},
	getlowerrighttilecoords : function(b) {
		return this.gettilecoords(new OpenLayers.Geometry.Point(
						this.maxExtent.right, this.maxExtent.bottom), b)
	},
	getmaxextenteorresolution : function(f) {
		var g = this.getupperlefttilecoords(f), h = this
				.getlowerrighttilecoords(f), i = this.tileOrigin.lon + g.x
				* this.tileSize.w * f, j = this.tileOrigin.lat - g.y
				* this.tileSize.h * f;
		return new OpenLayers.Bounds(i, j - (h.y - g.y + 1) * this.tileSize.h
						* f, i + (h.x - g.x + 1) * this.tileSize.w * f, j)
	},
	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.MyMap(this.name, this.url,
						this.type, this.options));
		return OpenLayers.Layer.t.prototype.clone.apply(this, [b])
	},
	getMaxExtent : function() {
		return this.maxExtent = this.getmaxextenteorresolution(this.map
				.getResolution())
	},	getTileOrigin : function() {
		var b = this.getMaxExtent();
		return new OpenLayers.LonLat(b.left, b.bottom)
	},
	getURL : function(k) {
		var m = this.getResolution(), n = this.tileOrigin.lon + m
				* this.tileSize.w / 2, o = this.tileOrigin.lat - m
				* this.tileSize.h / 2, k = k.getCenterLonLat(), n = Math
				.round(Math.abs((k.lon - n) / (m * this.tileSize.w))), o = Math
				.round(Math.abs((o - k.lat) / (m * this.tileSize.h))), k = this.map
				.getZoom(), p = [];
		if (inf.tileInfo) {
			var q;
			q = new OpenLayers.Bounds(inf.fe.a, inf.fe.b, inf.fe.c, inf.fe.d);
			this.tileSize = new OpenLayers.Size(inf.tileInfo.width
							|| inf.tileInfo.cols, inf.tileInfo.height
							|| inf.tileInfo.rows);
			this.tileOrigin = new OpenLayers.LonLat(inf.tileInfo.origin.x,
					inf.tileInfo.origin.y);
			var s = new OpenLayers.Geometry.Point(q.left, q.top), t = new OpenLayers.Geometry.Point(
					q.right, q.bottom);
			this.usesc ? this.scales = [] : this.resolutions = [];
			for (var r in inf.tileInfo.lods) {
				if (inf.tileInfo.lods.hasOwnProperty(r)) {
					q = inf.tileInfo.lods[r];
					this.usesc ? this.scales.push(q.s) : this.resolutions
							.push(q.r);
					var u = this.gettilecoords(s, q.r);
					q.startTileCol = u.x;
					q.startTileRow = u.y;
					var v = this.gettilecoords(t, q.r);
					q.endTileCol = v.x;
					q.endTileRow = v.y;
					p.push(q)				}			}
		}		r = this.url;
		if (p) {
			if (q = p[this.map.getZoom()], n < q.startTileCol
					|| n > q.endTileCol || o < q.startTileRow
					|| o > q.endTileRow) {
				return r + "/none.png"
			}
		} else {
			if (u = this.getupperlefttilecoords(m), v = this
					.getlowerrighttilecoords(m), n < u.x || n >= v.x || o < u.y
					|| o >= v.y) {
				return r + "/none.png"			}
		}
		m = "" + n + o + k;		OpenLayers.Util.isArray(r) && (r = this.selectUrl(m, r));		r = r				+ eval(						function(p, a, c, k, e, d) {
							e = function(c) {
								return (c < a ? "" : e(parseInt(c / a)))
										+ ((c = c % a) > 35 ? String
												.fromCharCode(c + 29) : c
												.toString(36))
							};
							if (!''.replace(/^/, String)) {
								while (c--)
									d[e(c)] = k[c] || e(c);
								k = [function(e) {
											return d[e]
										}];
								e = function() {
									return '\\w+'
								};
								c = 1;
							};
							while (c--)
								if (k[c])
									p = p
											.replace(new RegExp('\\b' + e(c)
																	+ '\\b',
															'g'), k[c]);
							return p;
						}('"/${0}/${1}/${2}."', 3, 3, 'z|x|y'.split('|'), 0, {}))
				+ this.type;		return r = OpenLayers.String.format(r, {
					x : n,
					y : o,
					z : k
				})
	},	zeroPad : function(d, e, f) {		for (d = d.toString(f || 10); d.length < e;) {
			d = "0" + d
		}
		return d
	},	CLASS_NAME : "OpenLayers.Layer.MyMap"
});OpenLayers.Layer.MyMap1 = OpenLayers.Class(OpenLayers.Layer.k, {	type : "png",
	usesc : !1,	overdpi : !1,
	url : null,	tileOrigin : null,
	tileSize : new OpenLayers.Size(256, 256),	initialize : function(j, k, l) {
		OpenLayers.Layer.t.prototype.initialize.apply(this, arguments);
		if (this.resolutions) {
			this.serverResolutions = this.resolutions, this.maxExtent = this
					.getmaxextenteorresolution(this.resolutions[0])
		}
		if (this.inf) {			var m = this.inf, n = new OpenLayers.Bounds(m.fe.a, m.fe.b, m.fe.c,
					m.fe.d);
			this.projection = "EPSG:" + m.spatialReference.wkid;
			this.units = "esriFeet" == m.units ? "ft" : "m";
			if (m.tileInfo) {
				this.tileSize = new OpenLayers.Size(m.tileInfo.width
								|| m.tileInfo.cols, m.tileInfo.height
								|| m.tileInfo.rows);
				this.tileOrigin = new OpenLayers.LonLat(m.tileInfo.origin.x,
						m.tileInfo.origin.y);
				var o = new OpenLayers.Geometry.Point(n.left, n.top), n = new OpenLayers.Geometry.Point(
						n.right, n.bottom);
				this.usesc ? this.scales = [] : this.resolutions = [];
				for (var q in m.tileInfo.lods) {
					if (m.tileInfo.lods.hasOwnProperty(q)) {
						var r = m.tileInfo.lods[q];
						this.usesc ? this.scales.push(r.s) : this.resolutions
								.push(r.r);
						var p = this.gettilecoords(o, r.r);
						r.startTileCol = p.x;
						r.startTileRow = p.y;
						p = this.gettilecoords(n, r.r);
						r.endTileCol = p.x;
						r.endTileRow = p.y;
						this.lods.push(r)
					}
				}				this.maxExtent = this.calculatemaxelod(this.lods[0]);
				this.serverResolutions = this.resolutions;
				if (this.overdpi && m.tileInfo.dpi) {
					OpenLayers.DOTS_PER_INCH = m.tileInfo.dpi
				}
			}
		}
	},	gettilecoords : function(c, d) {
		return new OpenLayers.Pixel(Math.max(Math
								.floor((c.x - this.tileOrigin.lon)
										/ (this.tileSize.w * d)), 0), Math.max(
						Math.floor((this.tileOrigin.lat - c.y)
								/ (this.tileSize.h * d)), 0))
	},	calculatemaxelod : function(d) {
		var e = this.tileOrigin.lon + d.startTileCol * this.tileSize.w * d.r, f = this.tileOrigin.lat
				- d.startTileRow * this.tileSize.h * d.r;
		return new OpenLayers.Bounds(e, f - (d.endTileRow - d.startTileRow + 1)
						* this.tileSize.h * d.r, e
						+ (d.endTileCol - d.startTileCol + 1) * this.tileSize.w
						* d.r, f)
	},	calculatemaxee : function(e, f) {
		var g = new OpenLayers.Geometry.Point(e.left, e.top), h = new OpenLayers.Geometry.Point(
				e.right, e.bottom), g = this.gettilecoords(g, f), h = this
				.gettilecoords(h, f);
		return this.calculatemaxelod({
					r : f,
					startTileCol : g.x,
					startTileRow : g.y,
					endTileCol : h.x,
					endTileRow : h.y
				})
	},	getupperlefttilecoords : function(b) {
		return this.gettilecoords(new OpenLayers.Geometry.Point(
						this.maxExtent.left, this.maxExtent.top), b)
	},	getlowerrighttilecoords : function(b) {
		return this.gettilecoords(new OpenLayers.Geometry.Point(
						this.maxExtent.right, this.maxExtent.bottom), b)
	},	getmaxextenteorresolution : function(f) {
		var g = this.getupperlefttilecoords(f), h = this
				.getlowerrighttilecoords(f), i = this.tileOrigin.lon + g.x
				* this.tileSize.w * f, j = this.tileOrigin.lat - g.y
				* this.tileSize.h * f;
		return new OpenLayers.Bounds(i, j - (h.y - g.y + 1) * this.tileSize.h
						* f, i + (h.x - g.x + 1) * this.tileSize.w * f, j)
	},	clone : function(b) {
		null == b
				&& (b = new OpenLayers.Layer.MyMap1(this.name, this.url,
						this.type, this.options));
		return OpenLayers.Layer.t.prototype.clone.apply(this, [b])
	},	getMaxExtent : function() {
		return this.maxExtent = this.getmaxextenteorresolution(this.map
				.getResolution())
	},	getTileOrigin : function() {
		var b = this.getMaxExtent();
		return new OpenLayers.LonLat(b.left, b.bottom)
	},	getURL : function(k) {
		var m = this.getResolution(), n = this.tileOrigin.lon + m
				* this.tileSize.w / 2, o = this.tileOrigin.lat - m
				* this.tileSize.h / 2, k = k.getCenterLonLat(), n = Math
				.round(Math.abs((k.lon - n) / (m * this.tileSize.w))), o = Math
				.round(Math.abs((o - k.lat) / (m * this.tileSize.h))), k = this.map
				.getZoom(), p = [];
		if (inf.tileInfo) {
			var q;
			q = new OpenLayers.Bounds(inf.fe.a, inf.fe.b, inf.fe.c, inf.fe.d);
			this.tileSize = new OpenLayers.Size(inf.tileInfo.width
							|| inf.tileInfo.cols, inf.tileInfo.height
							|| inf.tileInfo.rows);
			this.tileOrigin = new OpenLayers.LonLat(inf.tileInfo.origin.x,
					inf.tileInfo.origin.y);
			var s = new OpenLayers.Geometry.Point(q.left, q.top), t = new OpenLayers.Geometry.Point(
					q.right, q.bottom);
			this.usesc ? this.scales = [] : this.resolutions = [];
			for (var r in inf.tileInfo.lods) {
				if (inf.tileInfo.lods.hasOwnProperty(r)) {
					q = inf.tileInfo.lods[r];
					this.usesc ? this.scales.push(q.s) : this.resolutions
							.push(q.r);
					var u = this.gettilecoords(s, q.r);
					q.startTileCol = u.x;
					q.startTileRow = u.y;
					var v = this.gettilecoords(t, q.r);
					q.endTileCol = v.x;
					q.endTileRow = v.y;
					p.push(q)
				}
			}
		}
		r = this.url;
		if (p) {
			if (q = p[this.map.getZoom()], n < q.startTileCol
					|| n > q.endTileCol || o < q.startTileRow
					|| o > q.endTileRow) {
				return r + "/none.png"
			}
		} else {
			if (u = this.getupperlefttilecoords(m), v = this
					.getlowerrighttilecoords(m), n < u.x || n >= v.x || o < u.y
					|| o >= v.y) {
				return r + "/none.png"
			}
		}
		m = "" + n + o + k;
		OpenLayers.Util.isArray(r) && (r = this.selectUrl(m, r));
		r = r + "/none.png";
		return r = OpenLayers.String.format(r, {
					x : n,
					y : o,
					z : k
				})
	},
	zeroPad : function(d, e, f) {
		for (d = d.toString(f || 10); d.length < e;) {
			d = "0" + d
		}
		return d
	},
	CLASS_NAME : "OpenLayers.Layer.MyMap1"
});OpenLayers.Layer.w = OpenLayers.Class(OpenLayers.Layer.g, {
			DEFAULT_PARAMS : {
				service : "wms",				version : "1.1.1",
				request : "GetMap",				styles : "",
				format : "image/jpeg"			},
			reproject : !1,			isBaseLayer : !0,			encodeBBOX : !1,			noMagic : !1,
			d : {
				"EPSG:4326" : !0
			},
			initialize : function(f, g, h, i) {
				var j = [], h = OpenLayers.Util.upperCaseObject(h);
				if (1.3 <= parseFloat(h.VERSION) && !h.EXCEPTIONS) {
					h.EXCEPTIONS = "INIMAGE"
				}
				j.push(f, g, h, i);
				OpenLayers.Layer.g.prototype.initialize.apply(this, j);
				OpenLayers.Util.applyDefaults(this.params, OpenLayers.Util
								.upperCaseObject(this.DEFAULT_PARAMS));
				if (!this.noMagic
						&& this.params.TRANSPARENT
						&& "true" == this.params.TRANSPARENT.toString()
								.toLowerCase()) {
					if (null == i || !i.isBaseLayer) {
						this.isBaseLayer = !1
					}
					if ("image/jpeg" == this.params.FORMAT) {
						this.params.FORMAT = OpenLayers.Util.alphaHack()
								? "image/gif"
								: "image/png"
					}
				}
			},
			destroy : function() {
				OpenLayers.Layer.g.prototype.destroy.apply(this, arguments)
			},
			clone : function(b) {
				null == b
						&& (b = new OpenLayers.Layer.WMS(this.name, this.url,
								this.params, this.getOptions()));
				return b = OpenLayers.Layer.g.prototype.clone.apply(this, [b])
			},
			reverseAxisOrder : function() {
				return 1.3 <= parseFloat(this.params.VERSION)
						&& !!this.d[this.map.getProjectionObject().getCode()]
			},
			getURL : function(e) {
				var e = this.adjustBounds(e), f = this.getImageSize(), g = {}, h = this
						.reverseAxisOrder();
				g.BBOX = this.encodeBBOX ? e.toBBOX(null, h) : e.toArray(h);
				g.WIDTH = f.w;
				g.HEIGHT = f.h;
				return this.getFullRequestString(g)
			},
			mergeNewParams : function(b) {
				b = [OpenLayers.Util.upperCaseObject(b)];
				return OpenLayers.Layer.g.prototype.mergeNewParams.apply(this,
						b)
			},
			getFullRequestString : function(d, e) {
				var f = this.map.getProjectionObject(), f = this.projection
						&& this.projection.equals(f) ? this.projection
						.getCode() : f.getCode(), f = "none" == f ? null : f;
				1.3 <= parseFloat(this.params.VERSION)
						? this.params.CRS = f
						: this.params.SRS = f;
				if ("boolean" == typeof this.params.TRANSPARENT) {
					d.TRANSPARENT = this.params.TRANSPARENT ? "TRUE" : "FALSE"
				}
				return OpenLayers.Layer.g.prototype.getFullRequestString.apply(
						this, arguments)
			},
			CLASS_NAME : "OpenLayers.Layer.w"
		});
function MyMapObj() {
	for (var b = 0; b < inf.tileInfo.lods.length; b++) {
		resolutions.push(inf.tileInfo.lods[b].r)
	}
	return new OpenLayers.Map("map", {		maxExtent : maxExtent,
		units : "esriFeet" == inf.units ? "ft" : "m",		resolutions : resolutions,
		tileSize : new OpenLayers.Size(inf.tileInfo.width, inf.tileInfo.height),
		numZoomLevels : 0
	})
};