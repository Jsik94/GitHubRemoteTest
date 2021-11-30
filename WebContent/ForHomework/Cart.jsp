<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart.jsp</title>
<script>

	/*	
	틀린이유 : 체크를 enabled로 해서 장바구니를 편하게 움직이려고했는데 사용자 입장에선 불편할 수 있음 disabled 코드 하나를 추가해야했음
	*/
	//체크저장용
	var save = new Array();
	
	function onAddList(){
		var data = this.save;
		var elements = document.getElementsByName("cart");
		
		for(var idx  = 0 ; idx < elements.length ;idx++){
			 if( elements.item(idx).checked ==true){
					if(data.indexOf(elements.item(idx).value)==-1){
						elements.item(idx).disabled=true;
						data.push(elements.item(idx).value);
						// console.log(elements.item(idx));
						console.log(elements.item(idx).value.slice(-2,elements.item(idx).value.length));
					}

			 }
		}

		console.log("%O",data);
	}
	



	function onClear(){
		var elements = document.getElementsByName("cart");
		
		for(var idx  = 0 ; idx < elements.length ;idx++){
			elements.item(idx).checked =false;
			elements.item(idx).disabled =false;
		}

		var output = document.getElementsByTagName("ul")[0];
		output.innerText ="";
		this.save = new Array();
	}



	function onShowList(){
				var data = this.save;
				var output = document.getElementsByTagName("ul")[0];
				var lis ="";

				console.log("%O",output)


				data.sort();
				if(data.length ==0 ){
					alert('담은 항목이 없습니다!');
				}else{
					data.forEach(function(e){
						var nogada = parseInt(e.slice(-2,e.length));
						console.log(nogada);
						lis += "<li>"+"상품 "+nogada+"</li>";
					})
				}

				output.innerHTML = lis;

	}


			


</script>
</head>
<body>
	<fieldset>
		<legend>웹스토리지를 이용한 장바구니 예제</legend>		
			<input type="checkbox" name="cart" value="P21001"/> 상품1 
			<input type="checkbox" name="cart" value="P21002"/> 상품2 
			<input type="checkbox" name="cart" value="P21003"/> 상품3 
			<input type="checkbox" name="cart" value="P21004"/> 상품4 
			<input type="checkbox" name="cart" value="P21005" /> 상품5 
			<input type="checkbox" name="cart" value="P21006"/> 상품6 
			<input type="checkbox" name="cart" value="P21007"/> 상품7 
			<input type="checkbox" name="cart" value="P21008"/> 상품8 
			<input type="checkbox" name="cart" value="P21009"/> 상품9 
			<input type="checkbox" name="cart" value="P21010"/> 상품10
				
	</fieldset>
	<hr/>
	<fieldset>
		<input type="button" value="장바구니 담기" onclick="onAddList()"/>		
		<input type="button" value="장바구니 비우기" onclick="onClear()"/>
		<input type="button" value="장바구니 보기"  onclick="onShowList()" />		
	</fieldset>
	<ul>
	<!--장바구니 보기 버튼 클릭시 여기에 상품 목록을 뿌려줘라 -->
	</ul>
</body>
</html>