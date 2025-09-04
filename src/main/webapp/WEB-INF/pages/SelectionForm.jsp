<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Material Selection</title>
<style>
    table {
        margin: auto;
        border-collapse: collapse;
        width: 80%;
    }
    th, td {
        border: 1px solid #666;
        padding: 8px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
    .btn-area {
        text-align: center;
        margin: 20px 0;
    }
    .brand-checkboxes label {
        margin-right: 20px;
        display: inline-block;
    }
    
    /*-------------------------------------------*/
    
    /* Overall page styling */
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #f9f9f9;
    margin: 20px;
    color: #333;
}

/* Form container */
form {
    max-width: 900px;
    margin: 0 auto;
    background: #fff;
    padding: 25px 30px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}

/* Material tables */
table.material-table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    border-radius: 6px;
    overflow: hidden;
}

/* Table header row */
table.material-table thead tr {
    background-color: #007acc;
    color: #fff;
    font-weight: 600;
    text-align: left;
}

/* Table header and data cells */
table.material-table th, 
table.material-table td {
    padding: 12px 15px;
    border: 1px solid #ddd;
}

/* Zebra striping on rows */
table.material-table tbody tr:nth-child(even) {
    background-color: #f7f9fc;
}

/* Hover effect on rows */
table.material-table tbody tr:hover {
    background-color: #e3f2fd;
}

/* Center checkboxes inside table cells */
table.material-table td input[type="checkbox"] {
    display: block;
    margin: 0 auto;
    cursor: pointer;
}

/* Number inputs styling */
table.material-table td input[type="number"] {
    width: 70px;
    padding: 5px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 0.9rem;
}

/* Radio buttons group container */
div[type="radio"], .material-type-select {
    text-align: center;
    margin-bottom: 20px;
}

/* Radio label styling */
input[name="materialTypeSelect"] label {
    display: inline-block;
    margin-right: 25px;
    font-weight: 600;
    cursor: pointer;
    color: #007acc;
    transition: color 0.3s ease;
}

input[name="materialTypeSelect"] label:hover {
    color: #005fa3;
}

/* Brand checkboxes container */
.brand-checkboxes {
    text-align: center;
    margin-bottom: 20px;
}

.brand-checkboxes label {
    margin-right: 20px;
    display: inline-block;
    font-weight: 500;
    cursor: pointer;
    color: #444;
}

/* Buttons area */
.btn-area {
    text-align: center;
    margin: 30px 0;
}

.btn-area button {
    background-color: #007acc;
    border: none;
    color: white;
    padding: 12px 28px;
    font-size: 1rem;
    border-radius: 6px;
    cursor: pointer;
    margin: 0 10px;
    transition: background-color 0.3s ease;
}

.btn-area button:hover {
    background-color: #005fa3;
}

/* Doctor, Hospital, Date input area */
.info-inputs {
    text-align: center;
    margin-bottom: 25px;
}

.info-inputs label {
    font-weight: 600;
    margin: 0 10px 0 0;
    display: inline-block;
    color: #333;
}

.info-inputs input[type="text"],
.info-inputs input[type="date"] {
    padding: 6px 10px;
    margin-right: 15px;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
    width: 150px;
}

/* Link at the bottom */
div.add-new-items {
    text-align: center;
    margin-top: 20px;
}

div.add-new-items a {
    text-decoration: none;
    color: #007acc;
    font-weight: 600;
    font-size: 1.1rem;
    transition: color 0.3s ease;
}

div.add-new-items a:hover {
    color: #005fa3;
}

/* Responsive for smaller screens  @media (max-width: 768px) {*/

@media (max-width: 768px) {
    form {
        padding: 15px 20px;
    }
    table.material-table th, 
    table.material-table td {
        padding: 8px 10px;
    }
    .info-inputs input[type="text"],
    .info-inputs input[type="date"] {
        width: 100px;
        margin-bottom: 10px;
    }
    .info-inputs label, 
    .brand-checkboxes label,
    .material-type-select label {
        display: block;
        margin-bottom: 8px;
    }
    .btn-area button {
        padding: 10px 20px;
        margin: 8px 0;
        width: 100%;
    }
    
    form {
    }
}
    
