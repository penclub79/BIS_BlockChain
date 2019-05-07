<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:dcterms="http://purl.org/dc/terms/">
<xsl:decimal-format name="digit" decimal-separator="." grouping-separator="," infinity="&#x221E;" minus-sign="-" NaN="0" percent="%" per-mille="&#x03BC;" zero-digit="0" digit="#" pattern-separator=";" />
<xsl:output method="html" doctype-system="http://www.w3.org/TR/html4/strict.dtd" doctype-public="-//W3C//DTD HTML 4.01//EN" indent="yes" />
<xsl:template match="/">
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<META NAME="ROBOTS" CONTENT="NOINDEX, NOFOLLOW" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<title> BOKSOO </title>
	<link rel="shortcut icon" href="http://www.3ksoftware.com/favicon.ico"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/soaxml_webformReset.css" rel="stylesheet"  media="screen"/>
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/uniform.default.css" rel="stylesheet" media="screen" />
	<link type="text/css" href="http://www.uccxml.com/xdrp/baseXML/lib/css/jquery-ui.1.10.3.smoothness.css" rel="stylesheet" media="screen" />
	<style></style>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxControl.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxCommon.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery-ui.1.10.3.min.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jquery.uniform.js"></script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/jSignature.custom.js"></script>
	<script type="text/javascript">
		function basexml_checktype() {
			$("input, textarea, select, button").uniform();
			$("input[type='radio']").each(function(){
				$(this).attr("disabled","true");
			});
			$("input[type='checkbox']").each(function(){
				$(this).attr("disabled","true");
			});
			$("select").each(function(){
				$(this).attr("disabled","true");
			});
		}
	</script>
	<script type="text/javascript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxFormForMongo.js"></script>
