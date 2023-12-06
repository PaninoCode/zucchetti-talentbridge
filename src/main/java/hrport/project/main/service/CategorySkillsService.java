package hrport.project.main.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDate;
import java.util.Comparator;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import hrport.project.main.adaptergson.LocalDateAdapter;
import hrport.project.main.connectdb.ConnectDatabase;
import hrport.project.main.pojo.CategoriaSkills;
import hrport.project.main.pojo.Skill;

public class CategorySkillsService {

	public static Set<CategoriaSkills> getCategoriesByIdCvWithSkills(Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		
		ResultSet resultSetCategories = null;
		Set<CategoriaSkills> categories = new TreeSet<>(new Comparator<CategoriaSkills>() {

			@Override
			public int compare(CategoriaSkills o1, CategoriaSkills o2) {
				// TODO Auto-generated method stub
				return o1.getIdCs().compareTo(o2.getIdCs());
			}
		});
		
		try {
			
			con.setAutoCommit(false);
			String SQLUserPositions = "SELECT cg.* FROM CategoriaSkills cg WHERE cg.idCv = ? ORDER BY cg.idCs";
			
			PreparedStatement userEducation = con.prepareStatement(SQLUserPositions);
			userEducation.setInt(1, idCv);
			
			resultSetCategories = userEducation.executeQuery();
			
			while(resultSetCategories.next()) {
				
				int idCs = resultSetCategories.getInt("idCs");
				
				Set<Skill> skills = SkillService.getSkillsByIdCs(idCs);
				
				categories.add(new CategoriaSkills(resultSetCategories.getInt("idCv"), idCs, skills, resultSetCategories.getString("nomeCategoria")));
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
	
	public static void insertCategoryWithSkills(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		
		ResultSet resultSetCategoryId = null;
		CategoriaSkills category = null;

		try {
			
			con.setAutoCommit(false);
			
			category = gson.fromJson(json, CategoriaSkills.class);
			
			if(category.getSkills() == null) {
				throw new Exception("bisogna inserire anche le skills");
			}
					
			String SQLCategory = "INSERT INTO \"CategoriaSkills\" (\"idCv\", \"nomeCategoria\")\r\n"
					+ "VALUES (?, ?);"
					+ "SELECT SCOPE_IDENTITY() as 'lastId'";
			
			PreparedStatement insertCategory = con.prepareStatement(SQLCategory);
			
			insertCategory.setInt(1, idCv);
			insertCategory.setString(2, category.getNomeCategoria());
			
			resultSetCategoryId = insertCategory.executeQuery();
			
			String SQLSkills = "INSERT INTO \"Skill\" (\"idCs\", \"nomeSkill\")\r\n"
					+ "VALUES (?, ?);";
			
			resultSetCategoryId.next();
			Integer lastId = resultSetCategoryId.getInt("lastId");
			
			for (Iterator<Skill> iterator = (category.getSkills()).iterator(); iterator.hasNext();) {
				
				Skill skill = iterator.next();
				PreparedStatement insertSkill = con.prepareStatement(SQLSkills);
				
				insertSkill.setInt(1, lastId);
				insertSkill.setString(2, skill.getNomeSkill());
				
				insertSkill.executeUpdate();
			}
			
			con.commit();
			
			System.out.println("success");
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
	
	public static void updateCategoryWithSkills(String json, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
		Gson gson = new GsonBuilder().registerTypeAdapter(LocalDate.class, new LocalDateAdapter()).create();
		
		CategoriaSkills category = null;

		try {
			
			con.setAutoCommit(false);
			
			category = gson.fromJson(json, CategoriaSkills.class);
			
			if(category.getSkills() == null) {
				throw new Exception("bisogna inserire anche le skills");
			}
					
			String SQLCategory = "UPDATE \"CategoriaSkills\""
					+ "SET nomeCategoria = ?"
					+ "WHERE CategoriaSkills.idCs = ?"
					+ "AND CategoriaSkills.idCv = ?";
			
			PreparedStatement updateCategory = con.prepareStatement(SQLCategory);
			
			updateCategory.setString(1, category.getNomeCategoria());
			updateCategory.setInt(2, category.getIdCs());
			updateCategory.setInt(3, idCv);
			
		    updateCategory.executeUpdate();
			
			String SQLSkills = "UPDATE \"Skill\""
					+ "SET nomeSkill = ?"
					+ "WHERE Skill.idCs = ?"
					+ "AND Skill.idSkill = ?";
			
			for (Iterator<Skill> iterator = (category.getSkills()).iterator(); iterator.hasNext();) {
				
				Skill skill = iterator.next();
				PreparedStatement updateSkill = con.prepareStatement(SQLSkills);
				
				updateSkill.setString(1, skill.getNomeSkill());
				updateSkill.setInt(2, category.getIdCs());
				updateSkill.setInt(3, skill.getIdSkill());
				
				updateSkill.executeUpdate();
			}
			
			con.commit();
			
			System.out.println("success");
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
		
	}
	
	public static void deleteCategoryWithSkills(Integer idTable, Integer idCv) throws Exception {
		
		Connection con = ConnectDatabase.getConnection();
			
		try {
			
			con.setAutoCommit(false);
					
			String SQL = "DELETE FROM CategoriaSkills WHERE CategoriaSkills.idCs = ? AND CategoriaSkills.idCv = ?;";
			
			PreparedStatement deleteCategoryWithSkill = con.prepareStatement(SQL);
			
			deleteCategoryWithSkill.setInt(1, idTable);
			deleteCategoryWithSkill.setInt(2, idCv);
			
			deleteCategoryWithSkill.executeUpdate();
			
			con.commit();
		} catch (Exception e) {
			
			con.rollback();
			throw e;
		} finally {
			
			con.close();
		}
			
	}
}
