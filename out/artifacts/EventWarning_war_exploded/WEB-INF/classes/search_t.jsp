<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML>
<html>
    <div class="buttons">
        <div class="search">
          <form action="union.jsp" method="get">
	        <select id="tg" name="tg">
	            <option value="0">食品</option>
	            <option value="1">地区</option>
	            <option value="2">类别</option>
	        </select>
            <input type="text" id="skey" name="skey" value="Quick Search...." onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}">
            <input type="submit" value="">
          </form>
        </div>
      <div class="clear"></div>
    </div>
</html>