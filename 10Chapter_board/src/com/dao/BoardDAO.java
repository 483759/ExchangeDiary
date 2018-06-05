package com.dao;

import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;


import com.entity.BoardDTO;
import com.entity.PageTO;

public class BoardDAO {

   String jdbc_driver = "com.mysql.jdbc.Driver";
   String jdbc_url = "jdbc:mysql://localhost/jspdb"; 

   public BoardDAO(){
      //DataSource 얻기
      try{
         Class.forName(jdbc_driver);
      }catch(Exception e){ e.printStackTrace();}
   }//end 생성자

   //목록보기
   public ArrayList<BoardDTO> list(){

      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT  num , author, title,  content ,  substr( writeday , 1, 10) writeday ,  readcnt , repRoot, repStep, repIndent FROM board order by repRoot desc , repStep asc";
         pstmt = con.prepareStatement(query);
         rs = pstmt.executeQuery();

         while( rs.next()){
            int num = rs.getInt( "num" );
            String author = rs.getString( "author" );
            String title = rs.getString( "title" );
            String content = rs.getString( "content" );
            String writeday = rs.getString( "writeday" );
            int readcnt = rs.getInt( "readcnt" );
            int repRoot = rs.getInt( "repRoot");
            int repStep = rs.getInt( "repStep" );
            int repIndent = rs.getInt( "repIndent" );
            BoardDTO data = new BoardDTO();
            data.setNum( num );
            data.setAuthor( author );
            data.setTitle( title );
            data.setContent( content );
            data.setWriteday( writeday );
            data.setReadcnt( readcnt );
            data.setRepRoot( repRoot);
            data.setRepStep( repStep );
            data.setRepIndent( repIndent );
            list.add( data );
         }//end while

      }catch(Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return list;
   }//end select

