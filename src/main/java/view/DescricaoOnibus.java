package view;

public class DescricaoOnibus {
	
	private int codigo;
	private String motorista;
	private String placa;
	private String marca;
	private String descricao;
	
	public int getCodigo() {
		return codigo;
	}
	public void setCodigo(int codigo) {
		this.codigo = codigo;
	}
	public String getMotorista() {
		return motorista;
	}
	public void setMotorista(String motorista) {
		this.motorista = motorista;
	}
	public String getPlaca() {
		return placa;
	}
	public void setPlaca(String placa) {
		this.placa = placa;
	}
	public String getMarca() {
		return marca;
	}
	public void setMarca(String marca) {
		this.marca = marca;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	
	@Override
	public String toString() {
		return "DescricaoOnibus [código=" + codigo + ", motorista=" + motorista + ", placa=" + placa + ", marca=" + marca
				+ ", descricao=" + descricao + "]";
	}
	
}