</style>
</head>
<body>

<form action="${pageContext.request.contextPath}/PostSelectedData" method="post">

<div style="text-align:center; margin-bottom: 15px;">
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('copperTable')" /> Copper</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('outletTable')" /> Outlet</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('airDrierTable')" /> Air Drier</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('compressorsTable')" /> Compressors</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('controlPanelTable')" /> Control Panel</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('bedHeadPanelTable')" /> Bed Head Panel</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('cutOffValvesTable')" /> Cutoff Valves</label><br> <br> 
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('emergencyServicePointTable')" /> Emergency Point</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('boilsConvertionkitTable')" /> Boils Kit</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('flowMetersTable')" /> Flow Meters</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('vaccumJarsTable')" /> Vacuum Jars</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('vaccumTraleTable')" /> Vacuum Trale</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('gasAlaramTable')" /> Gas Alarm</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('maniFoldTable')" /> Manifold</label><br>
    <label><input type="radio" name="materialTypeSelect" onclick="showTable('regulatorTable')" /> Regulator</label><br>
    
</div>

<!-- Brand checkboxes -->
<!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
<div id="copperBrandDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select Copper Brand:</label>   
    <c:forEach var="item" items="${brandNames['Copper']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="copperBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<!-- Copper Table -->
<table id="copperTable" class="material-table" style="display:none;">
    <thead>
        <tr><th colspan="5">Copper Table</th></tr>
        <tr>
            <th>S.No</th>
            <th>Select</th>
            <th>Item</th>
            <th>Quantity</th>
            <th>Price</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Copper}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="copperMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="copperQuantities" /></td>
                <td><input type="number" name="copperPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
    </tbody>
</table>

<!-- Outlet Table -->
<div id="OutletBrandDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select Outlet Brand:</label>   
    <c:forEach var="item" items="${brandNames['Outlet']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="outletBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<table id="outletTable"  class="material-table" style="display:none;">
    <tr><th colspan="5">Outlet Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Outlet}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="outletMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="outletQuantities" /></td>
                <td><input type="number" name="outletPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- AirDrier Table -->
<div id="airDrierDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select airDrier Brand:</label>   
    <c:forEach var="item" items="${brandNames['AirDrier']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="airDrierBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<table id="airDrierTable"  class="material-table" style="display:none;">
    <tr><th colspan="5">AirDrier Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Airdrier}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="airDrierMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="airDrierQuantities" /></td>
                <td><input type="number" name="airDrierPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- Compressors Table -->
<div id="compressorsDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select Compressors Brand:</label>   
    <c:forEach var="item" items="${brandNames['Compressors']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="compressorsBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<table id="compressorsTable"  class="material-table" style="display:none;">
    <tr><th colspan="5">Compressors Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Compressors}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="compressorsMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="compressorsQuantities" /></td>
                <td><input type="number" name="compressorsPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- ControlPanel Table -->
<div id="controlPanelDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select controlPanel Brand:</label>   
    <c:forEach var="item" items="${brandNames['ControlPanel']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="controlPanelBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>


<table id="controlPanelTable"  class="material-table" style="display:none;">
    <tr><th colspan="5">ControlPanel Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Controlpanel}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="controlPanelMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="controlPanelQuantities" /></td>
                <td><input type="number" name="controlPanelPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- BedHeadPanel Table -->
<div id="bedHeadPanelDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select controlPanel Brand:</label>   
    <c:forEach var="item" items="${brandNames['BedHeadPanel']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="bedHeadPanelBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>


<table id="bedHeadPanelTable"  class="material-table" style="display:none;">
    <tr><th colspan="5">BedHeadPanel Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Bedheadpanel}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="bedHeadPanelMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="bedHeadPanelQuantities" /></td>
                <td><input type="number" name="bedHeadPanelPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- Cutoffvalves Table -->