   //글쓰기 
   public void write( String _title, String _author, String _content){

      Connection con = null;
      PreparedStatement pstmt = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query =" INSERT INTO board (title, author , content,  repRoot , repStep , repIndent ) values (? , ? , ? , 0 , 0 , 0 )";
         pstmt = con.prepareStatement( query );

         pstmt.setString( 1, _title );
         pstmt.setString( 2, _author );
         pstmt.setString( 3, _content );

         int n = pstmt.executeUpdate();

      }catch(Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }//end finally
   }//end insert


   //조회수 1 증가
   public  void readCount( String  _num ){

      Connection con = null;
      PreparedStatement pstmt = null;
      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "UPDATE board SET readcnt = readcnt + 1 WHERE num="+ _num;
         pstmt = con.prepareStatement( query );
         int n = pstmt.executeUpdate( );

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }//end finally
   }//end readCount

   //글 자세히 보기
   public BoardDTO retrieve( String  _num ){

      // 조회수 증가
      readCount(  _num );
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      BoardDTO data = new BoardDTO();
      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT * FROM board WHERE num = ?";
         pstmt = con.prepareStatement( query );
         pstmt.setInt(  1 ,   Integer.parseInt( _num ) );
         rs= pstmt.executeQuery();

         if( rs.next()){
            int num = rs.getInt( "num" );
            String title = rs.getString( "title" );
            String author = rs.getString( "author" );
            String content = rs.getString( "content" );
            String writeday = rs.getString( "writeday" );
            int readcnt = rs.getInt( "readcnt" );

            data.setNum( num );
            data.setTitle( title );
            data.setAuthor( author );
            data.setContent( content );
            data.setWriteday( writeday );
            data.setReadcnt( readcnt );
         }//end if

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return data; 

   }//end retrieve

   //글 수정하기
   public void update( String  _num , String  _title , String  _author , String  _content ){

      Connection con = null;
      PreparedStatement pstmt = null;


      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "UPDATE board SET  title = ?  ,  author = ? , content = ?  WHERE num = ?";

         pstmt = con.prepareStatement( query );

         pstmt.setString ( 1 , _title );
         pstmt.setString( 2,  _author );
         pstmt.setString( 3 ,  _content );
         pstmt.setInt(  4 ,   Integer.parseInt( _num ) );

         int n = pstmt.executeUpdate();

      }catch( Exception e){ 
         e.printStackTrace(); 
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }

   }//end update

   //글 삭제하기
   public void delete( String   _num ){

      Connection con = null;
      PreparedStatement pstmt = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "DELETE FROM board WHERE num = ?";
         pstmt = con.prepareStatement( query );
         pstmt.setInt(  1 ,   Integer.parseInt( _num ) );

         int n =   pstmt.executeUpdate( );



      }catch( Exception e) { 
         e.printStackTrace();
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }

   }//end delete

   // 검색 하기
   public ArrayList<BoardDTO>  search( String  _searchName,  String  _searchValue )   {
      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT  num , author, title,  content ,  substr( writeday , 1, 10) writeday ,  readcnt FROM board";

         if(  _searchName.equals( "title" )){

            query += "     WHERE  title  LIKE  ?";

         }else{
            query += "    WHERE  author LIKE ?";
         }//

         pstmt = con.prepareStatement( query );
         pstmt.setString(  1 ,   "%"+_searchValue+"%" );

         rs = pstmt.executeQuery( );

         while( rs.next()){
            int num = rs.getInt( "num" );
            String author = rs.getString( "author" );
            String title = rs.getString( "title" );
            String content = rs.getString( "content" );
            String writeday = rs.getString( "writeday" );
            int readcnt = rs.getInt( "readcnt" );

            BoardDTO data = new BoardDTO();
            data.setNum( num );
            data.setAuthor( author );
            data.setTitle( title );
            data.setContent( content );
            data.setWriteday( writeday );
            data.setReadcnt( readcnt );
            list.add( data );
         }//end while

      }catch(Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return list;
   }//end search

   // 답변글 입력 폼 보기
   public  BoardDTO  replyui( String  _num ){

      BoardDTO data = new BoardDTO();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT * FROM board WHERE  num = ?";
         pstmt = con.prepareStatement( query );
         pstmt.setInt(  1 ,   Integer.parseInt( _num ) );

         rs  =  pstmt.executeQuery();

         if( rs.next()){
            data.setNum(  rs.getInt( "num" ));
            data.setTitle( rs.getString( "title" ));
            data.setAuthor( rs.getString( "author" ));
            data.setContent( rs.getString( "content" ));
            data.setWriteday( rs.getString( "writeday" ));
            data.setReadcnt( rs.getInt( "readcnt" ));
            data.setRepRoot( rs.getInt( "repRoot" ));
            data.setRepStep( rs.getInt( "repStep" ));
            data.setRepIndent( rs.getInt( "repIndent" ));
         }//end if

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return data;
   }//end replyui

   //답변글의 기존 repStep 1 증가
   public void makeReply( String _root , String _step ){

      Connection con = null;
      PreparedStatement pstmt = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "UPDATE board SET repStep = repStep + 1 WHERE  repRoot = ? AND  repStep > ? ";
         pstmt = con.prepareStatement( query );
         pstmt.setInt(  1 ,   Integer.parseInt( _root ) );
         pstmt.setInt(  2 ,   Integer.parseInt( _step ) );
         int n= pstmt.executeUpdate( );


      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();      
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }

   }//

   //답변 달기
   public void reply( String _num, String _title , String  _author, String _content , String _repRoot,  String _repStep , String _repIndent ){

      makeReply( _repRoot,  _repStep );

      Connection con = null;
      PreparedStatement pstmt = null;
      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "INSERT INTO board (title, author, content, repRoot, repStep, repIndent ) values (? , ? , ? , ?, ?, ?) ";
         pstmt = con.prepareStatement( query );

         pstmt.setString ( 1,  _title );
         pstmt.setString ( 2, _author );
         pstmt.setString ( 3, _content );
         pstmt.setInt ( 4, Integer.parseInt( _repRoot) );
         pstmt.setInt ( 5,  Integer.parseInt( _repStep) + 1 );
         pstmt.setInt ( 6,  Integer.parseInt( _repIndent) + 1 );

         int n = pstmt.executeUpdate();

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();      
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
   }//end reply

   // 페이징 처리: 전체 레코드 갯수 구하기
   public int totalCount(){

      int count = 0;
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT  count(*) FROM board";
         pstmt = con.prepareStatement( query );
         rs =   pstmt.executeQuery( );

         if( rs.next()){
            count = rs.getInt( 1 );
         }

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return count;
   }//end totalCount

   // 페이지 구현
   public PageTO  page( int curPage ){

      PageTO   to = new PageTO();
      int totalCount = totalCount();

      ArrayList<BoardDTO> list = new ArrayList<BoardDTO>();
      Connection con = null;
      PreparedStatement pstmt = null;
      ResultSet rs = null;

      try{
         con = DriverManager.getConnection(jdbc_url, "root", "gksquf2wld!");
         String query = "SELECT  num , author, title,  content ,  substr( writeday , 1, 10) writeday ,  readcnt , repRoot, repStep, repIndent FROM board order by repRoot desc , repStep asc";

         pstmt = con.prepareStatement(query, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
         rs = pstmt.executeQuery(  );

         int perPage = to.getPerPage(); //5
         int skip = ( curPage - 1 ) * perPage;
         if( skip > 0 ){
            rs.absolute( skip );
         }
         for( int i = 0 ; i < perPage &&  rs.next() ; i++){
            int num = rs.getInt( "num" );
            String author = rs.getString( "author" );
            String title = rs.getString( "title" );
            String content = rs.getString( "content" );
            String writeday = rs.getString( "writeday" );
            int readcnt = rs.getInt( "readcnt" );
            int repRoot = rs.getInt( "repRoot");
            int repStep = rs.getInt( "repStep" );
            int repIndent = rs.getInt( "repIndent" );
            BoardDTO data = new BoardDTO();
            data.setNum( num );
            data.setAuthor( author );
            data.setTitle( title );
            data.setContent( content );
            data.setWriteday( writeday );
            data.setReadcnt( readcnt );
            data.setRepRoot( repRoot);
            data.setRepStep( repStep );
            data.setRepIndent( repIndent );
            list.add( data );
         }//end for

         to.setList( list ); // ArrayList 저장
         to.setTotalCount( totalCount ); // 전체 레코드 갯수
         to.setCurPage( curPage ); // 현재 페이지

      }catch( Exception e){ 
         e.printStackTrace();
      }finally{
         try {
            if( rs!= null) rs.close();
            if( pstmt!= null) pstmt.close();
            if( con!= null) con.close();

         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
      return to;
   }//end page

}//end class