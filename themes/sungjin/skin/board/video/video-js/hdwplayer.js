var q = Array();
var rf = ['1','2','3','4','5','0','-1','6','7','8','9','11','12','22','contextmenu','-2','-3','-','>'];
var hdw_pltXml = {};
var hdw_pxmlDoc = new Array();
var hdw_xmlDoc = new Array();
var hdw_playList = 'true';
var html5_plx;
var hdw_configXml = new Array();
var hdw_playListXml = new Array();
var hdw_skinMode = 'static';
var hdw_playListAutoStart = 'true';
var hdw_autoStart = 'true';
var hdw_playPauseDock = 'true';
var hdw_controlBar = 'true';
var hdw_timerDock = 'true';
var hdw_volumeDock = 'true';
var hdw_fullScreenDock = 'true';
var hdw_cbtopClr = '484848';
var hdw_cbbottomClr = '000000';
var hdw_cbborderClr = '000000';
var hdw_playpauseClr = 'ffffff';
var hdw_progressbarClr = '121212';
var hdw_bufferClr = '222222';
var hdw_timerClr = 'ffffff';
var hdw_volumeClr = 'ffffff';
var hdw_volumesliderClr = '444444';
var hdw_volumesliderbdrClr = '000000';
var hdw_volumeseekerClr = '666666';
var hdw_volumeseekerbdrClr = '000000';
var hdw_fullscreenClr = 'ffffff';
var hdw_openclosearwClr = 'cccccc';
var hdw_ocArwBgClr = '242526';
var hdw_ocArwBgBdrClr = '353535';
var hdw_headertopClr = '232425';
var hdw_headerbottomClr = '060606';
var hdw_activevideobgClr = '1b1c1c';
var hdw_videotitleClr =  'cccccc';
var hdw_headerfontClr = 'cccccc';
var hdw_videobgClr = '242526';
var hdw_playlistbgClr = '242526';

function hdwplayer(obj) {
	q = def();
	f = '';
	for (ele in obj) {
		q[ele] = obj[ele];
		if (ele != 'swf' && ele != 'width' && ele != 'height' && ele != 'id') {
			f += '&' + ele + '=' + obj[ele]
		}
	}
	
	if (q.adsense && q.width >= 320 && q.height >= 300) {
		enableAds()
	}
	if (isMobile().any()) {
		html5(q)
	} else {
		shockwaveflash(q, f)
		//html5(q)
	}
}
function def() {
	return {
		swf : 'player/player.swf',
		width : 640,
		height : 480
	}
}
function isMobile() {
	var index = navigator.appVersion.indexOf("Mobile");
	var isMobile = {
		    Android: function() {
		        return navigator.userAgent.match(/Android/i);
		    },
		    any: function() {
		        return (index > -1);
		    }
		};
	return isMobile
}
function shockwaveflash(q, f) {
	var params = {
		allowScriptAccess : "always",
		allowFullScreen : "true",
		flashvars : f
	};
	var atts = {
		id : q.id
	};
	swfobject.embedSWF(q.swf, q.id, q.width, q.height, "9", null, null, params,
			atts)
}
function enableAds() {
	var i = Math.floor(Math.random() * 99);
	var pos = getPosition(document.getElementById(q.id));
	var ads = '';
	ads += '<div id="ad_wrapper' + i
			+ '" style="position:absolute; z-index:99999; top:' + pos[0]
			+ 'px; left:' + pos[1] + 'px;">';
	ads += '<div style="display:inline-block; position:absolute; z-index:999999; border:2px solid #999; margin:'
			+ (q.height / 2 - 141) + 'px ' + (q.width / 2 - 150) + 'px;">';
	ads += '<div style="background:#999; padding:5px; font-family:Verdana, Arial, Helvetica, sans-serif; font-size:11px; font-weight:bold; color:#fff;">';
	ads += 'Advertisement<a href="javascript:hideAd(\'ad_wrapper'
			+ i
			+ '\');" style="margin-left:186px; background-color:#666; color:#fff; text-decoration:none; border:1px solid #333;">&nbsp;X&nbsp;</a>';
	ads += '</div>';
	ads += '<div style="text-align:center; overflow:hidden;	background:#999; width=300px; height=250px;">';
	ads += '<iframe frameborder=0 marginwidth=0 marginheight=0 scrolling=no width=300 height=250 src="'
			+ q.adsense + '"></iframe>';
	ads += '</div>';
	ads += '</div>';
	ads += '<div style="background-color:#000; filter:alpha(opacity=75); -moz-opacity:.75; opacity:.75; width:'
			+ q.width + 'px; height:' + q.height + 'px;"></div>';
	ads += '</div>';
	document.write(ads)
}
function getPosition(obj) {
	var finalvalue = Array();
	var topValue = 0, leftValue = 0;
	while (obj) {
		leftValue += obj.offsetLeft;
		topValue += obj.offsetTop;
		obj = obj.offsetParent
	}
	finalvalue[0] = topValue;
	finalvalue[1] = leftValue;
	return finalvalue
}
function hideAd(id) {
	document.getElementById(id).style.display = 'none'
}
function html5(q) {
	opt = '';
	if(q.video != undefined){
		switch (q.type) {
			case 'youtube':
				regex = /http\:\/\/www\.youtube\.com\/watch\?v=(\w{11})/;
				url = q.video;
				id = url.match(regex)[1];
				opt += '<iframe title="YouTube video player" width="' + q.width
						+ '" height="' + q.height
						+ '" src="http://www.youtube.com/embed/' + id
						+ '" frameborder="0" allowfullscreen></iframe>';
				break;
			case 'dailymotion':
				_vid = q.video;
				opt += '<iframe frameborder="0" width="'
						+ q.width
						+ '" height="'
						+ q.height
						+ '" src="'
						+ _vid.replace("http://www.dailymotion.com/video/",
								"http://www.dailymotion.com/embed/video/")
						+ '"></iframe>';
				break;
			case 'vimeo':
				_vid = q.video;
				opt += '<iframe frameborder="0" width="'+ q.width+ '" height="'+ q.height+ '" src="'+ _vid.replace("http://vimeo.com/",	"http://player.vimeo.com/video/")+ '"></iframe>';
				break;
			case 'rtmp':
				_vid = q.video;
				_rtmp = q.streamer;
				_thumb = q.preview;
				_hls = q.hls;
				if(_hls == '' ){
					_hls = _rtmp.replace("rtmp","http") + '/'+_vid +'/playlist.m3u8'; 
				}
				if (isMobile().Android()) {
					_rtsp = q.rtsp;
					opt += '<a href="'+_rtsp+'"><img border="0" width="' + q.width + '" height="'	+ q.height + '" src="'+_thumb+'">';
					opt += '</a>';
				} else {
					opt += '<video poster="' + _thumb + '" onclick="this.play();" width="' + q.width + '" height="'	+ q.height + '" controls>';
					opt += '<source src="' + _hls + '" />';
					opt += '</video>';
				}
				break;
			default:
				opt += '<video  poster="' + q.preview + '" onclick="this.play();" width="' + q.width + '" height="'
						+ q.height + '" controls>';
				opt += '<source src="' + q.video + '" />';
				opt += '</video>';
				break;
			}		
	}
	document.getElementById(q.id).style.height = q.height;
	document.getElementById(q.id).style.width = q.width;
	document.getElementById(q.id).innerHTML = '<div id="'+q.id+'hdwcont" style="height:100%; width:100%">'+opt+'</div>';
	if(q.baseJ != undefined){
		q.config = q.baseJ + 'index.php?option=com_hdwplayer&view=config';
		if(q.category){
			q.config += '&category='+q.category;
		}
	}
	
	if(q.config != undefined)hdw_configXml[q.id] = q.config;
	gc(q.id);
	gp();
}

