package com.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.BoardDAO;

public class BoardUpdateCommand implements BoardCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String num = request.getParameter("num");
		String title = request.getParameter( "title" );
		String author = request.getParameter( "author" );
		String content = request.getParameter( "content" );

		BoardDAO  dao = new BoardDAO();
		dao.update( num , title, author, content );

	}

}
