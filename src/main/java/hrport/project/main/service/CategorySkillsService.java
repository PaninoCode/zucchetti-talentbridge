package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.CategoriaSkills;
import hrport.project.main.pojo.Istruzione;
import hrport.project.main.pojo.Skill;

public class CategorySkillsService {

	public static Set<CategoriaSkills> getCategoriesByIdCvWithSkills(Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetCategories = null;
		Set<CategoriaSkills> categories = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT cg.* FROM CategoriaSkills cg WHERE cg.idCv = ?";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setInt(1, idCv);
			
			resultSetCategories = userEducation.executeQuery();
			
			while(resultSetCategories.next()) {
				
				Set<Skill> skills = SkillService.getSkillsByIdCs(idCv);
				
				categories.add(new CategoriaSkills(resultSetCategories.getInt("idCv"), resultSetCategories.getInt("idCs"), skills, resultSetCategories.getString("nomeCategoria")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			//throw e;
			con.rollback();
			categories = new HashSet<>();
		} finally {
			
			con.close();
		}
		
		return categories;
	}
}
