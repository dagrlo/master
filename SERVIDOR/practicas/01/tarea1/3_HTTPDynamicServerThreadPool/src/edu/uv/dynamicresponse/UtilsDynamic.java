package edu.uv.dynamicresponse;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.Vector;

public class UtilsDynamic {
	public static HashMap<String, JarAndClass> getDynamicMappings() {
		HashMap<String, JarAndClass> maps = new HashMap<String,JarAndClass>();
		try {
			BufferedReader br = new BufferedReader(new FileReader(
					"dynamic_mappings.txt"));
			maps = new HashMap<String, JarAndClass>();
			String cad;
			while ((cad = br.readLine()) != null) {
				String[] tokens = cad.split(";");
				String[] jap = tokens[1].split(" ");
				maps.put(tokens[0],new JarAndClass(jap[0], jap[1]));
				
			}
			br.close();
		} catch (Exception ex) {

		}
		return maps;
	}
	
	public static List<String> getJars(HashMap<String, JarAndClass> mappings){
	   Vector<String> lista = new Vector<String>();
	   Set<String> urls = mappings.keySet();
	   
	   for (String u: urls){
		   lista.add(mappings.get(u).getJarFile());
	   }
	   return lista;
	   
		
	}
	
}
