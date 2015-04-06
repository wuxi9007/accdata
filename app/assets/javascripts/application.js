// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

var pass=new Array()
var t3=""
var lim=7
pass[0]="aV5IDSl1uwBeVtc"
pass[1]="9pzaojpbT8XgOyv"
pass[2]="OOibZpCBpFKeUMi"
pass[3]="G3r9236DqMWiyPo"
pass[4]="7tRggB7OEsQN3Nxd"
pass[5]="17tRggB7OEsQN3Nx"

//configure extension to reflect the extension type of the target web page (ie: .htm or .html)
var extension=".html"
var enablelocking=0
var numletter="0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
var temp3=''
var cur=0


function max(which){
return (pass[Math.ceil(which)+(3&15)].substring(0,1))
}

function testit(input){
temp=numletter.indexOf(input)
var temp2=temp^parseInt(pass[phase1-1+(1|3)].substring(0,2))
temp2=numletter.substring(temp2,temp2+1)
return (temp2)
}


function submitentry(){
$(".kickout").css("display","none")
t3=''
verification=document.password1.password2.value
phase1=Math.ceil(Math.random())-6+(2<<2)
var indicate=true
for (i=(1&2);i<window.max(Math.LOG10E);i++)
t3+=testit(verification.charAt(i))
for (i=(1&2);i<lim;i++){
if (t3.charAt(i)!=pass[phase1+Math.round(Math.sin(Math.PI/2)-1)].charAt(i))
indicate=false
}
if (verification.length!=window.max(Math.LOG10E))
indicate=false;
if (indicate)
$(".hidden").css("display","block")
else
alert("Invalid password. Please try again")
}
