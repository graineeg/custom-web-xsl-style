<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet
        version="2.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
        xmlns:image="http://www.google.com/schemas/sitemap-image/1.1"
        xmlns:video="http://www.google.com/schemas/sitemap-video/1.1"
        xmlns:xhtml="http://www.w3.org/1999/xhtml">

    <xsl:output method="html" indent="yes" encoding="UTF-8"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>
					Mapa stránek
				</title>
				<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport" />
				<link rel="stylesheet" href="css/style.css" type="text/css" />
				<script src="js/test.js?v=1.5"></script>
				<script src="js/menu_mini.js?v=1.1"></script>
			</head>
			
			<body class="body__style">
				<header>
				<p class="center__header">
					<span>Bezplenkovka.cz obsahuje </span>
					<xsl:value-of select="count(sitemap:urlset/sitemap:url)"/>
					<span> Stránek</span>
				</p>
				<div id="menu_mini_ico">
					<span class="menu__header">MENU</span><img id="menuClick" onclick="menuMiniClick()" role="button" src="img/menu_mini.png?v=1.1" /></div>
				<div class="cistit"></div>
				</header>
				
		<div id="menu__block">
        <nav class="menu" id="menuBlock">
            <ul class="menu__seznam">
                <li class="menu__polozka">
                    <a class="menu__odkaz" href="../index.html">Bezplenkovka</a>
                </li>
                <li class="menu__polozka">
                    <a class="menu__odkaz" href="../Signaly.html">Signály</a>
                </li>
                <li class="menu__polozka">
                    <a class="menu__odkaz" href="../ryze_prakticky.html">Ryze prakticky</a>
                </li>
                <li class="menu__polozka">
                    <a class="menu__odkaz" href="../pomucky.html">Pomůcky a oblečení</a>
                </li>
                <li class="menu__polozka">
                    <a class="menu__odkaz" href="../kontakt.html">Kontakt</a>
                </li>
            </ul>
			<img class="menu__pic" src="img/baby_1.png" /> 
        </nav>
        </div>
        <div id="obsah">
				
				<xsl:apply-templates/>	

		</div>
		<div class="cistit"></div>
		
		        <footer>
			<p class="center__footer">Bezplenkovka</p>
        </footer>
					
				
				
			</body>
		</html>
		<!--<xsl:apply-templates/>-->
	</xsl:template>
	
	<xsl:template match="sitemap:urlset">
		<table class="siteMapTable">
					<thead>
						<tr>
							<th style="width:60px"></th>
							<th>URL</th>
							<th>Četnost&#160;změn</th>
							<th>Priorita</th>
							<th>Poslední&#160;změna</th>
						</tr>
					</thead>
					<tbody>
					<xsl:for-each select="sitemap:url">
						<tr>
							<xsl:variable name="loc">
                                <xsl:value-of select="sitemap:loc"/>
                            </xsl:variable>
                            <xsl:variable name="pno">
                                <xsl:value-of select="position()"/>
                            </xsl:variable>
                            <td class="centerText">
                                <xsl:value-of select="$pno"/>
                            </td>
							<td>
								<p>
									<a href="{$loc}">
                                        <xsl:value-of select="sitemap:loc"/>
									</a>
								</p>
								<xsl:apply-templates select="image:*"/>
							</td>
							<xsl:apply-templates select="sitemap:changefreq"/>
							<xsl:apply-templates select="sitemap:priority"/>
							<td class="centerText">
                                <xsl:value-of select="concat(substring(sitemap:lastmod, 0, 11), concat(' ', substring(sitemap:lastmod, 12, 5)), concat(' ', substring(sitemap:lastmod, 20, 6)))"/>
                            </td>
						</tr>
					</xsl:for-each>
                    </tbody>
				</table>
	</xsl:template>
	
	<xsl:template match="sitemap:loc|sitemap:lastmod|image:loc|image:caption|video:*">
    </xsl:template>

    <xsl:template match="sitemap:changefreq|sitemap:priority">
        <td class="centerText">
            <xsl:apply-templates/>
        </td>
    </xsl:template>
	
	<xsl:template match="image:image">
        <xsl:variable name="loc">
            <xsl:value-of select="image:loc"/>
        </xsl:variable>
        <p class="otherItem">
            <strong>Obrázek: </strong>
            <a href="{$loc}">
                <xsl:value-of select="image:loc"/> 
            </a>
            <xsl:if test="image:caption">
				&#160;
				<span>
                    <xsl:value-of select="image:caption"/>,
                </span>
            </xsl:if>
            <xsl:apply-templates/>
        </p>
    </xsl:template>
</xsl:stylesheet>