
/**
 * 搜索图标 图标的下拉列表
 */
function initSelect() {
	/** */
	$.ajax( {
		url : pathBase + 'map/queryIconNormal.do',
		success : function(json) {
			var html = '';
			var jsonArray = JSON.parse(json);
			$.each(jsonArray, function(i, n) {
				html += '<option value=' + n.id + '> ' + n.iconName
						+ '</option> ';
			});
			$('#id-dv-tb1').html('<select id="id-icon-type">' + html + '</select>');
		}
	});
}

/**
 * 搜索站点结果下拉列表改变
 */
function siteChange(){
	document.getElementById('mouseSelect').checked = false;
    document.getElementById("initSiteTap").checked = false;
	var sn = $('#id-result option:selected').val();
    //markers.clearMarkers();
	$.ajax({
		url:pathBase+'siteController/findValidSites.do',
		dataType:'json',
		success:function(json){
			var centerLonLat = null;
			$.each(json.list,function(i,n){
			var lonlat = new OpenLayers.LonLat(n.LONGITUDE, n.LATITUDE);
			
				if(n.SITEID == sn){
						centerLonLat = new OpenLayers.LonLat(n.LONGITUDE, n.LATITUDE);
						addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
						icon:pathBase+'map/images/z1.png',id:n.SITEID,isSearch:true,siteid:n.SITENO,sitetype:n.ICONTYPEID});
					}
					else{
						addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
							icon:pathBase+n.ICONPATH,id:n.SITEID,siteid:n.SITENO,sitetype:n.ICONTYPEID});
					}
				});
				
			    map.setCenter(centerLonLat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")));
		}
	});
}

/**
 * 搜索站点
 */
function searchSites(){
	document.getElementById('mouseSelect').checked = false;
    document.getElementById("initSiteTap").checked= false;
	$.ajax({
		url:pathBase+'map/findSites.do',
		dataType:'json',
		type:'post',
		data:{iconId:$('#id-icon-type').val(),siteName:$('#id-site-name').val()},
		success:function(json){
			if(json == "0"){
				$.messager.alert('提示','没有符合条件的站点');
				$('#id-result').html('');
			} else {
				var options = '';
				var st = null;
				$.each(json, function(i,n){
					if(i==0)st=n;
					options += '<option value="' + n.siteNo + '" wd="' + n.latitude + '" jd="' + n.longitude + '" path="'+pathBase + n.iconPath + '">'
						    + n.siteName
						    + '</option>';
				});
				$('#id-result').html(options);
				
				var centerLonLat = null;
				$.each(json,function(i,n){
					var lonlat = new OpenLayers.LonLat(n.longitude, n.latitude);
					if(n.id == st.id){
						centerLonLat = new OpenLayers.LonLat(n.longitude, n.latitude);
						addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
						icon:pathBase+'map/images/z1.png',id:n.id,isSearch:true,siteid:n.siteNo,sitetype:n.iconTypeId});
				   } else {
						addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
							icon:pathBase+n.iconPath,id:n.id,siteid:n.siteNo,sitetype:n.iconTypeId});
					}
				});
				map.setCenter(centerLonLat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")));
			}
		}
	});
}

/**
 * 搜索站点
 */
function searchSitesForSimple(){
 var sn=document.getElementById('btId').value;
	$.ajax({
		url:pathBase+'siteController/findValidSites.do',
		dataType:'json',
		success:function(json){
			var centerLonLat = null;
			$.each(json.list,function(i,n){
				var lonlat = new OpenLayers.LonLat(n.LONGITUDE, n.LATITUDE);
				if(n.SITEID == sn){
					centerLonLat = new OpenLayers.LonLat(n.LONGITUDE, n.LATITUDE);
					addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
						icon:pathBase+n.ICONPATH,id:n.SITEID,isSearch:true,siteid:n.SITENO,sitetype:n.ICONTYPEID});
				}else{
					addSiteMarker({lonlat:lonlat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")),
				    	//	icon:pathBase+'img/marker_a.png',id:n.SITE_SN,siteid:n.SITE_ID,sitetype:n.TBTYPE});
						icon:pathBase+n.ICONPATH,id:n.SITEID,siteid:n.SITENO,sitetype:n.ICONTYPEID});
				}
			});
			map.setCenter(centerLonLat.transform(new OpenLayers.Projection("EPSG:4326"),new OpenLayers.Projection("EPSG:900913")));
		}
	});
}

