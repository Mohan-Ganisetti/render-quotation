package com.nt.Model;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class SelectedItems {

	List<String>  brands;
	String materialType,items;
	 Integer quantity;
	 Double price; 
	
}
