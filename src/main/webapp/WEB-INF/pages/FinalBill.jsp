<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Final Bill</title>
<style>
@media print {
  * {
    -webkit-print-color-adjust: exact !important; 
    print-color-adjust: exact !important;         
  }
}
@media print {
  .no-print {
    display: none !important;
  }
}
@media print {
  img {
    width: 100% !important;
    max-width: 700px !important;
    height: auto !important;
  }
}
table {
  width: 80%;
  margin: auto;
  border-collapse: collapse;
}
th, td {
  border: 1px solid #666;
  padding: 8px;
  text-align: left;
}
th {
  background-color: #f2f2f2;
  color: #000;
  font-weight: bold;
}
td[colspan="5"] {
  background-color: #fff9e6;
  font-weight: bold;
  padding: 3px 5px;
  height: 20px;
  line-height: 16px;
}
h2 {
  text-align: center;
  color: green;
}
.group-row {
  background-color: #f2f2f2;
  font-weight: bold;
  text-align: left;
  color: blue;
}
.brand-label {
  margin-left: 8px;
  display: inline-block;
  color: hotpink;
}
.group-row td {
  padding-left: 55px;
}
.no-border-table {
  border: none;
  border-collapse: collapse;
  background-color: transparent;
}
.no-border-table td {
  border: none;
  padding: 0;
  background-color: transparent;
}
</style>
</head>
<body>

<div style="text-align:center;">
  <img src="${pageContext.request.contextPath}/images/logo.png" alt="Company Logo"
       style="width: 100%; max-width: 1200px; height: auto;" />
</div>
<br>

<div style="display: flex; justify-content: space-between; align-items: flex-start; margin: 20px 160px 30px 160px; font-size: 16px; font-weight: bold;">
    <div>
        <div><span style="color: red;">${hospitalName}</span></div>
        <div><span style="color: blue;">${doctorName}</span></div>
        <div>${addears}</div>
    </div>
    <div>
        <div>Date: ${billDate}</div>
        <div>GDTIN: ${GDTIN}</div>
    </div>
</div>

<table id="billTable">
    <tr>
        <th>S.No</th>   
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
        <th>Total</th>
    </tr>

    <c:set var="sno" value="1" />
    <c:set var="totalAmount" value="0" />
    <c:set var="printedCopper" value="false" />
    <c:set var="printedOutlet" value="false" />
    <c:set var="printedAirDrier" value="false" />
    <c:set var="printedCompressors" value="false" />
    <c:set var="printedControlPanel" value="false" />
    <c:set var="printedBedHeadPanel" value="false" />
    <c:set var="printedCutoffValves" value="false" />
    
     <c:set var="printedEmergency" value="false" />
    <c:set var="printedBoilsKit" value="false" /> 
    <c:set var="printedFlowMeters" value="false" />
    <c:set var="printedVaccumJars" value="false" />
    <c:set var="printedVaccumTrale" value="false" />
    <c:set var="printedGasAlaram" value="false" />
    <c:set var="printedManifold" value="false" />
    <c:set var="printedRegulator" value="false" />

    <c:if test="${empty finalData}">
        <tr>
            <td colspan="5" style="color:red; font-weight:bold; text-align:center;">
                ⚠️ No materials available to generate bill.
            </td>
        </tr>
    </c:if>

    <c:forEach var="item" items="${finalData}">

        <c:if test="${item.materialType == 'Copper' && printedCopper == false}">
            <tr class="group-row">
                <td colspan="5">
                    Material Type: Copper
                <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
                </td>
            </tr>
            <c:set var="printedCopper" value="true" />
        </c:if>

        <c:if test="${item.materialType == 'Outlet' && printedOutlet == false}">
            <tr class="group-row">
                <td colspan="5">
                    Material Type: Outlet
                   <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
                </td>
            </tr>
            <c:set var="printedOutlet" value="true" />
        </c:if>

        <!-- Add other material types here with same pattern if needed -->


<!-- ----------------------------------------------------------------------------------------------------------- -->

<c:if test="${item.materialType == 'Cutoffvalves' && printedCutoffValves == false}">
    <tr class="group-row">
                <td colspan="5">
                    Material Type: Cut Off Valves
                     <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
                </td>
            </tr>
    <c:set var="printedCutoffValves" value="true" />
</c:if>
        
<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Airdrier' && printedAirDrier == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Air Drier 
              <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
        </td>
    </tr>
    <c:set var="printedAirDrier" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->

<c:if test="${item.materialType == 'Compressors' && printedCompressors == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Compressors 
            <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
        </td>
    </tr>
    <c:set var="printedCompressors" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Controlpanel' && printedControlPanel == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Control Panel 
            <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
        </td>
    </tr>
    <c:set var="printedControlPanel" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Bedheadpanel' && printedBedHeadPanel == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Bed Head Panel 
             <c:forEach var="brand" items="${item.brands}">
                    <span class="brand-label">Brand: ${brand}</span>
                </c:forEach>
        </td>
    </tr>
    <c:set var="printedBedHeadPanel" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->
