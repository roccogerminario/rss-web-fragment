<%@ page import="com.liferay.portal.kernel.util.GetterUtil" %>

<%@ page import="com.sun.syndication.feed.synd.SyndContent" %>

<%@ page import="java.lang.reflect.Field" %>

<%
boolean showEntryDescription = GetterUtil.getBoolean(portletPreferences.getValue("showEntryDescription", null), false);
%>
