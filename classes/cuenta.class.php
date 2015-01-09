<script language="JavaScript">
function dame(ver,vor){
	this.vers=ver;
	this.vors=vor;
}
function getTime() {
now = new Date();
y2k = new Date(vers);
days = (now - y2k) / 1000 / 60 / 60 / 24;
daysRound = Math.floor(days);
hours = (now - y2k) / 1000 / 60 / 60 - (24 * daysRound);
hoursRound = Math.floor(hours);
minutes = (now - y2k) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
minutesRound = Math.floor(minutes);
seconds = (now - y2k) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
secondsRound = Math.round(seconds);
sec = (secondsRound == 1) ? " segundo" : " segundos";
min = (minutesRound == 1) ? " minuto" : " minutos y ";
hr = (hoursRound == 1) ? " hora" : " horas; ";
dy = (daysRound == 1) ? " día" : " d&iacute;as, "
maqueta = "<table><tr><td id='marquee0'>Evento</td><td id='marquee'>Días</td><td id='marquee'>Horas</td><td id='marquee'>Minutos</td><td id='marquee'>Segundos</td></tr><tr><td id='marquee3'>"+vors+"</td><td id='marquee2'>"+daysRound+"</td><td id='marquee2'>"+hoursRound+"</td><td id='marquee2'>"+minutesRound+"</td><td id='marquee2'>"+secondsRound+"</td></tr></table>";
//document.getElementById("counter").innerHTML = daysRound + dy + hoursRound + hr + minutesRound + min + secondsRound + sec;
document.getElementById("bann_bann-content").innerHTML =maqueta;
newtime = window.setTimeout("getTime();", 1000);
}
</script>