<!-- ----------------------------------------------------------------------------------------------------------- -->

<c:if test="${item.materialType == 'Flowmeters' && printedFlowMeters == false}">        }

    <tr class="group-row">
  <td colspan="5">
    <span>Material Type: Flow Meters</span>&nbsp;
    
  </td>
</tr>
    <c:set var="printedFlowMeters" value="true" />
</c:if>

   
<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Vacuumjars' && printedVaccumJars == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Vacuum Jars        
            
        </td>
    </tr>
    <c:set var="printedVaccumJars" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Vacuumtrale' && printedVaccumTrale == false}">
    <tr class="group-row">
        <td  style="height: 50px;" colspan="5">
            Material Type: Vacuum Trale        
        </td>
    </tr>
    <c:set var="printedVaccumTrale" value="true" />
</c:if>

<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Gasalarm' && printedGasAlaram == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Gas Alarm       
        </td>
    </tr>
    <c:set var="printedGasAlaram" value="true" />
</c:if>
<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Manifold' && printedManifold == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Manifold        
        </td>
    </tr>
    <c:set var="printedManifold" value="true" />
</c:if>
<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Regulator' && printedRegulator == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Regulator        
        </td>
    </tr>
    <c:set var="printedRegulator" value="true" />
</c:if>
<!-- ----------------------------------------------------------------------------------------------------------- -->
<c:if test="${item.materialType == 'Boilskit' && printedBoilsKit == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Boils Kit        
        </td>
    </tr>
    <c:set var="printedBoilsKit" value="true" />
</c:if>
<!-- ----------------------------------------------------------------------------------------------------------- -->

<c:if test="${item.materialType == 'Emergencypoint' && printedEmergency == false}">
    <tr class="group-row">
        <td colspan="5">
            Material Type: Emergency Point        
        </td>
    </tr>
    <c:set var="printedEmergency" value="true" />
</c:if>
<!-- ----------------------------------------------------------------------------------------------------------- -->

        <tr>
            <td>${sno}</td>
            <td>${item.items}</td>
            <td>${item.quantity}</td>
            <td><fmt:formatNumber value="${item.price}" maxFractionDigits="2"/></td>
            <td><fmt:formatNumber value="${item.quantity * item.price}" maxFractionDigits="2"/></td>
        </tr>

        <c:set var="totalAmount" value="${totalAmount + (item.quantity * item.price)}" />
        <c:set var="sno" value="${sno + 1}" />
    </c:forEach>

    <tfoot>
        <tr>
            <td colspan="4" style="text-align: right; font-weight: bold;">Total Price (Before GST)</td>
            <td><fmt:formatNumber value="${totalAmount}" maxFractionDigits="2"/></td>
        </tr>
        <c:set var="gst" value="${totalAmount * 0.18}" />
        <tr>
            <td colspan="4" style="text-align: right; font-weight: bold;">GST @ 18%</td>
            <td><fmt:formatNumber value="${gst}" maxFractionDigits="2"/></td>
        </tr>
        <tr>
            <td colspan="4" style="text-align: right; font-weight: bold;">Grand Total (Including GST)</td>
            <td><fmt:formatNumber value="${totalAmount + gst}" maxFractionDigits="2"/></td>
        </tr>
    
    
     <tr class="no-border-table" width="100%">
        <td colspan="5" style="padding: 10px; text-align: justify;"><br>
            <h4 style="color: red; margin: 0;">TERMS & CONDITIONS</h4>
            <h5 style="color: black; margin: 0;">
                1. 1 Year Warranty In All Accessories <br>
                2. Payment 60% Done <br>
                3. After Material Delivery 20% <br>
                4. Completion Work 20%
            </h5>

            <h4 style="color: green; margin: 10px 0 0 0;">ACCOUNT DETAILS</h4>
            <h5 style="color: blue; margin: 0;">SREE VAISHNAVI ENTERPRISES</h5>
            <h5 style="color: black; margin: 0;">
                Account No : 141911010000002 <br>
                IFSC Code : UBIN0814199 <br>
                Branch : Kushaiguda, Ecil Post, <br>
                Nagarjuna Nagar Colony, Hyd-500062.
            </h5>
        </td>
    </tr>
    </tfoot>
</table>

<script src="https://cdn.sheetjs.com/xlsx-latest/package/dist/xlsx.full.min.js"></script>
<script>
function downloadExcel() {
    const table = document.getElementById('billTable');
    if (!table) {
        alert("Table not found!");
        return;
    }
    const workbook = XLSX.utils.table_to_book(table, { sheet: "Final Bill" });
    XLSX.writeFile(workbook, 'Final_Bill.xlsx');
}
</script>

<div class="no-print" style="text-align: center; margin-top: 20px;">
    <button onclick="window.print()" style="padding: 10px 25px;">🖨️ Print</button>
</div>

<div class="no-print" style="text-align: center; margin-top: 10px;">
    <button onclick="downloadExcel()" style="padding: 10px 25px;">⬇️ Download Excel (.xlsx)</button>
</div>

</body>
</html>
