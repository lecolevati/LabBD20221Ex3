package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import view.DescricaoOnibus;
import view.DescricaoViagem;

public class OnibusDao implements IOnibusDao {

	private GenericDao gDao;
	
	public OnibusDao(GenericDao gDao) {
		this.gDao = gDao;
	}

	@Override
	public DescricaoOnibus consultaDescricaoOnibus(int id) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		
		DescricaoOnibus descOn = new DescricaoOnibus();
		String sql = "SELECT codigo, motorista, placa, marca, descricao FROM v_descricao_onibus WHERE codigo = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			descOn.setCodigo(rs.getInt("codigo"));
			descOn.setMotorista(rs.getString("motorista"));
			descOn.setPlaca(rs.getString("placa"));
			descOn.setMarca(rs.getString("marca"));
			descOn.setDescricao(rs.getString("descricao"));
		}
		rs.close();
		ps.close();
		c.close();
		
		return descOn;
	}

	@Override
	public DescricaoViagem consultaDescricaoViagem(int id) throws SQLException, ClassNotFoundException {
		Connection c = gDao.getConnection();
		
		DescricaoViagem descViagem = new DescricaoViagem();
		String sql = "SELECT codigo, placa, hora_saida, hora_chegada, partida, destino FROM v_descricao_viagem WHERE codigo = ?";
		PreparedStatement ps = c.prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			descViagem.setCodigo(rs.getInt("codigo"));
			descViagem.setPlaca(rs.getString("placa"));
			descViagem.setHoraSaida(rs.getString("hora_saida"));
			descViagem.setHoraChegada(rs.getString("hora_chegada"));
			descViagem.setPartida(rs.getString("partida"));
			descViagem.setDestino(rs.getString("destino"));
		}
		rs.close();
		ps.close();
		c.close();
		
		return descViagem;
	}
	
}
