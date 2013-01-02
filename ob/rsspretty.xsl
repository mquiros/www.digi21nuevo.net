<?xml version='1.0' encoding='UTF-8'?>
<!-- Style RSS so that it is readable. -->
<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:dc="http://purl.org/dc/elements/1.1/"
	xmlns:msdndomain="http://msdn.microsoft.com/aboutmsdn/rss/domains"
	version="1.0"
>

<xsl:template match='/rss'>
	<html>
		<head>
			<title>Semiilla RSS para <xsl:value-of select='channel/title'/></title>
			<style type="text/css">
				body { margin-top:10px; margin-bottom:25px; text-align:center; font-family: verdana, sans-serif; font-size: 80%; line-height: 1.45em; } 
				#block { margin:0px auto; width:600px; text-align:left; }
				p { padding-top: 0px; margin-top: 0px; }
				h1 { font-size: 120%; padding-bottom: 0px; margin-bottom: 0px; }
				h2 { font-size: 100%; margin-bottom: 0px; } 
			</style>
		</head>
		<body>
			<div id='block'>
			<h1>Semilla RSS para <xsl:value-of select='channel/title'/></h1>
			<p>Suscribiéndose a esta semilla RSS (Really Simple Syndication) desde <a href='{channel/link}'>Digi21</a>, los usuarios avanzados pueden obtener nuevos títulos y presentaciones preliminares de artículos entregados por un lector de RSS ó un agregador. RSS ofrece comodidad porque te puedes suscribir a semillas de muchas fuentes diferentes, y visualizar títulos de todas las fuentes a la vez en una lista. Puedes navegar rápidamente la lista de nuevos contenidos sin tener
			que visitar cada sitio para buscar nueva información de interés.</p>
<!--			<p>For more information on subscribing to this feed and finding an aggregator, see <a href="http://msdn.microsoft.com/aboutmsdn/rss">About MSDN's RSS Feeds</a>.</p>-->
			<hr />
			<xsl:apply-templates select='channel/item' />
			</div>
		</body>
	</html>
</xsl:template>

<xsl:template match='item'>
		<h2>
			<a href='{link}'>
				<xsl:value-of select='title'/>
			</a>
		</h2>
		<p>
			<xsl:value-of select='description' disable-output-escaping='yes' />
			<br />
			<strong>Author: </strong><xsl:value-of select='dc:creator' />
			<br />
			<strong>Published Date: </strong><xsl:value-of select='pubDate' />
			<br />
			<font color='gray'>
		<xsl:for-each select='category'>
			<xsl:value-of select='.' /> | 
		</xsl:for-each>
			</font>
			<br />
<!--			<a href='{link}'>Read the full item</a>.-->
		</p>
</xsl:template>

<xsl:template match='category'>
		<xsl:value-of select='.'/> |  
</xsl:template>


</xsl:stylesheet>