function chgcnt(){
	opt = '';	
	switch (hdw_pltXml.type) {
	case 'youtube':
		regex = /https?\:\/\/www\.youtube\.com\/watch\?v=(\w{11})/;
		url = hdw_pltXml.video;
		id = url.match(regex)[1];
		opt += '<iframe title="YouTube video player" width="' + q.width
				+ '" height="' + q.height
				+ '" src="http://www.youtube.com/embed/' + id
				+ '" frameborder="0" allowfullscreen></iframe>';
		break;
	case 'dailymotion':
		_vid = hdw_pltXml.video;
		opt += '<iframe frameborder="0" width="'
				+ q.width
				+ '" height="'
				+ q.height
				+ '" src="'
				+ _vid.replace("http://www.dailymotion.com/video/",
						"http://www.dailymotion.com/embed/video/")
				+ '"></iframe>';
		break;
	case 'vimeo':
		_vid = hdw_pltXml.video;
		opt += '<iframe frameborder="0" width="'+ q.width+ '" height="'+ q.height+ '" src="'+ _vid.replace("http://vimeo.com/",	"http://player.vimeo.com/video/")+ '"></iframe>';
		break;
	case 'rtmp':
		_vid = hdw_pltXml.video;
		_rtmp = hdw_pltXml.streamer;
		_thumb = hdw_pltXml.preview;
		_hls = hdw_pltXml.hls;
		if(_hls == '' ){
			_hls = _rtmp.replace("rtmp","http") + '/'+_vid +'/playlist.m3u8'; 
		}
		if (isMobile().Android()) {
			_rtsp = hdw_pltXml.rtsp;
			opt += '<a href="'+_rtsp+'"><img border="0" width="' + q.width + '" height="'	+ q.height + '" src="'+_thumb+'">';
			opt += '</a>';
		} else {
			opt += '<video poster="' + _thumb + '" onclick="this.play();" width="' + q.width + '" height="'	+ q.height + '" controls>';
			opt += '<source src="' + _hls + '" />';
			opt += '</video>';
		}
		break;
	default:
		opt += '<video  poster="' + hdw_pltXml.thumb + '" onclick="this.play();" width="' + q.width + '" height="'+ q.height + '" controls>';
		opt += '<source src="' + hdw_pltXml.video + '" />';
		opt += '</video>';
		break
	}
	
	document.getElementById(q.id+'hdwcont').innerHTML = opt;
}

