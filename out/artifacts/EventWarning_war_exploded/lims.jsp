<span style="font-size:12px;"><span style="font-size:14px;"><%@ page language="java" import="java.sql.*,java.io.*,java.util.*"%>  
<%@ page contentType="text/html;charset=utf-8"%>  
<html>  
<head>  
<style type="text/css">  
table {  
    border: 2px #CCCCCC solid;  
    width: 360px;  
}  
  
td,th {  
    height: 30px;  
    border: #CCCCCC 1px solid;  
}  
</style>  
</head>  
<body>  
    <%  
        //驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "root";
        //数据库名   
        String dbName = "test";
        //表名   
        String tableName = "foodlims";  
        //联结字符串   
        String url = "jdbc:mysql://192.168.0.103:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sql = "SELECT * FROM " + tableName;  
        ResultSet rs = statement.executeQuery(sql);  
    %>  
    <br>  
    <br>  
    <table align="center">  
        <tr>  
            <th>  
                <%  
                    out.print("样品号");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("样品名称");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("最后更新时间");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("状态");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("项目名称");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("单位");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("标准要求");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("结果");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("是否合格");  
                %>  
            </th>  
        </tr>  
  
        <%  
            while (rs.next()) {  
        %>  
        <tr>  
            <td>  
                <%  
                    out.print(rs.getString(3));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(4));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(5));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(7));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(10));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(11));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(12));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(13));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs.getString(14));  
                %>  
            </td>  
            
        </tr>  
        <%  
            }  
        %>  
    </table>  
    <div align="center">  
        <br> <br> <br>  
        <%  
            out.print("数据查询成功，恭喜你");  
        %>  
    </div>  
    <%  
        rs.close();  
        statement.close();  
        connection.close();  
    %>  
</body>  
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">  
</span></span>  