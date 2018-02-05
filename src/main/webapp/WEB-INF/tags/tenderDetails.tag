<%-- 
    Document   : tenderDetails
    Created on : 7 Apr, 2014, 10:29:40 AM
    Author     : Buddha
--%>

<%@tag description="Tender Details" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%-- The list of normal or fragment attributes can be specified here: --%>
<%@attribute name="tender" description="attribute name" type="org.iitkgp.ccms.nib.NIB" required="true"%>
<%@attribute name="size" description="table size"  %>
<%@attribute name="title" description="Page Title" type="java.lang.String"%>

<%-- any content can be specified here e.g.: --%>
<!--tablecss-->
<table id="headerTable" class="tab" cellspacing="2" cellpadding="0" border="0" align="center" style="width: ${size}}">    
    <caption class="cssHeaderFont">${title}</caption>
    <tr>
        <td><label class="label4td">Tender No.</label></td><td>${tender.tenderDocNo}</td>
        <td><label class="label4td">Tender Date</label></td><td><fmt:formatDate pattern="dd/MM/yyyy" value="${tender.tenderDate}"/></td>
    </tr>
    <tr>
        <td><label class="label4td">Open Date</label></td><td><fmt:formatDate pattern="dd/MM/yyyy hh:mm a" value="${tender.bidOpenDate}"/></td>
        <td><label class="label4td">Closing Date</label></td><td><fmt:formatDate pattern="dd/MM/yyyy hh:mm a" value="${tender.saleCloseDate}"/></td>
    </tr>
    <tr>   
        <td><label class="label4td">Description</label></td>
        <td colspan="3">${tender.projectDesc}
        </td>
    </tr>
</table>