function gc(player_id){
	
	if(Object.keys(hdw_configXml).length > 0){
		
		if(window.XMLHttpRequest){hdw_xmlhttp = new XMLHttpRequest();}
		else{hdw_xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");}
		hdw_xmlhttp.open("GET",hdw_configXml[player_id],false);
		hdw_xmlhttp.send();
		
		hdw_xmlDoc=hdw_xmlhttp.responseXML;
		
		//hdw_skinMode = hdw_xmlDoc.getElementsByTagName("skinMode")[0] != undefined ? hdw_xmlDoc.getElementsByTagName("skinMode")[0].innerHTML : 'static';
		if(hdw_xmlDoc.getElementsByTagName("playListXml")[0] != undefined){ 
			q.playListXml = hdw_xmlDoc.getElementsByTagName("playListXml")[0].innerHTML;
			q.playListXml = q.playListXml.replace(/%26/g, "&");
		}	
		
	}
	
}

function gp(){
	
	if(q.playListXml != undefined){
		
		if(window.XMLHttpRequest){var hdw_pxmlhttp = new XMLHttpRequest();}
		else{hdw_pxmlhttp = new ActiveXObject("Microsoft.XMLHTTP");}
		
		hdw_pxmlhttp.open("GET",q.playListXml,false);
		hdw_pxmlhttp.send();
		hdw_pxmlDoc[q.id]=hdw_pxmlhttp.responseXML;
		hdw_pxmlObj=hdw_pxmlDoc[q.id].documentElement;
		
		elemCreate();
	}
}

function elemCreate() {	
	if(q.playListXml != ''){
		popt = '';
		html5_plx = hdw_pxmlDoc[q.id].getElementsByTagName("media");
		if(hdw_playList=='true'){
			popt += '<div id="'+q.id+'hdw_left_wrap" class="hdw_left_wrap" style="right: -160px;" >';
			popt += '<div id="'+q.id+'hdw_inner_left_wrap" class="hdw_inner_left_wrap hdw_out" style="border: 1px solid rgb(53, 53, 53); background: rgb(36, 37, 38);">';
			popt += '<div id="point_right" style="border-left-color: rgb(204, 204, 204); display: block;"></div>';
			popt += '<div id="point_left" style="border-right-color: rgb(204, 204, 204); display: none;"></div>';
			popt += '</div>';
			popt += '<div id="'+q.id+'hdw_inner_top_wrap" class="hdw_inner_top_wrap"><span>Related Videos</span></div>';
			popt += '<div id="playerhdw_inner_right_wrap" class="hdw_inner_right_wrap" style="background: rgb(36, 37, 38);">';			
		}
		plxelem = [];
		for(var pli=0;pli<html5_plx.length;pli++){
			if(pli == 0 && q.video == undefined){
				getvideo(pli);
			}
			if(html5_plx[pli].getElementsByTagName("thumb")[0].innerHTML != ""){
				var pli_src = html5_plx[pli].getElementsByTagName("thumb")[0].innerHTML;
			}else if(html5_plx[pli].getElementsByTagName("preview")[0].innerHTML != ""){
				var pli_src = html5_plx[pli].getElementsByTagName("preview")[0].innerHTML;
			}else{
				var pli_src = 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAHgAAABaCAIAAAD8YgW4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAKT2lDQ1BQaG90b3Nob3AgSUNDIHByb2ZpbGUAAHjanVNnVFPpFj333vRCS4iAlEtvUhUIIFJCi4AUkSYqIQkQSoghodkVUcERRUUEG8igiAOOjoCMFVEsDIoK2AfkIaKOg6OIisr74Xuja9a89+bN/rXXPues852zzwfACAyWSDNRNYAMqUIeEeCDx8TG4eQuQIEKJHAAEAizZCFz/SMBAPh+PDwrIsAHvgABeNMLCADATZvAMByH/w/qQplcAYCEAcB0kThLCIAUAEB6jkKmAEBGAYCdmCZTAKAEAGDLY2LjAFAtAGAnf+bTAICd+Jl7AQBblCEVAaCRACATZYhEAGg7AKzPVopFAFgwABRmS8Q5ANgtADBJV2ZIALC3AMDOEAuyAAgMADBRiIUpAAR7AGDIIyN4AISZABRG8lc88SuuEOcqAAB4mbI8uSQ5RYFbCC1xB1dXLh4ozkkXKxQ2YQJhmkAuwnmZGTKBNA/g88wAAKCRFRHgg/P9eM4Ors7ONo62Dl8t6r8G/yJiYuP+5c+rcEAAAOF0ftH+LC+zGoA7BoBt/qIl7gRoXgugdfeLZrIPQLUAoOnaV/Nw+H48PEWhkLnZ2eXk5NhKxEJbYcpXff5nwl/AV/1s+X48/Pf14L7iJIEyXYFHBPjgwsz0TKUcz5IJhGLc5o9H/LcL//wd0yLESWK5WCoU41EScY5EmozzMqUiiUKSKcUl0v9k4t8s+wM+3zUAsGo+AXuRLahdYwP2SycQWHTA4vcAAPK7b8HUKAgDgGiD4c93/+8//UegJQCAZkmScQAAXkQkLlTKsz/HCAAARKCBKrBBG/TBGCzABhzBBdzBC/xgNoRCJMTCQhBCCmSAHHJgKayCQiiGzbAdKmAv1EAdNMBRaIaTcA4uwlW4Dj1wD/phCJ7BKLyBCQRByAgTYSHaiAFiilgjjggXmYX4IcFIBBKLJCDJiBRRIkuRNUgxUopUIFVIHfI9cgI5h1xGupE7yAAygvyGvEcxlIGyUT3UDLVDuag3GoRGogvQZHQxmo8WoJvQcrQaPYw2oefQq2gP2o8+Q8cwwOgYBzPEbDAuxsNCsTgsCZNjy7EirAyrxhqwVqwDu4n1Y8+xdwQSgUXACTYEd0IgYR5BSFhMWE7YSKggHCQ0EdoJNwkDhFHCJyKTqEu0JroR+cQYYjIxh1hILCPWEo8TLxB7iEPENyQSiUMyJ7mQAkmxpFTSEtJG0m5SI+ksqZs0SBojk8naZGuyBzmULCAryIXkneTD5DPkG+Qh8lsKnWJAcaT4U+IoUspqShnlEOU05QZlmDJBVaOaUt2ooVQRNY9aQq2htlKvUYeoEzR1mjnNgxZJS6WtopXTGmgXaPdpr+h0uhHdlR5Ol9BX0svpR+iX6AP0dwwNhhWDx4hnKBmbGAcYZxl3GK+YTKYZ04sZx1QwNzHrmOeZD5lvVVgqtip8FZHKCpVKlSaVGyovVKmqpqreqgtV81XLVI+pXlN9rkZVM1PjqQnUlqtVqp1Q61MbU2epO6iHqmeob1Q/pH5Z/YkGWcNMw09DpFGgsV/jvMYgC2MZs3gsIWsNq4Z1gTXEJrHN2Xx2KruY/R27iz2qqaE5QzNKM1ezUvOUZj8H45hx+Jx0TgnnKKeX836K3hTvKeIpG6Y0TLkxZVxrqpaXllirSKtRq0frvTau7aedpr1Fu1n7gQ5Bx0onXCdHZ4/OBZ3nU9lT3acKpxZNPTr1ri6qa6UbobtEd79up+6Ynr5egJ5Mb6feeb3n+hx9L/1U/W36p/VHDFgGswwkBtsMzhg8xTVxbzwdL8fb8VFDXcNAQ6VhlWGX4YSRudE8o9VGjUYPjGnGXOMk423GbcajJgYmISZLTepN7ppSTbmmKaY7TDtMx83MzaLN1pk1mz0x1zLnm+eb15vft2BaeFostqi2uGVJsuRaplnutrxuhVo5WaVYVVpds0atna0l1rutu6cRp7lOk06rntZnw7Dxtsm2qbcZsOXYBtuutm22fWFnYhdnt8Wuw+6TvZN9un2N/T0HDYfZDqsdWh1+c7RyFDpWOt6azpzuP33F9JbpL2dYzxDP2DPjthPLKcRpnVOb00dnF2e5c4PziIuJS4LLLpc+Lpsbxt3IveRKdPVxXeF60vWdm7Obwu2o26/uNu5p7ofcn8w0nymeWTNz0MPIQ+BR5dE/C5+VMGvfrH5PQ0+BZ7XnIy9jL5FXrdewt6V3qvdh7xc+9j5yn+M+4zw33jLeWV/MN8C3yLfLT8Nvnl+F30N/I/9k/3r/0QCngCUBZwOJgUGBWwL7+Hp8Ib+OPzrbZfay2e1BjKC5QRVBj4KtguXBrSFoyOyQrSH355jOkc5pDoVQfujW0Adh5mGLw34MJ4WHhVeGP45wiFga0TGXNXfR3ENz30T6RJZE3ptnMU85ry1KNSo+qi5qPNo3ujS6P8YuZlnM1VidWElsSxw5LiquNm5svt/87fOH4p3iC+N7F5gvyF1weaHOwvSFpxapLhIsOpZATIhOOJTwQRAqqBaMJfITdyWOCnnCHcJnIi/RNtGI2ENcKh5O8kgqTXqS7JG8NXkkxTOlLOW5hCepkLxMDUzdmzqeFpp2IG0yPTq9MYOSkZBxQqohTZO2Z+pn5mZ2y6xlhbL+xW6Lty8elQfJa7OQrAVZLQq2QqboVFoo1yoHsmdlV2a/zYnKOZarnivN7cyzytuQN5zvn//tEsIS4ZK2pYZLVy0dWOa9rGo5sjxxedsK4xUFK4ZWBqw8uIq2Km3VT6vtV5eufr0mek1rgV7ByoLBtQFr6wtVCuWFfevc1+1dT1gvWd+1YfqGnRs+FYmKrhTbF5cVf9go3HjlG4dvyr+Z3JS0qavEuWTPZtJm6ebeLZ5bDpaql+aXDm4N2dq0Dd9WtO319kXbL5fNKNu7g7ZDuaO/PLi8ZafJzs07P1SkVPRU+lQ27tLdtWHX+G7R7ht7vPY07NXbW7z3/T7JvttVAVVN1WbVZftJ+7P3P66Jqun4lvttXa1ObXHtxwPSA/0HIw6217nU1R3SPVRSj9Yr60cOxx++/p3vdy0NNg1VjZzG4iNwRHnk6fcJ3/ceDTradox7rOEH0x92HWcdL2pCmvKaRptTmvtbYlu6T8w+0dbq3nr8R9sfD5w0PFl5SvNUyWna6YLTk2fyz4ydlZ19fi753GDborZ752PO32oPb++6EHTh0kX/i+c7vDvOXPK4dPKy2+UTV7hXmq86X23qdOo8/pPTT8e7nLuarrlca7nuer21e2b36RueN87d9L158Rb/1tWeOT3dvfN6b/fF9/XfFt1+cif9zsu72Xcn7q28T7xf9EDtQdlD3YfVP1v+3Njv3H9qwHeg89HcR/cGhYPP/pH1jw9DBY+Zj8uGDYbrnjg+OTniP3L96fynQ89kzyaeF/6i/suuFxYvfvjV69fO0ZjRoZfyl5O/bXyl/erA6xmv28bCxh6+yXgzMV70VvvtwXfcdx3vo98PT+R8IH8o/2j5sfVT0Kf7kxmTk/8EA5jz/GMzLdsAAAAgY0hSTQAAeiUAAICDAAD5/wAAgOkAAHUwAADqYAAAOpgAABdvkl/FRgAAA6pJREFUeNrs3M1rVFcYx/HnzH1xqkkWdmGaRbIxxY6aoFIhEhcJiCQVWptijFqq0dJS2k2h7V/hS7FtAiUKYixiG0hLpBtLRF0owdwJOFsnTTdKTMgizL33nPM8XUwapJBkZpqUO/L7chd3kWw+3HnuOYdh1MTEBKGNLwUCQAMaARrQgEaABjQCNKABjQANaARoQAMaARrQCNCABjQCNKARoAENaARoQKNXBPrF7IvR0d/m5uYAvbE9yeUmg+DatetBNmutBfRG5bqe53mx1rdv/359+Mbs7CygNyjRWhtjlKKZmb9+GBi8e/deHMeAXueUImONtcYYI8JEdOePO0NXrk7np0UE0Ov3PIvQMqiQUsrzvOfPnv84NDQ2NhZFEaDXCZqLlwiLiBRvlFK+5z98NHHh/MVcLsfMgP7P0CRqhXzP08YMD//0y88j8/PzVQHtJnl0aB2nUmqlP3AcJ8hms1NTR468s2/fXs/zAF3Z6GBjYsdRq78yRWhkZCQIgu7ursbGRoyOCkYHEam1ruKK283n85cvfzc+Pl4oFABd9uhgyyVeJJRKOaOjv144fzH/NA/o8kaHlBOJ+J6/sLBw6dK3t27eWlxcxIwu9Ym21lZwyuG67v0HDyaD4OTJEzve2uE4Dp7oNaCFubLLdZywUBgcGBz4fiAhu/YEn3WIcMXSwkLieu7jycdT2SxGx2qxCBtmlyv+QMQ6bm1paWltBfQaVFYsSyXQOtabt2w+e65/1+7dCZnRiX4ZLi3dyvocMGsdtx882PNBT21tLVYdJZ11FBfJpf9LFEZbX9/6yadfbm/erpTC8q7EdXRx3cFEpJQSkaLdv25EhBSxZWvt0Z6jHZ2dNTU1OOsoc3QUdyLF7fjyaf9LN0tnT7Fuamo61tub2ZnBoVIF0GS1tqu8ypSyxhBRb19fR2dHOp2mBJdkaLbGrLQzZOYoDN/ev//Eh6caGhoo8SV4Hb3y5ltr7W/a9NkXn7cdOOD7PlVDSd6wMP/zMlzOMsdR1N7e3v/xuUSt3qp7RjPzy9BxFG2rr//ozJk9e/ckZBvyaizvls4tiIgts/Chw4d7+47X1dVRFZbg0cFsjDHGhGG47Y36r77+pvnNZqrakgtdiKIwDB3HOX22v6urO/1amqq55EK3tbXNTP/57vvvZTIZqv4Ufpv0/wlfRAc0oBGgAQ1oEAAa0AjQgAY0AjSgEaABDWgEaEAjQAMa0AjQgEaABjSgEaABjQCdyP4eANV2is/eAaxoAAAAAElFTkSuQmCC';
			}
			
			if(pli == 0){var tcc = 'playing';}else{var tcc=''};
			popt += '<div><img class="'+q.id+'html5_playlist_thumb '+tcc+'" id="thumb_'+pli+'" src="'+pli_src+'">';
			popt += '<p style="color: rgb(204, 204, 204);">'+html5_plx[pli].getElementsByTagName("title")[0].innerHTML+'</p>';
			popt += '</div>';
		}
		if(hdw_playList=='true'){
			popt += '</div>';
			popt += '</div>';
		}
		var div = document.getElementById(q.id);

		div.innerHTML = div.innerHTML;
		cf(q.id,0,[q.id],'prc',rf[13],'gen');
		cf(q.id,0,[html5_plx.length],'uplay',rf[0],'gen');
		cf(q.id,0,['hdw_inner_left_wrap'],'shpl',rf[16],'gen');
	}
}

function getvideo(id){	
	hdw_pltXml = {};
	hdw_pltXml.type = html5_plx[id].getElementsByTagName("type")[0].innerHTML;
	hdw_pltXml.video = html5_plx[id].getElementsByTagName("video")[0].innerHTML;
	hdw_pltXml.title = html5_plx[id].getElementsByTagName("title")[0].innerHTML;
	hdw_pltXml.streamer =  html5_plx[id].getElementsByTagName("streamer")[0] != undefined ? html5_plx[id].getElementsByTagName("streamer")[0].innerHTML : '';
	hdw_pltXml.preview = html5_plx[id].getElementsByTagName("preview")[0] != undefined ?  html5_plx[id].getElementsByTagName("preview")[0].innerHTML : '' ;
	hdw_pltXml.thumb = html5_plx[id].getElementsByTagName("thumb")[0] != undefined ? html5_plx[id].getElementsByTagName("thumb")[0].innerHTML : '';
	if(hdw_pltXml.thumb == ''){
		hdw_pltXml.thumb = 'data:image/png;base64,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';
	}
	if(hdw_pltXml.preview == ''){
		hdw_pltXml.preview = hdw_pltXml.thumb;
	}
	hdw_pltXml.hls = html5_plx[id].getElementsByTagName("hls")[0] != undefined ? html5_plx[id].getElementsByTagName("hls")[0].innerHTML : '';
	hdw_pltXml.rtsp = html5_plx[id].getElementsByTagName("hls")[0] != undefined ? html5_plx[id].getElementsByTagName("hls")[0].innerHTML : '';
	chgcnt();
}

function cf(p,yc,x,f,dd,vt) {
	for(var i=0;i<x.length;i++){
		if(dd == rf[0]){ 
			if(f == 'uplay'){
				for(var j=0;j<x[i];j++){
					document.getElementById('thumb_'+j).onclick = function(){
						r = p;
						this.className = p+"html5_playlist_thumb "+"playing";
						var parent = document.getElementById(this.id).parentNode;
						parent.style.background = "#1b1c1c";
						var id = this.id.split('thumb_')[1];
						getvideo(id);
					}
					document.getElementById('thumb_'+j).onmouseover = function() {
						var cl = this.className;
						if(cl.indexOf("playing") == -1){
							var parent = document.getElementById(this.id).parentNode;
							parent.style.background = "#1b1c1c";
						}
					};
					
					document.getElementById('thumb_'+j).onmouseleave = function() {
						var cl = this.className;
						if(cl.indexOf("playing") == -1){
							var parent = document.getElementById(this.id).parentNode;
							parent.style.background = "#242526";
						}
					};
				}
			}
		}else if(dd == rf[16]){
			document.getElementById(p+x[i]).onclick = function(){
				if(document.getElementById(p+'hdw_left_wrap').style.right == "-160px"){
					this.className = "hdw_inner_left_wrap "+"hdw_in";
				}else{
					this.className = "hdw_inner_left_wrap "+"hdw_out";
				}
				setInt();
			}
		}
	}	
}

function setInt(){
	var cn = document.getElementById(q.id+'hdw_inner_left_wrap').className.split(' ')[1];
	if(cn == 'hdw_out'){
		var rt = document.getElementById(q.id+'hdw_left_wrap');
		rt.style.right = (parseInt(rt.style.right.replace('px','')) - 10)+"px";
		if(rt.style.right != '-160px'){
			setTimeout(setInt,20); 
		}
	}else{		
		var rt = document.getElementById(q.id+'hdw_left_wrap');
		rt.style.right = (parseInt(rt.style.right.replace('px','')) + 10)+"px";
		if(rt.style.right != '0px'){
			setTimeout(setInt,20); 
		}	
	}
	
}

function dispatchEvent(type, event) {
	var evt = document.createEvent("Event");
	evt.initEvent(type, true, true);
	evt.data = event;
	target = document.getElementById(q.id);
	target.dispatchEvent(evt)
}
var swfobject = function() {
	var D = "undefined", r = "object", S = "Shockwave Flash", W = "ShockwaveFlash.ShockwaveFlash", q = "application/x-shockwave-flash", R = "SWFObjectExprInst", x = "onreadystatechange", O = window, j = document, t = navigator, T = false, U = [ h ], o = [], N = [], I = [], l, Q, E, B, J = false, a = false, n, G, m = true, M = function() {
		var aa = typeof j.getElementById != D
				&& typeof j.getElementsByTagName != D
				&& typeof j.createElement != D, ah = t.userAgent.toLowerCase(), Y = t.platform
				.toLowerCase(), ae = Y ? /win/.test(Y) : /win/.test(ah), ac = Y ? /mac/
				.test(Y)
				: /mac/.test(ah), af = /webkit/.test(ah) ? parseFloat(ah
				.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : false, X = !+"\v1", ag = [
				0, 0, 0 ], ab = null;
		if (typeof t.plugins != D && typeof t.plugins[S] == r) {
			ab = t.plugins[S].description;
			if (ab
					&& !(typeof t.mimeTypes != D && t.mimeTypes[q] && !t.mimeTypes[q].enabledPlugin)) {
				T = true;
				X = false;
				ab = ab.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
				ag[0] = parseInt(ab.replace(/^(.*)\..*$/, "$1"), 10);
				ag[1] = parseInt(ab.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
				ag[2] = /[a-zA-Z]/.test(ab) ? parseInt(ab.replace(
						/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0
			}
		} else {
			if (typeof O.ActiveXObject != D) {
				try {
					var ad = new ActiveXObject(W);
					if (ad) {
						ab = ad.GetVariable("$version");
						if (ab) {
							X = true;
							ab = ab.split(" ")[1].split(",");
							ag = [ parseInt(ab[0], 10), parseInt(ab[1], 10),
									parseInt(ab[2], 10) ]
						}
					}
				} catch (Z) {
				}
			}
		}
		return {
			w3 : aa,
			pv : ag,
			wk : af,
			ie : X,
			win : ae,
			mac : ac
		}
	}(), k = function() {
		if (!M.w3) {
			return
		}
		if ((typeof j.readyState != D && j.readyState == "complete")
				|| (typeof j.readyState == D && (j.getElementsByTagName("body")[0] || j.body))) {
			f()
		}
		if (!J) {
			if (typeof j.addEventListener != D) {
				j.addEventListener("DOMContentLoaded", f, false)
			}
			if (M.ie && M.win) {
				j.attachEvent(x, function() {
					if (j.readyState == "complete") {
						j.detachEvent(x, arguments.callee);
						f()
					}
				});
				if (O == top) {
					(function() {
						if (J) {
							return
						}
						try {
							j.documentElement.doScroll("left")
						} catch (X) {
							setTimeout(arguments.callee, 0);
							return
						}
						f()
					})()
				}
			}
			if (M.wk) {
				(function() {
					if (J) {
						return
					}
					if (!/loaded|complete/.test(j.readyState)) {
						setTimeout(arguments.callee, 0);
						return
					}
					f()
				})()
			}
			s(f)
		}
	}();
	function f() {
		if (J) {
			return
		}
		try {
			var Z = j.getElementsByTagName("body")[0].appendChild(C("span"));
			Z.parentNode.removeChild(Z)
		} catch (aa) {
			return
		}
		J = true;
		var X = U.length;
		for ( var Y = 0; Y < X; Y++) {
			U[Y]()
		}
	}
	function K(X) {
		if (J) {
			X()
		} else {
			U[U.length] = X
		}
	}
	function s(Y) {
		if (typeof O.addEventListener != D) {
			O.addEventListener("load", Y, false)
		} else {
			if (typeof j.addEventListener != D) {
				j.addEventListener("load", Y, false)
			} else {
				if (typeof O.attachEvent != D) {
					i(O, "onload", Y)
				} else {
					if (typeof O.onload == "function") {
						var X = O.onload;
						O.onload = function() {
							X();
							Y()
						}
					} else {
						O.onload = Y
					}
				}
			}
		}
	}
	function h() {
		if (T) {
			V()
		} else {
			H()
		}
	}
	function V() {
		var X = j.getElementsByTagName("body")[0];
		var aa = C(r);
		aa.setAttribute("type", q);
		var Z = X.appendChild(aa);
		if (Z) {
			var Y = 0;
			(function() {
				if (typeof Z.GetVariable != D) {
					var ab = Z.GetVariable("$version");
					if (ab) {
						ab = ab.split(" ")[1].split(",");
						M.pv = [ parseInt(ab[0], 10), parseInt(ab[1], 10),
								parseInt(ab[2], 10) ]
					}
				} else {
					if (Y < 10) {
						Y++;
						setTimeout(arguments.callee, 10);
						return
					}
				}
				X.removeChild(aa);
				Z = null;
				H()
			})()
		} else {
			H()
		}
	}
	function H() {
		var ag = o.length;
		if (ag > 0) {
			for ( var af = 0; af < ag; af++) {
				var Y = o[af].id;
				var ab = o[af].callbackFn;
				var aa = {
					success : false,
					id : Y
				};
				if (M.pv[0] > 0) {
					var ae = c(Y);
					if (ae) {
						if (F(o[af].swfVersion) && !(M.wk && M.wk < 312)) {
							w(Y, true);
							if (ab) {
								aa.success = true;
								aa.ref = z(Y);
								ab(aa)
							}
						} else {
							if (o[af].expressInstall && A()) {
								var ai = {};
								ai.data = o[af].expressInstall;
								ai.width = ae.getAttribute("width") || "0";
								ai.height = ae.getAttribute("height") || "0";
								if (ae.getAttribute("class")) {
									ai.styleclass = ae.getAttribute("class")
								}
								if (ae.getAttribute("align")) {
									ai.align = ae.getAttribute("align")
								}
								var ah = {};
								var X = ae.getElementsByTagName("param");
								var ac = X.length;
								for ( var ad = 0; ad < ac; ad++) {
									if (X[ad].getAttribute("name")
											.toLowerCase() != "movie") {
										ah[X[ad].getAttribute("name")] = X[ad]
												.getAttribute("value")
									}
								}
								P(ai, ah, Y, ab)
							} else {
								p(ae);
								if (ab) {
									ab(aa)
								}
							}
						}
					}
				} else {
					w(Y, true);
					if (ab) {
						var Z = z(Y);
						if (Z && typeof Z.SetVariable != D) {
							aa.success = true;
							aa.ref = Z
						}
						ab(aa)
					}
				}
			}
		}
	}
	function z(aa) {
		var X = null;
		var Y = c(aa);
		if (Y && Y.nodeName == "OBJECT") {
			if (typeof Y.SetVariable != D) {
				X = Y
			} else {
				var Z = Y.getElementsByTagName(r)[0];
				if (Z) {
					X = Z
				}
			}
		}
		return X
	}
	function A() {
		return !a && F("6.0.65") && (M.win || M.mac) && !(M.wk && M.wk < 312)
	}
	function P(aa, ab, X, Z) {
		a = true;
		E = Z || null;
		B = {
			success : false,
			id : X
		};
		var ae = c(X);
		if (ae) {
			if (ae.nodeName == "OBJECT") {
				l = g(ae);
				Q = null
			} else {
				l = ae;
				Q = X
			}
			aa.id = R;
			if (typeof aa.width == D
					|| (!/%$/.test(aa.width) && parseInt(aa.width, 10) < 310)) {
				aa.width = "310"
			}
			if (typeof aa.height == D
					|| (!/%$/.test(aa.height) && parseInt(aa.height, 10) < 137)) {
				aa.height = "137"
			}
			j.title = j.title.slice(0, 47) + " - Flash Player Installation";
			var ad = M.ie && M.win ? "ActiveX" : "PlugIn", ac = "MMredirectURL="
					+ O.location.toString().replace(/&/g, "%26")
					+ "&MMplayerType=" + ad + "&MMdoctitle=" + j.title;
			if (typeof ab.flashvars != D) {
				ab.flashvars += "&" + ac
			} else {
				ab.flashvars = ac
			}
			if (M.ie && M.win && ae.readyState != 4) {
				var Y = C("div");
				X += "SWFObjectNew";
				Y.setAttribute("id", X);
				ae.parentNode.insertBefore(Y, ae);
				ae.style.display = "none";
				(function() {
					if (ae.readyState == 4) {
						ae.parentNode.removeChild(ae)
					} else {
						setTimeout(arguments.callee, 10)
					}
				})()
			}
			u(aa, ab, X)
		}
	}
	function p(Y) {
		if (M.ie && M.win && Y.readyState != 4) {
			var X = C("div");
			Y.parentNode.insertBefore(X, Y);
			X.parentNode.replaceChild(g(Y), X);
			Y.style.display = "none";
			(function() {
				if (Y.readyState == 4) {
					Y.parentNode.removeChild(Y)
				} else {
					setTimeout(arguments.callee, 10)
				}
			})()
		} else {
			Y.parentNode.replaceChild(g(Y), Y)
		}
	}
	function g(ab) {
		var aa = C("div");
		if (M.win && M.ie) {
			aa.innerHTML = ab.innerHTML
		} else {
			var Y = ab.getElementsByTagName(r)[0];
			if (Y) {
				var ad = Y.childNodes;
				if (ad) {
					var X = ad.length;
					for ( var Z = 0; Z < X; Z++) {
						if (!(ad[Z].nodeType == 1 && ad[Z].nodeName == "PARAM")
								&& !(ad[Z].nodeType == 8)) {
							aa.appendChild(ad[Z].cloneNode(true))
						}
					}
				}
			}
		}
		return aa
	}
	function u(ai, ag, Y) {
		var X, aa = c(Y);
		if (M.wk && M.wk < 312) {
			return X
		}
		if (aa) {
			if (typeof ai.id == D) {
				ai.id = Y
			}
			if (M.ie && M.win) {
				var ah = "";
				for ( var ae in ai) {
					if (ai[ae] != Object.prototype[ae]) {
						if (ae.toLowerCase() == "data") {
							ag.movie = ai[ae]
						} else {
							if (ae.toLowerCase() == "styleclass") {
								ah += ' class="' + ai[ae] + '"'
							} else {
								if (ae.toLowerCase() != "classid") {
									ah += " " + ae + '="' + ai[ae] + '"'
								}
							}
						}
					}
				}
				var af = "";
				for ( var ad in ag) {
					if (ag[ad] != Object.prototype[ad]) {
						af += '<param name="' + ad + '" value="' + ag[ad]
								+ '" />'
					}
				}
				aa.outerHTML = '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"'
						+ ah + ">" + af + "</object>";
				N[N.length] = ai.id;
				X = c(ai.id)
			} else {
				var Z = C(r);
				Z.setAttribute("type", q);
				for ( var ac in ai) {
					if (ai[ac] != Object.prototype[ac]) {
						if (ac.toLowerCase() == "styleclass") {
							Z.setAttribute("class", ai[ac])
						} else {
							if (ac.toLowerCase() != "classid") {
								Z.setAttribute(ac, ai[ac])
							}
						}
					}
				}
				for ( var ab in ag) {
					if (ag[ab] != Object.prototype[ab]
							&& ab.toLowerCase() != "movie") {
						e(Z, ab, ag[ab])
					}
				}
				aa.parentNode.replaceChild(Z, aa);
				X = Z
			}
		}
		return X
	}
	function e(Z, X, Y) {
		var aa = C("param");
		aa.setAttribute("name", X);
		aa.setAttribute("value", Y);
		Z.appendChild(aa)
	}
	function y(Y) {
		var X = c(Y);
		if (X && X.nodeName == "OBJECT") {
			if (M.ie && M.win) {
				X.style.display = "none";
				(function() {
					if (X.readyState == 4) {
						b(Y)
					} else {
						setTimeout(arguments.callee, 10)
					}
				})()
			} else {
				X.parentNode.removeChild(X)
			}
		}
	}
	function b(Z) {
		var Y = c(Z);
		if (Y) {
			for ( var X in Y) {
				if (typeof Y[X] == "function") {
					Y[X] = null
				}
			}
			Y.parentNode.removeChild(Y)
		}
	}
	function c(Z) {
		var X = null;
		try {
			X = j.getElementById(Z)
		} catch (Y) {
		}
		return X
	}
	function C(X) {
		return j.createElement(X)
	}
	function i(Z, X, Y) {
		Z.attachEvent(X, Y);
		I[I.length] = [ Z, X, Y ]
	}
	function F(Z) {
		var Y = M.pv, X = Z.split(".");
		X[0] = parseInt(X[0], 10);
		X[1] = parseInt(X[1], 10) || 0;
		X[2] = parseInt(X[2], 10) || 0;
		return (Y[0] > X[0] || (Y[0] == X[0] && Y[1] > X[1]) || (Y[0] == X[0]
				&& Y[1] == X[1] && Y[2] >= X[2])) ? true : false
	}
	function v(ac, Y, ad, ab) {
		if (M.ie && M.mac) {
			return
		}
		var aa = j.getElementsByTagName("head")[0];
		if (!aa) {
			return
		}
		var X = (ad && typeof ad == "string") ? ad : "screen";
		if (ab) {
			n = null;
			G = null
		}
		if (!n || G != X) {
			var Z = C("style");
			Z.setAttribute("type", "text/css");
			Z.setAttribute("media", X);
			n = aa.appendChild(Z);
			if (M.ie && M.win && typeof j.styleSheets != D
					&& j.styleSheets.length > 0) {
				n = j.styleSheets[j.styleSheets.length - 1]
			}
			G = X
		}
		if (M.ie && M.win) {
			if (n && typeof n.addRule == r) {
				n.addRule(ac, Y)
			}
		} else {
			if (n && typeof j.createTextNode != D) {
				n.appendChild(j.createTextNode(ac + " {" + Y + "}"))
			}
		}
	}
	function w(Z, X) {
		if (!m) {
			return
		}
		var Y = X ? "visible" : "hidden";
		if (J && c(Z)) {
			c(Z).style.visibility = Y
		} else {
			v("#" + Z, "visibility:" + Y)
		}
	}
	function L(Y) {
		var Z = /[\\\"<>\.;]/;
		var X = Z.exec(Y) != null;
		return X && typeof encodeURIComponent != D ? encodeURIComponent(Y) : Y
	}
	var d = function() {
		if (M.ie && M.win) {
			window.attachEvent("onunload", function() {
				var ac = I.length;
				for ( var ab = 0; ab < ac; ab++) {
					I[ab][0].detachEvent(I[ab][1], I[ab][2])
				}
				var Z = N.length;
				for ( var aa = 0; aa < Z; aa++) {
					y(N[aa])
				}
				for ( var Y in M) {
					M[Y] = null
				}
				M = null;
				for ( var X in swfobject) {
					swfobject[X] = null
				}
				swfobject = null
			})
		}
	}();
	return {
		registerObject : function(ab, X, aa, Z) {
			if (M.w3 && ab && X) {
				var Y = {};
				Y.id = ab;
				Y.swfVersion = X;
				Y.expressInstall = aa;
				Y.callbackFn = Z;
				o[o.length] = Y;
				w(ab, false)
			} else {
				if (Z) {
					Z( {
						success : false,
						id : ab
					})
				}
			}
		},
		getObjectById : function(X) {
			if (M.w3) {
				return z(X)
			}
		},
		embedSWF : function(ab, ah, ae, ag, Y, aa, Z, ad, af, ac) {
			var X = {
				success : false,
				id : ah
			};
			if (M.w3 && !(M.wk && M.wk < 312) && ab && ah && ae && ag && Y) {
				w(ah, false);
				K(function() {
					ae += "";
					ag += "";
					var aj = {};
					if (af && typeof af === r) {
						for ( var al in af) {
							aj[al] = af[al]
						}
					}
					aj.data = ab;
					aj.width = ae;
					aj.height = ag;
					var am = {};
					if (ad && typeof ad === r) {
						for ( var ak in ad) {
							am[ak] = ad[ak]
						}
					}
					if (Z && typeof Z === r) {
						for ( var ai in Z) {
							if (typeof am.flashvars != D) {
								am.flashvars += "&" + ai + "=" + Z[ai]
							} else {
								am.flashvars = ai + "=" + Z[ai]
							}
						}
					}
					if (F(Y)) {
						var an = u(aj, am, ah);
						if (aj.id == ah) {
							w(ah, true)
						}
						X.success = true;
						X.ref = an
					} else {
						if (aa && A()) {
							aj.data = aa;
							P(aj, am, ah, ac);
							return
						} else {
							w(ah, true)
						}
					}
					if (ac) {
						ac(X)
					}
				})
			} else {
				if (ac) {
					ac(X)
				}
			}
		},
		switchOffAutoHideShow : function() {
			m = false
		},
		ua : M,
		getFlashPlayerVersion : function() {
			return {
				major : M.pv[0],
				minor : M.pv[1],
				release : M.pv[2]
			}
		},
		hasFlashPlayerVersion : F,
		createSWF : function(Z, Y, X) {
			if (M.w3) {
				return u(Z, Y, X)
			} else {
				return undefined
			}
		},
		showExpressInstall : function(Z, aa, X, Y) {
			if (M.w3 && A()) {
				P(Z, aa, X, Y)
			}
		},
		removeSWF : function(X) {
			if (M.w3) {
				y(X)
			}
		},
		createCSS : function(aa, Z, Y, X) {
			if (M.w3) {
				v(aa, Z, Y, X)
			}
		},
		addDomLoadEvent : K,
		addLoadEvent : s,
		getQueryParamValue : function(aa) {
			var Z = j.location.search || j.location.hash;
			if (Z) {
				if (/\?/.test(Z)) {
					Z = Z.split("?")[1]
				}
				if (aa == null) {
					return L(Z)
				}
				var Y = Z.split("&");
				for ( var X = 0; X < Y.length; X++) {
					if (Y[X].substring(0, Y[X].indexOf("=")) == aa) {
						return L(Y[X].substring((Y[X].indexOf("=") + 1)))
					}
				}
			}
			return ""
		},
		expressInstallCallback : function() {
			if (a) {
				var X = c(R);
				if (X && l) {
					X.parentNode.replaceChild(l, X);
					if (Q) {
						w(Q, true);
						if (M.ie && M.win) {
							l.style.display = "block"
						}
					}
					if (E) {
						E(B)
					}
				}
				a = false
			}
		}
	}
}();