<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0">
    <xsl:template match="/">
        <html>
            <head>
                <h1>Relevé Compte bancaire</h1>
            </head>
            <body>
                <li>RIB : <xsl:value-of select="releve/@RIB"/></li>
                <li>Date relevé : <xsl:value-of select="releve/dateReleve"/></li>
                <li>Solde : <xsl:value-of select="releve/solde"/></li>
                <li>Date début des opérations : <xsl:value-of select="releve/operations/@dateDebut"/></li>
                <li>Date fin des opérations : <xsl:value-of select="releve/operations/@dateFin"/></li>
                <li>
                <table border="1" width="80%">
                    <thead>Liste des opérations : </thead>
                    <tr>
                        <th>Type</th>
                        <th>Date</th>
                        <th>Montant</th>
                        <th>Description</th>
                    </tr>
                    <xsl:for-each select="releve/operations/operation">
                        <tr>
                        <td><xsl:value-of select="@type"/></td>
                        <td><xsl:value-of select="@date"/></td>
                        <td><xsl:value-of select="@montant"/></td>
                        <td><xsl:value-of select="@description"/></td>
                        </tr>
                    </xsl:for-each>
                </table>
                </li>    
                <li>Le total des operations de type debit : <xsl:value-of select="count(releve/operations/operation[@type='DEBIT'])"/></li>
                <li>Le total des operations de type credit : <xsl:value-of select="count(releve/operations/operation[@type='CREDIT'])"/></li>
                <li>
                    <table border="1" width="80%">
                                <thead>Liste des opérations de type credit : </thead>
                                <tr>
                                    <th>Type</th>
                                    <th>Date</th>
                                    <th>Montant</th>
                                    <th>Description</th>
                                </tr>
                                <xsl:for-each select="releve/operations/operation">
                                    <xsl:if test="@type='CREDIT'">
                                        <tr>
                                        <td><xsl:value-of select="@type"/></td>
                                        <td><xsl:value-of select="@date"/></td>
                                        <td><xsl:value-of select="@montant"/></td>
                                        <td><xsl:value-of select="@description"/></td>
                                        </tr>
                                    </xsl:if>
                                 </xsl:for-each>
                    </table>
                </li>
            </body>
        </html>
    </xsl:template>
</xsl:stylesheet>