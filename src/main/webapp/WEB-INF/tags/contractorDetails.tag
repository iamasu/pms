<%-- 
    Document   : contractorDetails
    Created on : May 12, 2014, 7:15:40 PM
    Author     : mmc-asu
--%>

<%@tag description="Tender and vendor Details As Header" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="tenVenHdr" description="attribute Name" type="org.iitkgp.ccms.common.TenderDetailsHeader"%>
<%@attribute name="size" description="table size"  %>
<%@attribute name="title" description="Page Title" type="java.lang.String"%>
<%-- any content can be specified here e.g.: --%>

<table class="div-body" cellspacing="2" cellpadding="0" border="0" align="center" style="width: ${size}">
    <caption class="cssHeaderFont">${title}</caption>
    <colgroup><col width="20%"/><col width="30%"/><col width="20%"/><col width="30%"/></colgroup>
    <tr>
        <th >Loa No. </th><td>${tenVenHdr.tenderDocNo}</td>
        <th >Date</th><td><fmt:formatDate pattern="dd/MM/yyyy" value="${tenVenHdr.tenderDate}"/></td>
    </tr>
    <tr>
        <th >Description</th><td colspan="3">${tenVenHdr.tenderdtls}</td>
    </tr>
    <c:if test="${tenVenHdr.tcDisplay!=null}">
        <tr>
            <th  >Contractor Name</th><td colspan="3">${tenVenHdr.tcDisplay.companyName} </td>
        </tr>
    </c:if>
</table>