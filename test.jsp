<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>인터넷 정보</title>
</head>
<body>
  <script>
    // 인터넷 연결 상태 확인 함수
    function checkInternetConnection() {
      var connectionStatusElement = document.getElementById("connectionStatus");
      if (connectionStatusElement) {
    	  connectionStatusElement.textContent = "인터넷에 연결됨";
    	}

      var connectionTypeElement = document.getElementById("connectionType");
      var externalIPElement = document.getElementById("externalIP");
      
      // navigator 객체를 사용하여 온라인 상태 확인
      if (navigator.onLine) {
        connectionStatusElement.textContent = "인터넷에 연결됨";

        // 연결 방식 확인 (navigator.connection은 deprecated일 수 있습니다.)
        if (navigator.connection && navigator.connection.effectiveType) {
          connectionTypeElement.textContent = navigator.connection.effectiveType;
        } else {
          connectionTypeElement.textContent = "확인 중...";
        }

        // 외부 IP 주소 확인
        fetch("https://api64.ipify.org?format=json")
          .then(response => response.json())
          .then(data => {
            externalIPElement.textContent = data.ip;
          })
          .catch(error => {
            externalIPElement.textContent = "확인 중...";
          });
      } else {
        connectionStatusElement.textContent = "인터넷에 연결되지 않음";
        connectionTypeElement.textContent = "N/A";
        externalIPElement.textContent = "N/A";
      }
    }

    // 페이지 로드 시 인터넷 연결 상태 확인
    checkInternetConnection();

    
    
    
    
    
    
    
    
    
    
    
    // 온라인 및 오프라인 이벤트에 대한 이벤트 리스너 추가
    window.addEventListener("online", checkInternetConnection);
    window.addEventListener("offline", checkInternetConnection);
  </script>
	<div style="position:fixed; left:170px; top:40px;padding: 20px;">
	  <table border="1">
	    <tr>
	      <td>인터넷 연결 상태</td>
	      <td id="connectionStatus">.</td>
	    </tr>
	    <tr>
	      <td>인터넷 연결 방식</td>
	      <td id="connectionType">.</td>
	    </tr>
	    <tr>
	      <td>외부 IP 주소</td>
	      <td id="externalIP">.</td>
	    </tr>
	  </table>
  </div>
  
  	<jsp:include page="test1.jsp" />
	<jsp:include page="test2.jsp" />
  
</body>
</html>
