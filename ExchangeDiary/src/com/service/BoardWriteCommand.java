package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.BoardDAO;

public class BoardWriteCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
	
				String title = request.getParameter( "title" );
				String author = request.getParameter( "author" );
				String writeday = request.getParameter("writeday");
				String content = request.getParameter( "content" );

				BoardDAO dao = new BoardDAO();
				dao.write( title, author , writeday, content );
		

	}

}
