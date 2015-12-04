<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
@import url(http://fonts.googleapis.com/earlyaccess/nanumpenscript.css);

#news{
	width:100%;
}
#news_table{
	width:50%;
	margin : auto;
}
#news_page{
	margin-top: 20px;
}
#test_table{
	border: 1px solid black;
	
}


</style>
<script src="http://code.jquery.com/jquery-1.7.js"></script>
<script>
$(document).ready(function(){
 
//  var num=1;
 
 function display(data){
	 //alert(data);
  var output='';
  var items = $(data).find('item');
  items.each(function(index,item){
   with(item){
	   
	   /*
	   title
	   originallink
	   description
	   pubDate
	   */
	   //alert($(this).text());
   var title = $(this).find('title').text();
   var link = $(this).find('originallink').text();
   var description=$(this).find('description').text();
   var pubDate=$(this).find('pubDate').text();
   

   output +='<div id="news_table">';
   output += '<table id="test_table" border="1">';
   output += '<tr>';
   output += '<td >';
   output += '제목: '+'<a href=\"'+link+'\">'+title+'</a>';
   output += '</td>';
   output += '</tr>';
   output += '<tr>';
   output += '<td>';
   output += '내용: '+description;
   output += '</td>';
   output += '</tr>';
   
   output += '<tr>';
   output += '<td>';
   output += '날짜: '+pubDate;
   output += '</td>';
   output += '</tr>';
   
   output += '</table>';
   output+='</div>';
   
   }
  });
  
  $('#news').append(output);
  
 
 };
 
 function requestAjax(searchWord){
	 var xmlSource = 'http://openapi.naver.com/search?key=b3d2a7db35b49bd4e457803646ab06e8&query=유기견&display=10&start='+num+'&target=news&sort=sim';
	 //alert('aaaa');
	 var yqlURL = [
	               "http://query.yahooapis.com/v1/public/yql",
	               "?q=" + encodeURIComponent("select * from xml where url='"+xmlSource+"'"),
	               "&format=xml&callback=?"
	           ].join("");
	 
	  $.getJSON(yqlURL, function(data){
		  //alert(data);
		  console.log(data);
	      xmlContent = $(data.results[0]);
	      console.log(xmlContent);
	      
	      //얘군
	      console.log(xmlContent.html());
	      
	      console.log(xmlContent.html().toString());
	      //xmlDoc = $.parseXML('<?xml version="1.0" encoding="UTF-8"?><rss version="2.0">'+xmlContent.html().toString()+'</rss>');
	      //console.log(xmlDoc);
	      display(xmlContent);
	  });
 };

$(function() {
	var num=$('#num').val();
	var xmlSource = 'http://openapi.naver.com/search?key=b3d2a7db35b49bd4e457803646ab06e8&query=유기견&display=10&start='+num+'&target=news&sort=sim';
	 //alert('aaaa');
	 var yqlURL = [
	               "http://query.yahooapis.com/v1/public/yql",
	               "?q=" + encodeURIComponent("select * from xml where url='"+xmlSource+"'"),
	               "&format=xml&callback=?"
	           ].join("");
	 
	  $.getJSON(yqlURL, function(data){
		  //alert(data);
		  console.log(data);
	      xmlContent = $(data.results[0]);
	      console.log(xmlContent);
	      
	      //얘군
	      console.log(xmlContent.html());
	      
	      console.log(xmlContent.html().toString());
	      //xmlDoc = $.parseXML('<?xml version="1.0" encoding="UTF-8"?><rss version="2.0">'+xmlContent.html().toString()+'</rss>');
	      //console.log(xmlDoc);
	      display(xmlContent);
	  });
});
 
//  $('#search').click(function(){
//   $('table').remove();
//   num=1;
//   var searchWord = $('#category').val();
//   requestAjax(searchWord);
  
//  });
  
 
});
</script>

<!-- <h1>Naver Shopping</h1> -->
<!-- <span>Category:</span><input type="text" id="category"><input type="button" value="검색" id="search"> -->

<div id="news">
</div>

<input type="hidden" id="num" value="${num}">
<div id="news_page">
<h3>
<a href="news?num=1">1</a>
<a href="news?num=11">2</a>
<a href="news?num=21">3</a>
<a href="news?num=31">4</a>
<a href="news?num=41">5</a>
</h3>
</div>

