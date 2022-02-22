package persistence;

import java.sql.SQLException;

import view.DescricaoOnibus;
import view.DescricaoViagem;

public interface IOnibusDao {

	public DescricaoOnibus consultaDescricaoOnibus(int id) throws SQLException, ClassNotFoundException;
	public DescricaoViagem consultaDescricaoViagem(int id) throws SQLException, ClassNotFoundException;
	
}
