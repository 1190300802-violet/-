<%--
  Created by IntelliJ IDEA.
  User: paerxiusi
  Date: 2021/11/28
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html;" pageEncoding="gb2312"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="./labjs/jsbn.js"></script>
    <script type="text/javascript" src="./labjs/RSAUtils.js"></script>
    <script type="text/javascript" src="jquery-3.6.0.min.js"></script>
    <script type="text/javascript" src="./labjs/aes.js"></script>
    <script type="text/javascript" src="./labjs/aeslib.js"></script>
    <link rel="stylesheet" href="css/newpage.css">
    <link rel="stylesheet" href="css/font-awesome.css">

    <style>
        input::-webkit-input-placeholder {
            color:white;
        }
        input::-moz-placeholder {
            /* Mozilla Firefox 19+ */
            color: white;
        }
        input:-moz-placeholder {
            /* Mozilla Firefox 4 to 18 */
            color: white;
        }
        input:-ms-input-placeholder {
            /* Internet Explorer 10-11 */
            color: white;
        }
        span{
            color: white;
        }
    </style>
    <title>���</title>
</head>
<body>
<%--<form action="/ssh2-netBank/transaction/deposit" name="myform" method="post" onsubmit="return deposit()">--%>
<%--    <div align="center">--%>
<%--        <table>--%>
<%--            <tbody>--%>
<%--            <tr>--%>
<%--                <td>���ʱ�䣺</td>--%>
<%--                <td width="360" height="30">--%>
<%--                    <span id="now"></span>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td>����</td>--%>
<%--                <td width="360" height="30">--%>
<%--                    <input type="text" name="money" id="money" />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td></td>--%>
<%--                <td width="360" height="30">--%>
<%--                    <input type="button" value="���" id="confirmbutton" />--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            </tbody>--%>
<%--        </table>--%>
<%--    </div>--%>
<%--</form>--%>
<form action="#" method="POST">
    <div id="login-box">
        <h1>���</h1>
        <div class="form">
            <div class="item">
                <i class="fa fa-user-circle" aria-hidden="true"></i>
                <span id="now"></span>
            </div>

            <div class="item">
                <i class="fa fa-key" aria-hidden="true"></i>
                <input type="text" name="money" id="money" />
            </div>
        </div>
        <input type="button" value="���" id="confirmbutton" />
    </div>
</form>
<script type="text/javascript">
    function showTime(){
        //ʹ�ö���.innerText�޸�spanԪ�ؼ������
        document.getElementById("now").innerText=new Date().toLocaleString();
    }
    setInterval("showTime()",1000);//ÿ��1000����(1s)����showTime����
</script>
</body>
<footer>
    <div id="message-box">Hello,Welcome to Dream Bank</div>
</footer>
<script type="text/javascript">
    //�õ�˽Կ
    <%--var privkey='<%=request.getSession().getAttribute("privkey")%>';--%>
    <%--console.log(privkey);--%>
    var result;
    // //�ж��û�����Ĵ�����Ƿ����
    // function deposit() {
    //     var money = document.getElementById("tr_money").value;
    //     //alert(money.length);
    //     if(money.length>0) {
    //         if(!(money.search(/^[\+\-]?\d+\.?\d*$/)==0)) {
    //             document.getElementById("errormoney").innerHTML="���зǷ��ַ�!";
    //             return false;
    //         }else {
    //             if(parseFloat(money)==0) {
    //                 document.getElementById("errormoney").innerHTML="���������0!";
    //                 return false;
    //             }
    //             return confirm("ȷ�ϴ����?");
    //         }
    //     } else {
    //         document.getElementById("errormoney").innerHTML="����Ϊ�գ�";
    //         return false;
    //     }
    // }
    $(function() {
        $("#confirmbutton").click(function () {
            //�ж������Ƿ�Ϸ�
            var money = document.getElementById("money").value;
            //alert(money.length);
            if(money.length>0) {
                if(!(money.search(/^[\+\-]?\d+\.?\d*$/)===0)) {
                    alert("���зǷ��ַ�!");
                    return false;
                }else {
                    if(parseFloat(money)===0) {
                        alert("���������0!");
                        return false;
                    }
                }
            } else {
                alert("����Ϊ�գ�");
                return false;
            }
            //��˽Կ��������
            result = money;
            $.ajax({
                url: 'deposit',//��������ĵ�ַ
                type: 'POST',  //����ʽ��Ĭ��ΪGET
                dataType: "json",//����ֵ����
                data: {
                    "money":result
                },
                success: (data) => {
                    // alert(data);
                    alert(data.flag);
                    if (data.flag) {
                        alert("���ɹ���");
                    } else {
                        alert("���ʧ�ܣ���");
                    }
                }
            });
            alert("����ɹ�");
            return true;
        });
    })
</script>
</html>
