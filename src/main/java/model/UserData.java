package model;

public class UserData {
    private String Nombres;
    private String Apellidos;
    private String pass;
    private String User;
    private int idUser;
    private int idDepartamento;
    private int idRol;
    private byte estadoBaja;

    public UserData(){

    }
    public UserData(String name, String apellidos, String pass,String username,  int Departamento, int Rol, byte newEstado){
        setNombres(name);
        setApellidos(apellidos);
        setPass(pass);
        setUser(username);
        setIdDepartamento(Departamento);
        setIdRol(Rol);
        setEstadoBaja(newEstado);
    }


    public String getNombres() {
        return Nombres;
    }

    public void setNombres(String nombres) {
        Nombres = nombres;
    }

    public String getApellidos() {
        return Apellidos;
    }

    public void setApellidos(String apellidos) {
        Apellidos = apellidos;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getIdUser() {
        return idUser;
    }

    public void setIdUser(int idUser) {
        this.idUser = idUser;
    }

    public int getIdDepartamento() {
        return idDepartamento;
    }

    public void setIdDepartamento(int idDepartamento) {
        this.idDepartamento = idDepartamento;
    }

    public int getIdRol() {
        return idRol;
    }

    public void setIdRol(int idRol) {
        this.idRol = idRol;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String user) {
        User = user;
    }

    public byte getEstadoBaja() {
        return estadoBaja;
    }

    public void setEstadoBaja(byte estadoBaja) {
        this.estadoBaja = estadoBaja;
    }
}
