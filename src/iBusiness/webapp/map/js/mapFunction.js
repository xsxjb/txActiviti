    
    // 选中颜色变量
    var selectcolor = "#FF0000";
    
    //地图变量
    var map, streetLayer, drawControls, lineControls;
    var markers;
//    var markersId;//biaozhu
    var currentPopup;
    var polygonStyleLayer, myLinesLayer;
    var selectControl, selectedFeature;
    var draw = null;
    var MAPDATAURL;
    var MAP_IP;
    var MAP_PORT;
    var MAP_CITY;
    //是否显示在线地图
    var MAP_SHOW_ONLINE = false;
    //初始显示地图级别
    var MAP_GRID=2;
    //地图-地图初始页面中心 经度
    var  MAP_CENTER_LONGITUDE ;
    //地图-地图初始页面中心 纬度
    var MAP_CENTER_LATITUDE ;
    /**
     * -初始化地图
     */
    function init() {
        //初始化地图对像.(调用myMap.js中生存, 涉及到解密的问题)
        map = MyMapObj(); 
        //初始化数据
        $.ajax({
            url:pathBase + 'map/queryMapConfig.do',
            success:function(data) {
            	n = JSON.parse(data);
            	//图片地址
				MAP_IP = n.MAP_IP;
				MAP_PORT = n.MAP_PORT;
				MAP_CITY = n.MAP_CITY;
				//是否显示在线地图
				MAP_SHOW_ONLINE = n.MAP_SHOW_ONLINE;
				//初始显示地图级别
				MAP_GRID = n.MAP_GRID;
				//地图-地图初始页面中心 经度
				MAP_CENTER_LONGITUDE = n.MAP_CENTER_LONGITUDE;
				MAP_CENTER_LATITUDE = n.MAP_CENTER_LATITUDE;
            	initMapBase();
	        },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                 alert("地图初始数据未配置！请联系管理员！");
            }
        });
        
        //显示地图比例尺
        OpenLayers.INCHES_PER_UNIT["公里"] = OpenLayers.INCHES_PER_UNIT["km"]  
        OpenLayers.INCHES_PER_UNIT["米"] = OpenLayers.INCHES_PER_UNIT["m"]  
        // 设置比例尺：以线段指标的样式显示当前地图的比例
        map.addControl(new OpenLayers.Control.ScaleLine({topOutUnits : "公里",  bottomOutUnits : "米"})); 
    };
    /**
     * 初始化地图基础信息
     */
    function initMapBase() {
        MAPDATAURL = 'http://'+MAP_IP+":"+MAP_PORT+"/mapdata_"+MAP_CITY+"/mapdata";
        
        //本地地图
        streetLayer = new OpenLayers.Layer.MyMap("本地地图",
             MAPDATAURL+"/street",{
                maxExtent: maxExtent,
                resolutions: resolutions,
                tileSize: new OpenLayers.Size(256, 256),
                tileOrigin: new OpenLayers.LonLat(-20037508.342787001, 20037508.342787001)
         });
         //卫星地图
         satelliteLayer = new OpenLayers.Layer.MyMap("卫星地图",
                MAPDATAURL+"/satellite",{
                maxExtent: maxExtent,
                resolutions: resolutions,
                tileSize: new OpenLayers.Size(256, 256),
                tileOrigin: new OpenLayers.LonLat(-20037508.342787001, 20037508.342787001)
         });
         //本地地图
         map.addLayer(streetLayer);
         //卫星地图
         map.addLayer(satelliteLayer);
         
          //是否显示在线地图
          if("true"==MAP_SHOW_ONLINE) {
               try{
                      gmap = new OpenLayers.Layer.Google(
                                "Google在线地图",  {
                                     numZoomLevels: 20,
                                     MIN_ZOOM_LEVEL: 9,
                                     MAX_ZOOM_LEVEL: 19 
                                 });
                       map.addLayer(gmap);
                }catch(e){
                        alert("离线状态，只能使用本地地图！");
                }
          }
          //管线图
          streetLayer1 = new OpenLayers.Layer.MyMap1("管线图",
                MAPDATAURL+"/street",{
                maxExtent: maxExtent,
                resolutions: resolutions,
                tileSize: new OpenLayers.Size(256, 256),
                tileOrigin: new OpenLayers.LonLat(-20037508.342787001, 20037508.342787001)
          });
          map.addLayer(streetLayer1);
          // 地图-地图初始页面中心 经度, 纬度
          if("0"!=MAP_CENTER_LONGITUDE&&"0"!=MAP_CENTER_LATITUDE){
               map.setCenter((new OpenLayers.LonLat(MAP_CENTER_LONGITUDE, MAP_CENTER_LATITUDE)).transform(new OpenLayers.Projection("EPSG:4326"), 
               new OpenLayers.Projection("EPSG:900913")), MAP_GRID); // 初始显示地图级别
           }else{
              map.setCenter(minExtent.getCenterLonLat(), MAP_GRID);
           }
          // 增加了用键盘实现平移缩放功能
          map.addControl(new OpenLayers.Control.KeyboardDefaults());
          // 鼠标位置：显示鼠标指针移动时的地理坐标
          map.addControl(new OpenLayers.Control.MousePosition());
          // 用于调试和把错误等输出到“控制台”上
          map.addControl(new OpenLayers.Control.PanZoomBar());
          // 图层切换功能
          map.addControl(new OpenLayers.Control.LayerSwitcher());
          // 标注 由Marker图层进行管理
          markers = new OpenLayers.Layer.Markers("标注");
          
          //添加画板
          polygonStyleLayer = new OpenLayers.Layer.Vector("制作管线层");

          //线制作操作控件
          drawControls = {
              point: new OpenLayers.Control.DrawFeature(polygonStyleLayer, OpenLayers.Handler.Point),
              line: new OpenLayers.Control.DrawFeature(polygonStyleLayer,OpenLayers.Handler.Path),
              polygon: new OpenLayers.Control.DrawFeature(polygonStyleLayer,OpenLayers.Handler.Polygon),
              modify: new OpenLayers.Control.ModifyFeature(polygonStyleLayer)
          };
          // 
          for (var key in drawControls) {
              map.addControl(drawControls[key]);
          }
          // 绑定在elementParam元素上的keydown事件
          OpenLayers.Event.observe(document, "keydown", function (evt) {
              if (draw != null) {
                  var handled = false;
                  switch (evt.keyCode) {
                      case 90: // z
                          if (evt.metaKey || evt.ctrlKey) {
                              draw.undo();
                              handled = true;
                          }
                          break;
                      case 89: // y
                          if (evt.metaKey || evt.ctrlKey) {
                              draw.redo();
                              handled = true;
                          }
                          break;
                      case 27: // esc
                          draw.cancel();
                          handled = true;
                          break;
                  }
                  if (handled) {
                      OpenLayers.Event.stop(evt);
                  }
              }
          });
          //线层
          myLinesLayer = new OpenLayers.Layer.Vector("管线层");
          map.addLayers([myLinesLayer,markers]);
    }
    
    /**
     * 初始化地图大小
     */
    function initMapSize() {
        if (window.innerWidth == undefined) {
            MapWidth = document.documentElement.clientWidth;
            MapHeight = document.documentElement.clientHeight;
        } else {
            MapWidth = window.innerWidth;
            MapHeight = window.innerHeight;
        }
        $("#map").css( {
            width : MapWidth - 20,
            height : MapHeight - 20
        });
    }
    
    function report(event) {
        OpenLayers.Console.log(event.type, event.feature ? event.feature.id : event.components);
    }
    
    function onPopupClose(evt) {
        selectControl.unselect(selectedFeature);
    }
    
    function onFeatureUnselect(feature) {
        map.removePopup(feature.popup);
        feature.popup.destroy();
        feature.popup = null;
    }   
    
    function markerClick(evt) {
        var p = this.createPopup(this.closeBox);
        var ll = p.lonlat;
        var sHtml = p.contentHTML;
        var popup;
        var len = map.popups.length;
        var feature = new OpenLayers.Feature(markers, ll);
    
        for (var j = 0; j < len; j++) {
            popup = map.popups[j];
            map.removePopup(popup);
            if (popup.feature) {
                popup.feature.popup.destroy();
                popup.feature.popup = null;
                popup.feature = null;
            }
            popup = null;
        }
        
        popup = new OpenLayers.Popup.FramedCloud("featurePopup",
                                                 ll,
                                                 new OpenLayers.Size(200, 200),
                                                 sHtml,
                                                 null, true);
        feature.popup = popup;
        popup.feature = feature;
        map.addPopup(popup);
        OpenLayers.Event.stop(evt);
    }
    
    // 检测点击的要素控件
    function toggleControl(element) {
        for (key in drawControls) {
            var control = drawControls[key];
            if (element == key ) {
            	// 设置自己定义图层样式 画线
                setMyVectorStyleLayer();
                if (key.toString() == "modify") {
                    draw = null;
                } else {
                    draw = control;
                }
                control.activate();
            } else {
                control.deactivate();
            }
        }
    }
    
    //设置自己定义图层样式 画线
    function setMyVectorStyleLayer() {
        // 清除自定义样式图层已存在的要素
        polygonStyleLayer.removeFeatures(polygonStyleLayer.features);
        // 定义样式
        polygonStyleLayer.style = {
                fillColor: selectcolor,
                strokeColor: selectcolor,
                strokeOpacity: 0.8,
                strokeWidth: parseInt($('#my_selectLinewidth').val()),
                pointRadius: 5,
                label: "",
                fontSize: '12px',
                fontFamily: '宋体',
                labelXOffset: 30,
                labelYOffset: 10,
                labelAlign: 'rm'
                };
         polygonStyleLayer.rendererOptions = { zIndexing: true };
    }
