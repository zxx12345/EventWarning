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
       // String category=request.getParameter("userName");
       String category="小米";
        //驱动程序名   
        String driverName = "com.mysql.jdbc.Driver";  
        //数据库用户名   
        String userName = "root";  
        //密码   
        String userPasswd = "root";
        //数据库名   
        String dbName = "test";
        //表名   
        String tableNamefsn = "foodfsn";  
        String tableNamelims= "foodlims";
        String tableNamekms="foodkms";
        String tableNameevent="event";
        //联结字符串   
        String url = "jdbc:mysql://192.168.0.103:3306/" + dbName + "?user="  
                + userName + "&password=" + userPasswd;  
        Class.forName("com.mysql.jdbc.Driver").newInstance();  
        Connection connection = DriverManager.getConnection(url);  
        Statement statement = connection.createStatement();  
        String sqlfsn = "SELECT count(*) FROM " + tableNamefsn+" where PRODCUT_NAME like \'%"+category+"%\'";  
        System.out.println(sqlfsn);
        ResultSet rs1 = statement.executeQuery(sqlfsn); 
        while (rs1.next()) {  
        System.out.println(rs1.getString(1));
        }
    %>  
    <br>  
    <br> 
    <table align="center">  
        <tr>  
         FSN
            <th>  
                <%  
                    out.print("产品名字");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("状态");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("型号");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("来源");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("适合年龄");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("保质期");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("类别");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("测试项目");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("结果");  
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
                    out.print("是否合格");  
                %>  
            </th>  
            <th>  
                <%  
                    out.print("检测类型");  
                %>  
            </th>  
        </tr>  
  
        <%  
            while (rs1.next()) {  
        %>  
        <tr>  
            <td>  
                <%  
                    out.print(rs1.getString(2));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(3));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(4));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(5));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(6));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(7));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(8));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(9));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(10));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(11));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(12));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(13));  
                %>  
            </td>  
            <td>  
                <%  
                    out.print(rs1.getString(14));  
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
        rs1.close();  
        statement.close();  
        connection.close();  
    %>  
</body>  
</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">  
</span></span>  