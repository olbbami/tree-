<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#contextmenu {
	text-align: left;
}

#modal.modal-overlay {
	width: 100%;
	height: 100%;
	position: absolute;
	left: 0;
	top: 0;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	background: rgba(255, 255, 255, 0.25);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(1.5px);
	-webkit-backdrop-filter: blur(1.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
}

#modal .modal-window {
	background: rgba(69, 139, 197, 0.70);
	box-shadow: 0 8px 32px 0 rgba(31, 38, 135, 0.37);
	backdrop-filter: blur(13.5px);
	-webkit-backdrop-filter: blur(13.5px);
	border-radius: 10px;
	border: 1px solid rgba(255, 255, 255, 0.18);
	width: 400px;
	height: 500px;
	position: relative;
	top: -100px;
	padding: 10px;
}

#modal .title {
	padding-left: 10px;
	display: inline;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .title h2 {
	display: inline;
}

#modal .close-area {
	display: inline;
	float: right;
	padding-right: 10px;
	cursor: pointer;
	text-shadow: 1px 1px 2px gray;
	color: white;
}

#modal .content {
	margin-top: 20px;
	padding: 0px 10px;
	text-shadow: 1px 1px 2px gray;
	color: white;
}
</style>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script>
	$(function() {
		var Contextmenu = !function() {
			var id = 'contextmenu';
			{
				var div = document.createElement('div');
				div.id = id;
				div.style = 'display:none;position:fixed;width:150px; height:200px; background: #fff;box-shadow:1px 1px 5px 0 rgba(0, 0, 0, 0.54)';

				var hTag1 = "쪽지 보내기<br>";
				var hTag2 = "일감 요청하기<br/>";
				var hTag3 = "칭찬하기<br/>";
				$(div).append(hTag1);
				$(div).append(hTag2);
				$(div).append(hTag3);

				document.body.appendChild(div);
			}
			var div = document.getElementById(id);
			document.addEventListener("contextmenu", function(e) {
				e.preventDefault();

				var x = e.pageX + 'px';
				var y = e.pageY + 'px';
				div.style.display = 'block';
				div.style.left = x;
				div.style.top = y;
			})
			document.addEventListener("click", function(e) {
				div.style.display = 'none'
			})
		}()

		// 여기서 btn-modal은 우클릭 시 나타나는 각각의 메뉴들에 해당하는 태그들의 아이디 값으로 생각하면 좋을 듯
		// 우클릭 시 나타나는 메뉴들의 각각의 태그에 id값들을 주고 onclick=myfunc(this)로 함수를 넣어준 뒤에 
		// 아래 함수를 통해서 내가 클릭하고자 하는 모달이 뭔지 정해줄 수 있음 
		function myfunc(a){   
			var id = $(a).attr("id");
			const modal = document.getElementById(id);
			modalOn();
		}
		
		
// 		const btnModal = document.getElementById("btn-modal")
// 		btnModal.addEventListener("click", e => {
// 		    modalOn()
// 		})
		
// 		const modal = document.getElementById("modal")

		
		function modalOn() {
		    modal.style.display = "flex"
		}
		
		function isModalOn() {
		    return modal.style.display === "flex"
		}
		
		function modalOff() {
		    modal.style.display = "none"
		}
		
		
		const closeBtn = modal.querySelector(".close-area")
		closeBtn.addEventListener("click", e => {
		    modalOff()
		})
		
		// 모달창 바깥 영역 클릭 시 모달창이 꺼지게 됨 
// 		modal.addEventListener("click", e => {
// 		    const evTarget = e.target
// 		    if(evTarget.classList.contains("modal-overlay")) {
// 		        modalOff()
// 		    }
// 		})
	})
</script>
<body>
	<h2>hello World</h2>

	<div id="container">
		<button id="btn-modal">모달 창 열기 버튼</button>
<!-- 		<div id="lorem-ipsum"></div> -->
	</div>
	
	<div style="display : none;" id="modal" class="modal-overlay">
		<div class="modal-window">
			<div class="title">
				<h2>모달</h2>
			</div>
			<div class="close-area">X</div>
			<div class="content">
				<p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p>
				<p>가나다라마바사 아자차카타파하</p>

			</div>
		</div>
	</div>


</body>
</html>