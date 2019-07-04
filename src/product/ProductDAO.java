package product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDAO {
   DBConnectionMgr mgr;
   private String table = "goods";
   
   
   public ProductDAO() {
   mgr = DBConnectionMgr.getInstance();
   }
   
   

   public ArrayList<ProductDTO> selectAll() throws Exception{
      ArrayList<ProductDTO> list = new ArrayList();
      Connection con = mgr.getConnection();
      
      ProductDTO dto = null; //변수의 생존범위 = 선언의 위치
      
         //3. SQL문 결정(객체화)
         String sql = "select * from "+table;
         PreparedStatement ps = con.prepareStatement(sql);
         //4. SQL문 전송
         ResultSet rs = ps.executeQuery();
         
         while(rs.next()) {
            dto = new ProductDTO();
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String contents = rs.getString(3);
            String sale = rs.getString(4);
            dto.setId(id);
            dto.setName(name);
            dto.setContents(contents);
            dto.setSale(sale);
            
            list.add(dto);
         }
         
      mgr.freeConnection(con, ps, rs);
   return list;
}   

   
      public ProductDTO select(String pid) throws Exception{
         //1.2 단계를 해주는 DBConni 드라이버 설정
         Connection con = mgr.getConnection();
         
         
         String sql = "select * from "+table+" where id = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, pid);
         ProductDTO dto = null;
         
         ResultSet rs = ps.executeQuery();
         while(rs.next()) {
            dto = new ProductDTO();
            int id = rs.getInt(1);
            String name = rs.getString(2);
            String contents = rs.getString(3);
            String sale = rs.getString(4);
            dto.setId(id);
            dto.setName(name);
            dto.setContents(contents);
            dto.setSale(sale);
            
         }
         mgr.freeConnection(con, ps, rs);
         return dto;
      }
      public void insert(ProductDTO dto) throws Exception{
      //1.2 단계를 해주는 DBConni 드라이버 설정
   
      Connection con = mgr.getConnection();
      
      
      String sql = "insert into "+table+" values(?,?,?,?)";
      PreparedStatement ps = con.prepareStatement(sql);
      ps.setInt(1, dto.getId());
      ps.setString(2, dto.getName());
      ps.setString(3, dto.getContents());
      ps.setString(4, dto.getSale());

      ps.executeUpdate();
      System.out.print("정상작동");
      //  
      }
      public void update(ProductDTO dto) throws Exception{
         //1.2 단계를 해주는 DBConni 드라이버 설정
      
         Connection con = mgr.getConnection();
         
         
         String sql = "update "+table+" set id =?, name = ?, contents=?,sale=? where id = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setInt(1, dto.getId());
         ps.setString(2, dto.getName());
         ps.setString(3, dto.getContents());
         ps.setString(4, dto.getSale());
         ps.setInt(5, dto.getId());
         //  
         ps.executeUpdate();
         mgr.freeConnection(con, ps);
         }
      public void delete(String id) throws Exception{

         Connection con = mgr.getConnection();
         
         String sql = "delete from "+table+" where id = ?";
         PreparedStatement ps = con.prepareStatement(sql);
         ps.setString(1, id);
         ps.executeUpdate();
         mgr.freeConnection(con, ps);
      }
      
       
}