</head>
<body onLoad='javascript:basexml_checktype( );'>
<form name="BOKSOO">
<P>
<TABLE style="WIDTH: 820px" borderColor="#000000" cellSpacing="0" cellPadding="5" align="center" border="0">
<COLGROUP>
<COL width="700">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<TABLE style="WIDTH: 96%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="15%">
</COL>
<COL width="10%">
</COL>
<COL width="17%">
</COL>
<COL width="10%">
</COL>
<COL width="17%">
</COL>
<COL width="10%">
</COL>
<COL width="17%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD colSpan="7">
<P align="center">
<SPAN style="FONT-SIZE: 20pt">
<STRONG>
<SPAN style="FONT-SIZE: 18pt">복수/부전공 이수 취소 신청서
</SPAN>
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD rowSpan="3">
<P align="center">
<SPAN style="FONT-SIZE: 9pt">소 속
</SPAN>
</P>
</TD>
<TD rowSpan="2" colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/sosok"/>
<SPAN style="FONT-SIZE: 9pt">대학
</SPAN>
</P>
</TD>
<TD rowSpan="2" colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/hakboo"/>
<SPAN style="FONT-SIZE: 9pt">학부(과)
</SPAN>
</P>
</TD>
<TD rowSpan="2" colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/jungong"/>
<SPAN style="FONT-SIZE: 9pt">전공
</SPAN>
</P>
</TD>
</TR>
<TR>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">성 명
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/sungmyung"/>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">학 번
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/hakburn"/>
</P>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">학 년
</SPAN>
</P>
</TD>
<TD>
<P>
<xsl:value-of select="root/contents/haknyun"/>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">이수중인 복수 전공
</SPAN>
</P>
</TD>
<TD colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/isoodaehak"/>
<SPAN style="FONT-SIZE: 9pt">대학
</SPAN>
</P>
</TD>
<TD colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/isoohakboo"/>
<SPAN style="FONT-SIZE: 9pt">학부(과)
</SPAN>
</P>
</TD>
<TD colSpan="2">
<P align="left">
<xsl:value-of select="root/contents/isoojungong"/>
<SPAN style="FONT-SIZE: 9pt">전공
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
</P>
<P align="center">
</P>
<P align="center">
</P>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">사&#160;&#160;&#160;&#160;&#160;유
</SPAN>
</P>
<P align="center">
</P>
</TD>
<TD colSpan="6">
<P>
<xsl:apply-templates select="root/contents/sayou"/>&#160;
</P>
</TD>
</TR>
<TR>
<TD rowSpan="2" colSpan="7">
<P align="left">
<TABLE id="41" style="WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL width="15%">
</COL>
<COL width="28%">
</COL>
<COL width="18%">
</COL>
<COL width="39%">
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD colSpan="4">
<P>
<STRONG>[개인정보 이용 및 수집 동의서]
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD colSpan="4">
<SPAN style="FONT-SIZE: 9pt">한림대학교 복수전공 취소 및 부전공 전환 신청과 관련하여 아래와 같이 귀하의 개인정보를 수집·이용하
</SPAN>
</TD>
</TR>
<TR>
<TD colSpan="4">
<P>
<SPAN style="FONT-SIZE: 9pt">기 위하여 「개인정보 보호법」 제15조에 따라 관련 사항을 알려드리며 다음과 같은 목적을 위해 활용합니다.
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="right">■
</P>
</TD>
<TD>
<SPAN style="FONT-SIZE: 9pt">개인정보의 수집·이용 목적 :
</SPAN>
</TD>
<TD colSpan="2">
<SPAN style="FONT-SIZE: 9pt">복수 전공 취소 및 부전공 전환 신청 접수 목적
</SPAN>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
<TD>
</TD>
</TR>
<TR>
<TD>
<P align="right">■
</P>
</TD>
<TD colSpan="2">
<P>
<SPAN style="FONT-SIZE: 9pt">
<SPAN style="FONT-SIZE: 9pt">한림대학교가 수집·이용할 개인정보 항목(필수항목) :
</SPAN>
</SPAN>
</P>
</TD>
<TD>
<SPAN style="FONT-SIZE: 9pt">소속대학, 학부(과), 전공, 성명, 학번,&#160;복수전공
</SPAN>
</TD>
</TR>
<TR>
<TD>
<P align="right">
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>
<SPAN style="FONT-SIZE: 9pt">대학, 학부(과), 전공, 사유
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="right">■
</P>
</TD>
<TD colSpan="2">
<P>
<SPAN style="FONT-SIZE: 9pt">한림대학교가 수집·이용할 개인정보 항목(선택항목) :
</SPAN>
</P>
</TD>
<TD>
<P>
<SPAN style="FONT-SIZE: 9pt">학년
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="right">■
</P>
</TD>
<TD>
<P>
<SPAN style="FONT-SIZE: 9pt">개인정보의 보유, 이용기간 :
</SPAN>
</P>
</TD>
<TD colSpan="2">
<P>
<SPAN style="FONT-SIZE: 9pt">수집·이용 동의일로부터 준영구
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="right">■
</P>
</TD>
<TD colSpan="3">
<P>
<SPAN style="FONT-SIZE: 9pt">신청자는 개인정보 수집을 거부할 수 있는 권리가 있지만, 이 경우 복수전공 취소 및 부전공전환 신
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD colSpan="3">
<P>
<SPAN style="FONT-SIZE: 9pt">청에 불이익이 발생할 수 있습니다.
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
<TD>
<P>&#160;
</P>
</TD>
</TR>
<TR>
<TD>
</TD>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">필수항목 수집동의
</SPAN>
</P>
</TD>
<TD colSpan="2">
<INPUT type="radio" value="1" name="root/contents/fillsoo"/>
<SPAN style="FONT-SIZE: 9pt">동의 함
</SPAN>
<INPUT type="radio" value="1" name="root/contents/fillsoo"/>
<SPAN style="FONT-SIZE: 9pt">동의하지 않음
</SPAN>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<HR style="HEIGHT: 2px; WIDTH: 100%; BACKGROUND-COLOR: #000000"/>
<TABLE id="20190430_174021" style="HEIGHT: 360px; WIDTH: 96%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<STRONG>
<U>
<EM>
<SPAN style="FONT-SIZE: 9pt">'부전공 전환의 경우 하단부 기입
</SPAN>
</EM>
</U>
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD>
<P>
<STRONG>
<EM>
<U>
<SPAN style="FONT-SIZE: 9pt">'협동전공의 경우 전공명만 기입
</SPAN>
</U>
</EM>
</STRONG>
</P>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
<P align="center">위와 같이 (복수/부)전공을 취소 하고자 신청서를 제출합니다.
</P>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
<P>&#160;&#160;&#160;&#160;&#160;
<xsl:value-of select="root/contents/nalja"/>
</P>
<P>
<SPAN style="FONT-SIZE: 8pt">
<STRONG>&#160;&#160;&#160;&#160;&#160;&#160;(클릭 시 날자 입력)
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>&#160;&#160;&#160;&#160;&#160;신청자&#160;
<xsl:value-of select="root/contents/shinchungja"/>
</TD>
</TR>
<TR>
<TD>&#160;&#160;&#160;&#160;&#160;서명
</TD>
</TR>
<TR>
<TD>&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;
<DIV id="div_root_contents_shinchungjasign" class="signature" style="HEIGHT: 100px; WIDTH: 30%; POSITION: relative">
</DIV>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 18pt">
<STRONG>한림대학교 총장 귀하
</STRONG>
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
</TD>
</TR>
</TBODY>
</TABLE>
<P>
<TABLE id="3" style="WIDTH: 96%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="1">
<COLGROUP>
<COL width="21%">
</COL>
<COL width="75%">
</COL>
</COLGROUP>
<TBODY id="3">
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">부전공 전환
</SPAN>
</P>
</TD>
<TD>
<P>
<SPAN style="FONT-SIZE: 9pt">본인은 취소한 복수전공
</SPAN>
<xsl:value-of select="root/contents/junhwan"/>
<SPAN style="FONT-SIZE: 9pt">을 부전공으로 전환하고자 합니다.
</SPAN>
</P>
</TD>
</TR>
<TR>
<TD>
<P align="center">
<SPAN style="FONT-SIZE: 9pt">전산반영 확인
</SPAN>
</P>
</TD>
<TD>
<P>&#160;
</P>
<DIV id="div_root_contents_junsanbanyoung" class="signature" style="HEIGHT: 100px; WIDTH: 30%; POSITION: relative">
</DIV>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>
<TABLE style="HEIGHT: 30px; WIDTH: 100%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<COL>
</COL>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>&#160;
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>
<TABLE style="WIDTH: 96%" borderColor="#000000" cellSpacing="0" cellPadding="3" align="center" border="0">
<COLGROUP>
<STRONG>
<COL>
</COL>
</STRONG>
</COLGROUP>
<TBODY>
<TR>
<TD>
<P>
<STRONG>
<SPAN style="FONT-SIZE: 10pt">*매 학기 개강 후 30일 이내 접수 가능
</SPAN>
</STRONG>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
<P>&#160;
</P>
</TD>
</TR>
<TR>
</TR>
</TBODY>
</TABLE>
</P>
</TD>
</TR>
</TBODY>
</TABLE>
</P>
</form>
<script language="JavaScript" src="http://www.uccxml.com/xdrp/baseXML/lib/scripts/bxXsl.js"></script>
	<div class="docBtn_list">
		<input type="button" value="Update" onclick="javascript:bxfXmlModifyMongodb();" /> &#160;
		<input type="button" value="List" onclick="javascript:bxfXmlListMongodb();" /> &#160;
		<input type="button" value="Search" onclick="javascript:bxfXmlSearchMongodb();" />
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$signImg = $("#div_root_contents_shinchungjasign");
	sign = new Image();
	sign.src = '<xsl:value-of select="root/contents/shinchungjasign"/>';
	$(sign).appendTo($signImg);
