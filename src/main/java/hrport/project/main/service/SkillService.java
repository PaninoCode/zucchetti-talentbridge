package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashSet;
import java.util.Set;

import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.Skill;

public class SkillService {

	public static Set<Skill> getSkillsByIdCs(Integer idCs) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetSkills = null;
		Set<Skill> education = new HashSet<>();
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT sk.* FROM Skill sk WHERE sk.idCs = ? ORDER BY sk.idSkill";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setInt(1, idCs);
			
			resultSetSkills = userEducation.executeQuery();
			
			while(resultSetSkills.next()) {
				
				education.add(new Skill(resultSetSkills.getInt("idCs"), resultSetSkills.getInt("idSkill"), resultSetSkills.getString("nomeSkill")));
			}
			
			con.commit();
		} catch (Exception e) {
			
			//throw e;
			con.rollback();
			education = new HashSet<>();
		} finally {
			
			con.close();
		}
		
		return education;
	}
}
