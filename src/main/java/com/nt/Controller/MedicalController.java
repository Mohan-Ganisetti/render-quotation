package com.nt.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.nt.Model.Medicals;
import com.nt.Model.SelectedItems;
import com.nt.Repository.MedicalRepository;

import org.springframework.ui.Model;
import jakarta.servlet.http.HttpSession;
@Controller
public class MedicalController {

	@Autowired
	MedicalRepository medicalRepository;
	
	@GetMapping({"/", "/QuotationGenerator", "/QuotationGenerator/"})
	public String openForm() {
		System.out.println("Form page Is Opend");
		
	    return "MapdataForm"; // JSP or HTML file name (without extension)
	}

	@GetMapping("/thymeleafWelcome")
	public String thymeleafWelcome() {
	    return "MapdataForm"; // Will use welcome.html in templates
	}

	@PostMapping("/save") // lowercase everywhere
	public String save(@RequestParam String keyData,
	                   @RequestParam String valueList,
	                   Model model) {

	    String normalizedKey = keyData.substring(0, 1).toUpperCase() + keyData.substring(1).toLowerCase();
	    System.out.println("data ready to save with Key: " + normalizedKey);

	    List<String> newValues = Arrays.stream(valueList.split(","))
	                                   .map(String::trim)
	                                   .filter(s -> !s.isEmpty())
	                                   .toList();

	    
	    Medicals medical = medicalRepository.findAll()
	            .stream()
	            .filter(m -> m.getEntry() != null && m.getEntry().containsKey(normalizedKey))
	            .findFirst() // value 
	            .orElse(null);

	    if (medical == null) {
	        medical = new Medicals();
	        Map<String, List<String>> map = new HashMap<>();
	        
	        map.put(normalizedKey, new ArrayList<>(newValues));
	        medical.setEntry(map);
	    }
	    else {
	        List<String> existingList = medical.getEntry().get(normalizedKey); // here get values for matched key
	        for (String val : newValues) {
	            if (!existingList.contains(val)) {
	                existingList.add(val);
	            }
	        }
	    }

	    medicalRepository.save(medical);
       
	    
	    model.addAttribute("medical", medicalRepository.findAll()); // pass the map, not entity
	    model.addAttribute("message", "Data Saved");
	
	    return "redirect:/show";
	}
	@GetMapping("/delete")
	public String deleteSingleItem(@RequestParam String type,
	                               @RequestParam String item,
	                               RedirectAttributes redirectAttributes) {

	    String normalizedKey = type.substring(0, 1).toUpperCase() + type.substring(1).toLowerCase();

	    Medicals medical = medicalRepository.findAll()
	            .stream()
	            .filter(m -> m.getEntry() != null && m.getEntry().containsKey(normalizedKey))
	            .findFirst()
	            .orElse(null);

	    if (medical != null) {
	        List<String> itemList = medical.getEntry().get(normalizedKey);
	        if (itemList != null && itemList.remove(item)) {
	            medicalRepository.save(medical);
	            redirectAttributes.addFlashAttribute("message", "Deleted '" + item + "' from '" + normalizedKey + "'");
	        }
	    }

	    return "redirect:/show";
	}