<div id="cutoffvalvesDiv" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select cutoffvalvesDiv Brand:</label>   
    <c:forEach var="item" items="${brandNames['Cutoffvalves']}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="CutoffvalvesBrands" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<table id="cutOffValvesTable">
    <tr><th colspan="5">Cutoffvalves Table</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Cutoffvalves}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="cutoffvalvesMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="cutoffvalvesQuantities" /></td>
                <td><input type="number" name="cutoffvalvesPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>


<!-- FlowMeters Table -->
<div id="brandsAll" style="display:none; text-align:center; margin-bottom: 15px;">
    <label>Select  Brands:</label>   
    <c:forEach var="item" items="${brandNames}">
        <label style="margin-right: 20px;">
            <input type="checkbox" name="brandsAll" value="${item}" />
            ${item}
        </label>
    </c:forEach>
</div>

<table id="flowMetersTable" class="material-table" style="display:none;">
    <tr><th colspan="5">Flow Meters</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Flowmeters}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="flowMetersMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="flowMetersQuantities" /></td>
                <td><input type="number" name="flowMetersPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- VacuumJars Table -->
<table id="vaccumJarsTable" class="material-table" style="display:none;">
    <tr><th colspan="5">Vacuum Jars</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Vaccumjars}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="vaccumJarsMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="vaccumJarsQuantities" /></td>
                <td><input type="number" name="vaccumJarsPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- VaccumTrale Table -->
<table id="vaccumTraleTable" class="material-table" style="display:none;">
    <tr><th colspan="5">Vacuum Trale</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Vaccumtrale}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="accumTraleMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="accumTraleQuantities" /></td>
                <td><input type="number" name="accumTralePrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>


<!-- GasAlaram Table -->
<table id="gasAlaramTable" class="material-table" style="display:none;">
    <tr><th colspan="5">Gas Alarm</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Gasalaram}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="gasAlaramMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="gasAlaramQuantities" /></td>
                <td><input type="number" name="gasAlaramPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- Manifold Table -->
<table id="maniFoldTable" class="material-table" style="display:none;">
    <tr><th colspan="5">Manifold</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Manifold}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="maniFoldMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="maniFoldQuantities" /></td>
                <td><input type="number" name="maniFoldPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>
 <!-- -------------------------------------------------------------------------------------------------------------------------------------------------  -->
         <!-- ✅ regulator Table -->
<table id="regulatorTable" class="material-table" style="display:none;">
    <tr><th colspan="5">regulator </th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
 <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Regulator}">        <tr>
            <td>${s.index + 1}</td>
            <td><input type="checkbox" name="regulatorMaterials" value="${item}" /></td>
            <td>${item}</td>
            <td><input type="number" name="regulatorQuantities" /></td>
            <td><input type="number" name="regulatorPrices" /></td>
        </tr>
    </c:forEach>
    </c:forEach>
</table>  
 <!-- -------------------------------------------------------------------------------------------------------------------------------------------------  -->
        <!-- BoilsConvertionkit Table -->
<table id="boilsConvertionkitTable" class="material-table" style="display:none;">
    <tr><th colspan="5">BoilsConvertionkit</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.BoilsConvertionkit}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="boilsConvertionkitMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="boilsConvertionkitQuantities" /></td>
                <td><input type="number" name="boilsConvertionkitPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

<!-- EmergencyServicePoint Table -->
<table id="emergencyServicePointTable" class="material-table" style="display:none;">
    <tr><th colspan="5">EmergencyServicePointTable</th></tr>
    <tr>
        <th>S.No</th>
        <th>Select</th>
        <th>Item</th>
        <th>Quantity</th>
        <th>Price</th>
    </tr>
    <c:forEach var="med" items="${FindAll}">
        <c:forEach var="item" items="${med.entry.Emergencyservicepoint}" varStatus="s">
            <tr>
                <td>${s.index + 1}</td>
                <td><input type="checkbox" name="emergencyMaterials" value="${item}" /></td>
                <td>${item}</td>
                <td><input type="number" name="emergencyQuantities" /></td>
                <td><input type="number" name="emergencyPrices" /></td>
            </tr>
        </c:forEach>
    </c:forEach>
