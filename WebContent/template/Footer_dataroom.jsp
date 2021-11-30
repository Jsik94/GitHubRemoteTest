<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- jQuery (부트스트랩의 자바스크립트 플러그인을 위해 필요합니다) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<!-- 모든 컴파일된 플러그인을 포함합니다 (아래), 원하지 않는다면 필요한 각각의 파일을 포함하세요 -->

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	console.log('%O', document.querySelectorAll("#collapse-menu > ul > li"));

	var gnb = document.querySelectorAll("#collapse-menu > ul > li");

	gnb.forEach(function(nb) {
		/*
		console.log(node.innerHTML);
		console.log('%O',node);
		console.log(index);
		 */
		nb.onclick = function() {
			console.log(this);
			removeAll(gnb);
			if (!this.getAttribute('class')) {
				this.setAttribute('class', "active");
			}

		}
	});

	function removeAll(nodes) {
		nodes.forEach(function(node) {
			if (node.getAttribute('class') == 'active') {

				node.removeAttribute('class');
			}
		})
	};
</script>

</body>
</html>