$signImg = $("#div_root_contents_junsanbanyoung");
	sign = new Image();
	sign.src = '<xsl:value-of select="root/contents/junsanbanyoung"/>';
	$(sign).appendTo($signImg);
	});
</script>
</body>
</html>
</xsl:template>
<xsl:template match="BR"><br/></xsl:template>
<xsl:template match="br"><br/></xsl:template>
<xsl:template match="li"><li/></xsl:template>
<xsl:template match="LI"><LI/></xsl:template>
<xsl:template match="A">
<xsl:element name="a">
	<xsl:attribute name="href" ><xsl:value-of select="@href"/></xsl:attribute>
	<xsl:attribute name="target"><xsl:value-of select="@target"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="FONT">
<xsl:element name="FONT">
	<xsl:attribute name="color"><xsl:value-of select="@color"/></xsl:attribute>
	<xsl:attribute name="title"><xsl:value-of select="@title"/></xsl:attribute>
	<xsl:attribute name="face"><xsl:value-of select="@face"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="id"><xsl:value-of select="@id"/></xsl:attribute>
	<xsl:attribute name="class"><xsl:value-of select="@class"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="IMG">
<xsl:element name="img">
	<xsl:attribute name="src"><xsl:value-of select="@src"/></xsl:attribute>
	<xsl:attribute name="style"><xsl:value-of select="@style"/></xsl:attribute>
	<xsl:attribute name="align"><xsl:value-of select="@align"/></xsl:attribute>
	<xsl:attribute name="hspace"><xsl:value-of select="@hspace"/></xsl:attribute>
	<xsl:attribute name="vspace"><xsl:value-of select="@vspace"/></xsl:attribute>
	<xsl:attribute name="border"><xsl:value-of select="@border"/></xsl:attribute>
	<xsl:attribute name="alt"><xsl:value-of select="@alt"/></xsl:attribute>
	<xsl:value-of select="."/>
</xsl:element>
</xsl:template>
<xsl:template match="HR"><hr/></xsl:template>
</xsl:stylesheet>
