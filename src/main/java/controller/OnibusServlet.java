package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import persistence.GenericDao;
import persistence.IOnibusDao;
import persistence.OnibusDao;
import view.DescricaoOnibus;
import view.DescricaoViagem;

@WebServlet("/onibus")
public class OnibusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OnibusServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String botao = request.getParameter("botao");
		String codigo = request.getParameter("codigo");
		String erro = "";
		
		DescricaoViagem descViagem = new DescricaoViagem();
		DescricaoOnibus descOn = new DescricaoOnibus();

		GenericDao gDao = new GenericDao();
		IOnibusDao oDao = new OnibusDao(gDao);
		
		try {
			if (codigo.equals("")) {
				erro = "Preencher o ID";
				descOn = null;
				descViagem = null;
			} else {
				int codigoViagem = Integer.parseInt(codigo);
				if (botao.contains("Onibus")) {
					descOn = oDao.consultaDescricaoOnibus(codigoViagem);
					descViagem = null;
				}
				if (botao.contains("Viagem")) {
					descViagem = oDao.consultaDescricaoViagem(codigoViagem);
					descOn = null;
				}
			}
		} catch (SQLException | ClassNotFoundException e) {
			erro = e.getMessage();
		} finally {
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			request.setAttribute("descOn", descOn);
			request.setAttribute("descViagem", descViagem);
			request.setAttribute("erro", erro);
			rd.forward(request, response);
		}
	}

}
