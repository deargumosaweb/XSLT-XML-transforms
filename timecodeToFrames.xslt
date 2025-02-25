<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes" omit-xml-declaration="yes" />
    <!-- Convert frames to timecode -->
    <xsl:template name="framesToTimecode">
        <xsl:param name="frames" />
        <xsl:param name="fps" select="25" />
        <xsl:variable name="totalSeconds" select="floor($frames div $fps)" />
        <xsl:variable name="framesPart" select="$frames mod $fps" />
        <xsl:variable name="seconds" select="$totalSeconds mod 60" />
        <xsl:variable name="totalMinutes" select="$totalSeconds div 60" />
        <xsl:variable name="minutes" select="$totalMinutes mod 60" />
        <xsl:variable name="hours" select="$totalMinutes div 60" />
        <xsl:value-of select="format-number($hours, '00')" />
        <xsl:text>:</xsl:text>
        <xsl:value-of select="format-number($minutes, '00')" />
        <xsl:text>:</xsl:text>
        <xsl:value-of select="format-number($seconds, '00')" />
        <xsl:text>:</xsl:text>
        <xsl:value-of select="format-number($framesPart, '00')" />
    </xsl:template>
    <!-- Convert timecode to frames -->
    <xsl:template name="timecodeToFrames">
        <xsl:param name="timecode" />
        <xsl:param name="fps" select="25" />
        <xsl:variable name="hours" select="substring-before($timecode, ':')" />
        <xsl:variable name="remaining" select="substring-after($timecode, ':')" />
        <xsl:variable name="minutes" select="substring-before($remaining, ':')" />
        <xsl:variable name="remaining" select="substring-after($remaining, ':')" />
        <xsl:variable name="seconds" select="substring-before($remaining, ':')" />
        <xsl:variable name="frames" select="substring-after($remaining, ':')" />
        <xsl:value-of select="(($hours * 3600 + $minutes * 60 + $seconds) * $fps) + $frames" />
    </xsl:template>
    <!-- Fix for timecodeToFrames: -->
    <xsl:variable name="hours" select="number(substring-before($timecode, ':'))" />
    <xsl:choose>
        <xsl:when test="not($hours)"><xsl:value-of select="0"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$hours"/></xsl:otherwise>
    </xsl:choose>
    <xsl:variable name="minutes" select="number(substring-before(substring-after($timecode, ':'), ':'))" />
    <xsl:variable name="seconds" select="number(substring-before(substring-after(substring-after($timecode, ':'), ':'), ':'))" />
    <xsl:variable name="frames" select="number(substring-after(substring-after(substring-after($timecode, ':'), ':'), ':'))" />
    <!-- Ensure input values exist: -->
    <!-- Example -->
    <xsl:variable name="hours" select="number(substring-before($timecode, ':'))" />
    <xsl:choose>
        <xsl:when test="not($hours)"><xsl:value-of select="0"/></xsl:when>
        <xsl:otherwise><xsl:value-of select="$hours"/></xsl:otherwise>
    </xsl:choose>
  
</xsl:stylesheet>