	@GetMapping("/show")
	public String showAll(Model model) {
	    model.addAttribute("medical", medicalRepository.findAll());
	    return "Show"; // This maps to /WEB-INF/pages/Show.jsp
	}

	
@GetMapping("/MaterialSelectionForm")
public String MedicalForm(Model model) {
	
	model.addAttribute("data",new Medicals());
	
	  Map<String, List<String>> brandNames = Map.of(
	            "Copper", List.of("MANDEV", "AKTIV", "ANASTAIWATA"),
	            "Outlet", List.of("MEDIFLOW"),
	         //   "FlowMeters", List.of("white", "colour"),
	            "Cutoffvalves", List.of("PONIX"),

	            "AirDrier", List.of("COSMIK 20 CFM", "REPRICATION 40 CFM","TRYDENT 40 CFM "),
	            "Compressors", List.of("ANASTAIWATA", "CROMTEK"),
	            "ControlPanel", List.of("AKTIV", "MR"),
	            "BedHeadPanel", List.of("DELLI", "SHOLAPUR")

	        );
	        model.addAttribute("brandNames", brandNames);

model.addAttribute("FindAll", medicalRepository.findAll());

	return "SelectionForm";
	
}

@PostMapping("/PostSelectedData")
public String Colletdata(      
        @RequestParam(required = false) List<String> copperBrands,
        @RequestParam(required = false) List<String> copperMaterials,
        @RequestParam(required = false) List<Integer> copperQuantities,
        @RequestParam(required = false) List<Double> copperPrices,
        
        
        
        @RequestParam(required = false) List<String> doctorName,
        @RequestParam(required = false) List<String> hospitalName,
        @RequestParam(required = false) List<String> billDate,
        @RequestParam(required = false) List<String> addears,
        @RequestParam(required = false) List<String> GDTIN,
        
        
        @RequestParam(required = false) List<String> outletBrands,
        @RequestParam(required = false) List<String> CutoffvalvesBrands,
        @RequestParam(required = false) List<String> airDrierBrands,
        @RequestParam(required = false) List<String> compressorsBrands,
        @RequestParam(required = false) List<String> controlPanelBrands,
        @RequestParam(required = false) List<String> bedHeadPanelBrands,


        @RequestParam(required = false) List<String> brandsAll,

    

       @RequestParam(required = false) List<String> outletMaterials,
       @RequestParam(required = false) List<String> outletQuantities,
       @RequestParam(required = false) List<String> outletPrices,

       @RequestParam(required = false) List<String> flowMetersBrands,
       @RequestParam(required = false) List<String> flowMetersMaterials,
       @RequestParam(required = false) List<String> flowMetersQuantities,
       @RequestParam(required = false) List<String> flowMetersPrices,
     
       @RequestParam(required = false) List<String> bedHeadPanelMaterials,
       @RequestParam(required = false) List<String> bedHeadPanelQuantities,
       @RequestParam(required = false) List<String> bedHeadPanelPrices,

       @RequestParam(required = false) List<String> vaccumJarsBrands,
       @RequestParam(required = false) List<String> vaccumJarsMaterials,
       @RequestParam(required = false) List<String> vaccumJarsQuantities,
       @RequestParam(required = false) List<String> vaccumJarsPrices,

       @RequestParam(required = false) List<String> accumTraleBrands,
       @RequestParam(required = false) List<String> accumTraleMaterials,
       @RequestParam(required = false) List<String> accumTraleQuantities,
       @RequestParam(required = false) List<String> accumTralePrices,

       @RequestParam(required = false) List<String> cutoffvalvesMaterials,
       @RequestParam(required = false) List<String> cutoffvalvesQuantities,
       @RequestParam(required = false) List<String> cutoffvalvesPrices,

       @RequestParam(required = false) List<String> gasAlaramBrands,
       @RequestParam(required = false) List<String> gasAlaramMaterials,
       @RequestParam(required = false) List<String> gasAlaramQuantities,
       @RequestParam(required = false) List<String> gasAlaramPrices,

       @RequestParam(required = false) List<String> maniFoldBrands,
       @RequestParam(required = false) List<String> maniFoldMaterials,
       @RequestParam(required = false) List<String> maniFoldQuantities,
       @RequestParam(required = false) List<String> maniFoldPrices,

       @RequestParam(required = false) List<String> regulatorBrands,
       @RequestParam(required = false) List<String> regulatorMaterials,
       @RequestParam(required = false) List<String> regulatorQuantities,
       @RequestParam(required = false) List<String> regulatorPrices,

       @RequestParam(required = false) List<String> boilsConvertionkitBrands,
       @RequestParam(required = false) List<String> boilsConvertionkitMaterials,
       @RequestParam(required = false) List<String> boilsConvertionkitQuantities,
       @RequestParam(required = false) List<String> boilsConvertionkitPrices,

       @RequestParam(required = false) List<String> emergencyBrands,
       @RequestParam(required = false) List<String> emergencyMaterials,
       @RequestParam(required = false) List<String> emergencyQuantities,
       @RequestParam(required = false) List<String> emergencyPrices,

       @RequestParam(required = false) List<String> airDrierMaterials,
       @RequestParam(required = false) List<String> airDrierQuantities,
       @RequestParam(required = false) List<String> airDrierPrices,

       @RequestParam(required = false) List<String> compressorsMaterials,
       @RequestParam(required = false) List<String> compressorsQuantities,
       @RequestParam(required = false) List<String> compressorsPrices,

       @RequestParam(required = false) List<String> controlPanelMaterials,
       @RequestParam(required = false) List<String> controlPanelQuantities,
       @RequestParam(required = false) List<String> controlPanelPrices,
       
       
    
        Model model) {
	
	model.addAttribute("doctorName", doctorName);
	model.addAttribute("hospitalName", hospitalName);
	model.addAttribute("billDate", billDate);
	model.addAttribute("addears", addears);
	model.addAttribute("GDTIN", GDTIN);

	
	List<SelectedItems> data= new ArrayList<SelectedItems>();
	
	//Copper
	 if (copperMaterials != null) {
	        for (int i = 0; i < copperMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Copper");

	            // Set brand only if exists
	            m.setBrands(copperBrands);

	            m.setItems(copperMaterials.get(i));
	            m.setQuantity((copperQuantities != null && i < copperQuantities.size()) ? copperQuantities.get(i) : 0);
	            m.setPrice((copperPrices != null && i < copperPrices.size()) ? copperPrices.get(i) : 0.0);

	            data.add(m);
	        }
	    }

	// Outlet
	    if (outletMaterials != null) {
	        for (int i = 0; i < outletMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Outlet");
	            m.setBrands(outletBrands );
	            m.setItems(outletMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (outletQuantities != null && i < outletQuantities.size()) ? Integer.parseInt(outletQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (outletPrices != null && i < outletPrices.size()) ? Double.parseDouble(outletPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // FlowMeters
	    if (flowMetersMaterials != null) {
	        for (int i = 0; i < flowMetersMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Flowmeters");
	            m.setBrands(flowMetersBrands);
	            m.setItems(flowMetersMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (flowMetersQuantities != null && i < flowMetersQuantities.size()) ? Integer.parseInt(flowMetersQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (flowMetersPrices != null && i < flowMetersPrices.size()) ? Double.parseDouble(flowMetersPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // BedHeadPanel
	    if (bedHeadPanelMaterials != null) {
	        for (int i = 0; i < bedHeadPanelMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Bedheadpanel");
	            m.setBrands(bedHeadPanelBrands);
	            m.setItems(bedHeadPanelMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (bedHeadPanelQuantities != null && i < bedHeadPanelQuantities.size()) ? Integer.parseInt(bedHeadPanelQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (bedHeadPanelPrices != null && i < bedHeadPanelPrices.size()) ? Double.parseDouble(bedHeadPanelPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // VaccumJars
	    if (vaccumJarsMaterials != null) {
	        for (int i = 0; i < vaccumJarsMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Vaccumjars");
	            m.setBrands(vaccumJarsBrands);
	            m.setItems(vaccumJarsMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (vaccumJarsQuantities != null && i < vaccumJarsQuantities.size()) ? Integer.parseInt(vaccumJarsQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (vaccumJarsPrices != null && i < vaccumJarsPrices.size()) ? Double.parseDouble(vaccumJarsPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // AccumTrale
	    if (accumTraleMaterials != null) {
	        for (int i = 0; i < accumTraleMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Accumtrale");
	            m.setBrands(accumTraleBrands);
	            m.setItems(accumTraleMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (accumTraleQuantities != null && i < accumTraleQuantities.size()) ? Integer.parseInt(accumTraleQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (accumTralePrices != null && i < accumTralePrices.size()) ? Double.parseDouble(accumTralePrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // Cutoffvalves
	    if (cutoffvalvesMaterials != null) {
	        for (int i = 0; i < cutoffvalvesMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Cutoffvalves");
	            m.setBrands(CutoffvalvesBrands);
	            m.setItems(cutoffvalvesMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (cutoffvalvesQuantities != null && i < cutoffvalvesQuantities.size()) ? Integer.parseInt(cutoffvalvesQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (cutoffvalvesPrices != null && i < cutoffvalvesPrices.size()) ? Double.parseDouble(cutoffvalvesPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // GasAlaram
	    if (gasAlaramMaterials != null) {
	        for (int i = 0; i < gasAlaramMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Gasalarm");
	            m.setBrands(gasAlaramBrands);
	            m.setItems(gasAlaramMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (gasAlaramQuantities != null && i < gasAlaramQuantities.size()) ? Integer.parseInt(gasAlaramQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (gasAlaramPrices != null && i < gasAlaramPrices.size()) ? Double.parseDouble(gasAlaramPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // ManiFold
	    if (maniFoldMaterials != null) {
	        for (int i = 0; i < maniFoldMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Manifold");
	            m.setBrands(maniFoldBrands);
	            m.setItems(maniFoldMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (maniFoldQuantities != null && i < maniFoldQuantities.size()) ? Integer.parseInt(maniFoldQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (maniFoldPrices != null && i < maniFoldPrices.size()) ? Double.parseDouble(maniFoldPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // Regulator
	    if (regulatorMaterials != null) {
	        for (int i = 0; i < regulatorMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Regulator");
	            m.setBrands(regulatorBrands);
	            m.setItems(regulatorMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (regulatorQuantities != null && i < regulatorQuantities.size()) ? Integer.parseInt(regulatorQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (regulatorPrices != null && i < regulatorPrices.size()) ? Double.parseDouble(regulatorPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }

	    // BoilsConvertionkit
	    if (boilsConvertionkitMaterials != null) {
	        for (int i = 0; i < boilsConvertionkitMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Boilsconvertionkit");
	            m.setBrands(boilsConvertionkitBrands);
	            m.setItems(boilsConvertionkitMaterials.get(i));

	            int quantity = 0;
	            try { quantity = (boilsConvertionkitQuantities != null && i < boilsConvertionkitQuantities.size()) ? Integer.parseInt(boilsConvertionkitQuantities.get(i)) : 0; } catch (Exception e) { }
	            m.setQuantity(quantity);

	            double price = 0.0;
	            try { price = (boilsConvertionkitPrices != null && i < boilsConvertionkitPrices.size()) ? Double.parseDouble(boilsConvertionkitPrices.get(i)) : 0.0; } catch (Exception e) { }
	            m.setPrice(price);

	            data.add(m);
	        }
	    }
	    
	 // Emergency Service Point
	    if (emergencyMaterials != null) {
	        for (int i = 0; i < emergencyMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Emergencypoint");
	            m.setBrands(emergencyBrands);
	            m.setItems(emergencyMaterials.get(i));
	            m.setQuantity((emergencyQuantities != null && i < emergencyQuantities.size()) ? Integer.parseInt(emergencyQuantities.get(i)) : 0);
	            m.setPrice((emergencyPrices != null && i < emergencyPrices.size()) ? Double.parseDouble(emergencyPrices.get(i)) : 0.0);
	            data.add(m);
	        }
	    }

	    // Air Drier
	    if (airDrierMaterials != null) {
	        for (int i = 0; i < airDrierMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Airdrier");
	            // No brand param provided for AirDrier here, set null or handle accordingly
	            m.setBrands(airDrierBrands);
	            m.setItems(airDrierMaterials.get(i));
	            m.setQuantity((airDrierQuantities != null && i < airDrierQuantities.size()) ? Integer.parseInt(airDrierQuantities.get(i)) : 0);
	            m.setPrice((airDrierPrices != null && i < airDrierPrices.size()) ? Double.parseDouble(airDrierPrices.get(i)) : 0.0);
	            data.add(m);
	        }
	    }

	    // Compressors
	    if (compressorsMaterials != null) {
	        for (int i = 0; i < compressorsMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Compressors");
	            // No brand param provided for Compressors here, set null or handle accordingly
	            m.setBrands(compressorsBrands);
	            m.setItems(compressorsMaterials.get(i));
	            m.setQuantity((compressorsQuantities != null && i < compressorsQuantities.size()) ? Integer.parseInt(compressorsQuantities.get(i)) : 0);
	            m.setPrice((compressorsPrices != null && i < compressorsPrices.size()) ? Double.parseDouble(compressorsPrices.get(i)) : 0.0);
	            data.add(m);
	        }
	    }

	    // Control Panel
	    if (controlPanelMaterials != null) {
	        for (int i = 0; i < controlPanelMaterials.size(); i++) {
	            SelectedItems m = new SelectedItems();
	            m.setMaterialType("Controlpanel");
	            // No brand param provided for ControlPanel here, set null or handle accordingly
	            m.setBrands(controlPanelBrands);
	            m.setItems(controlPanelMaterials.get(i));
	            m.setQuantity((controlPanelQuantities != null && i < controlPanelQuantities.size()) ? Integer.parseInt(controlPanelQuantities.get(i)) : 0);
	            m.setPrice((controlPanelPrices != null && i < controlPanelPrices.size()) ? Double.parseDouble(controlPanelPrices.get(i)) : 0.0);
	            data.add(m);
	        }
	    }

	
	    model.addAttribute("finalData", data); // send to JSP
	    return "FinalBill";
	}





}
	



