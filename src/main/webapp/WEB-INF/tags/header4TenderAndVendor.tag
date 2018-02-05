<%-- 
    Document   : header4TenderAndVendor
    Created on : Apr 17, 2014, 9:06:26 AM
    Author     : ratul
--%>

<%@tag description="Tender and vendor Details As Header" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="tenVenHdr" description="attribute Name" type="org.iitkgp.ccms.common.TenderDetailsHeader"%>
<%@attribute name="size" description="table size"  %>
<%@attribute name="title" description="Page Title" type="java.lang.String"%>
<%-- any content can be specified here e.g.: --%>

<table class="div-body" style="width: ${size}">
    <caption class="cssHeaderFont">${title}</caption>
    <colgroup><col width="10%"/> <col width="20%"/><col width="10%"/><col width="20%"/><col width="10%"/><col width="20%"/></colgroup>
    <thead>
        <tr>
            <th >Tender No. </th><td style="text-align: left;background-color: #f9f9f9">${tenVenHdr.tenderDocNo}</td>
            <th >Tender Date</th><td style="text-align: left;background-color: #f9f9f9"><fmt:formatDate pattern="dd/MM/yyyy" value="${tenVenHdr.tenderDate}"/></td>
            <th >Bid Open Date</th><td colspan="3" style="text-align: left;background-color: #f9f9f9"><fmt:formatDate pattern="dd/MM/yyyy hh:mm a" value="${tenVenHdr.bidOpenDate}"/></td>
        </tr>
        <tr>
            <!--<th >Close Date</th><td colspan="3"><fmt:formatDate pattern="dd/MM/yyyy hh:mm a" value="${tenVenHdr.bidOpenDate}"/></td>-->
    <!--        <th >Open Date</th><td><fmt:formatDate pattern="dd/MM/yyyy" value="${tenVenHdr.saleStartDate}"/></td>
            <th >Close Date</th><td><fmt:formatDate pattern="dd/MM/yyyy" value="${tenVenHdr.saleCloseDate}"/></td>-->
        </tr>
        <tr>
            <th >Description</th><td colspan="5">${tenVenHdr.tenderdtls}</td>
        </tr>
        <c:if test="${tenVenHdr.tcDisplay!=null}">
            <tr>
                <th  >Bidder Name</th><td colspan="3">${tenVenHdr.tcDisplay.companyName} </td>
                <th  >Bidder Address</th><td >${tenVenHdr.tcDisplay.city},${tenVenHdr.tcDisplay.country}</td>
            </tr>
        </c:if>
    </thead>
</table>
