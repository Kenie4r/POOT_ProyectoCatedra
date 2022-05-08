package model;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DeptController {
    public ArrayList<DepartamentoData> getAllDepts(){
        ArrayList<DepartamentoData> depts = new ArrayList<>();
        ConnectionDB dbHandler = new ConnectionDB();
        String sql = "SELECT * FROM departamento";
        dbHandler.selectData(sql);
        ResultSet rs = dbHandler.getData();
        try {
            while (rs.next()){
                DepartamentoData dep = new DepartamentoData();
                dep.setId(rs.getInt(1));
                dep.setTitulo(rs.getString(2));
                depts.add(dep);
            }
        }catch (NullPointerException | SQLException e){
            System.out.println("Ha ahocurrido un error");
        }
        dbHandler.CloseConnection();


        return depts;
    }
    public DepartamentoData getDepartmentbyID(int id){
        DepartamentoData dept = new DepartamentoData();
        ConnectionDB dbHandler = new ConnectionDB();
        String sql = "SELECT * FROM departamento WHERE idDepartamento = "+ id;
        dbHandler.selectData(sql);
        ResultSet rs = dbHandler.getData();
        try{
            while(rs.next()){
                dept.setId(rs.getInt(1));
                dept.setTitulo(rs.getString(2));
            }
        }catch (NullPointerException | SQLException e){
            dept.setId(0);
            dept.setTitulo("No hay departamento");
        }
        dbHandler.CloseConnection();

        return dept;
    }
    public ArrayList<DepartamentoData> getDepartmentsExceptID(int id){
        ArrayList<DepartamentoData> lista = new ArrayList<>();
        DepartamentoData dept = new DepartamentoData();
        ConnectionDB dbHandler = new ConnectionDB();
        String sql = "SELECT * FROM departamento WHERE idDepartamento <> ?";
        try{
            PreparedStatement statement = dbHandler.getCn().prepareStatement(sql);
            statement.setInt(1, id);

            ResultSet rs = statement.executeQuery();
            while(rs.next()){
                dept.setId(rs.getInt(1));
                dept.setTitulo(rs.getString(2));
                lista.add(dept);
            }
        }catch (NullPointerException | SQLException e){
            dept.setId(0);
            dept.setTitulo("No hay departamento");
            lista.add(dept);
        }
        dbHandler.CloseConnection();

        return lista;
    }
}