</table>

  
  <!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->

    <!-- ------------------------------------------------------------------------------------------------------------------------------------------ -->
  
  <br>
       <!-- Doctor, Hospital, Date Info -->
<div style="text-align:center; margin-bottom: 20px;">
    <label>Doctor Name:</label>
    <input type="text" name="doctorName"  />
    &nbsp;&nbsp;&nbsp;
    <label>Hospital Name:</label>
    <input type="text" name="hospitalName"  />
    &nbsp;&nbsp;&nbsp;
    <label>Date:</label>
    <input type="date" name="billDate"  />
    &nbsp;&nbsp;&nbsp;
    <label>Addears:</label>
    <input type="text" name="addears"  />
    &nbsp;&nbsp;&nbsp;
    <label>GDTIN:</label>
<input type="text" name="GDTIN"  />
</div>


<!-- Buttons -->
<div class="btn-area">
    <button type="submit">Submit</button>
    <button type="button" onclick="resetForm()">Reset</button>
</div>

</form>

<!-- Add New Items Link -->
<div style="text-align:center; margin-top: 10px;">
    <a href="${pageContext.request.contextPath}/addNew">Add New Items</a>
</div>

<script>
    const tableIds = [
        'copperTable', 'outletTable','airDrierTable','compressorsTable','controlPanelTable',
        'bedHeadPanelTable','cutOffValvesTable', 'flowMetersTable', 'vaccumJarsTable','vaccumTraleTable',
        'gasAlaramTable','maniFoldTable','regulatorTable','boilsConvertionkitTable','emergencyServicePointTable'
    ];

    const brandDivIds = [
        'copperBrandDiv', 'OutletBrandDiv','cutoffvalvesDiv','airDrierDiv','compressorsDiv',
        'controlPanelDiv','bedHeadPanelDiv','brandsAll'
    ];

    // Map table ids to brand div ids
    const brandDivMap = {
        copperTable: 'copperBrandDiv',
        outletTable: 'OutletBrandDiv',
        cutOffValvesTable: 'cutoffvalvesDiv',
        airDrierTable: 'airDrierDiv',
        compressorsTable: 'compressorsDiv',
        controlPanelTable: 'controlPanelDiv',
        bedHeadPanelTable: 'bedHeadPanelDiv',
        vaccumJarsTable: 'brandsAll',
        flowMetersTable: 'brandsAll',
        // newMongoTable: 'brandsAll' // uncomment if needed
    };

    function showTable(tableId) {
        // Hide all tables and brand divs
        tableIds.forEach(id => {
            const el = document.getElementById(id);
            if(el) el.style.display = 'none';
        });
        brandDivIds.forEach(id => {
            const el = document.getElementById(id);
            if(el) el.style.display = 'none';
        });

        // Show selected table
        const selectedTable = document.getElementById(tableId);
        if(selectedTable) selectedTable.style.display = 'table';

        // Show associated brand div
        const brandDivId = brandDivMap[tableId];
        if(brandDivId){
            const brandDiv = document.getElementById(brandDivId);
            if(brandDiv) brandDiv.style.display = 'block';
        }
    }

    function resetForm() {
        document.querySelectorAll("input[type='checkbox']").forEach(cb => cb.checked = false);
        document.querySelectorAll("input[type='number']").forEach(n => n.value = "");
        tableIds.forEach(id => {
            const el = document.getElementById(id);
            if(el) el.style.display = 'none';
        });
        brandDivIds.forEach(id => {
            const el = document.getElementById(id);
            if(el) el.style.display = 'none';
        });
    }
</script>

	        
</body>
</html>
