<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8 />
<link rel="stylesheet" type="text/css" href="resources/styles.css" />
<link
	href="https://fonts.googleapis.com/css?family=Raleway&display=swap"
	rel="stylesheet">
<style>
#text-box1 {
	height: 100%;
	margin-left: 10px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}

#post {
	height: 100%;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	font-size: 18pt;
	color: red;
}

.heading {
	color: red;
}

canvas {
	background: url("resources/laptop-g9822c0f6b_1920.jpg") no-repeat center
		center;
	background-size: cover;
	object-fit: cover
}

img {
	position: relative;
	z-index: -9999;
}

div#text-box1.hidden {
	display: none;
}

.hidden {
	display: none;
}

textarea {
	text-align: center;
}

.btnbox {
	display: flex;
	justify-content: center;
}

.btn {
	width: 200px;
	background-color: #fafad2;
	border: 1px solid white;
	margin-top: -80px;
	font-size: 18pt
}
</style>
</head>
<body>
	<div class="text-box" id="text-box1">
		<div class="postbox" id="postbox">
			<div id="post">Window Click there</div>
		</div>
		<div class="hidden" id="text-box1">
			<form method=get action=save type=submit>
				<textarea id="test" class=hidden
					style="height: 733px; width: 750px; background: #fafad2; font-size: 24pt" 
					onkeyup="enterkey()"></textarea>
				<div class="btnbox">
					<button type=submit class=btn>저장</button>
					<button type=reset class=btn>취소</button>
				</div>
			</form>
		</div>
	</div>

	<canvas id="c">
  <img crossorigin=anonymous src=resources/laptop-g9822c0f6b_1920.jpg>
</canvas>
	<script src="resources/jquery-3.2.1.min.js"></script>
	<script src="resources/three.min.js"></script>
	<script>    
    var scene, camera, renderer, stars, starGeo ,plane1, controls,a=1;
    var flag = false
    let array = [];
    let code1 = {
			codename : '001',
			postitcode : '001',
			content : $('#test').val()
		}
    $.ajax({
    	type : 'get',
    	url : 'list',
    	success : (content1) =>{
    		let length = content1.content1.length;
    		console.log(length)
    		for(let i = 0; i < length; i++){
    			array = content1.content1[i].codename.split('#')
    			if(array[i] == code1.codename && code1.codename != '000'){
    				code1.codename = "00"+(i+1)
					console.log("arr"+array[i])
    			}
    		}
    		document.getElementById("test").classList.add('hidden')
    	}
    })
    init();
    function init() {
      const canvas = document.querySelector('#c');

      scene = new THREE.Scene();
      const loader = new THREE.TextureLoader();
      const bgTexture = loader.load('resources/laptop-g9822c0f6b_1920.jpg');
      scene.background = bgTexture;
      scene.autoUpdate = true;

      camera = new THREE.PerspectiveCamera(60,window.innerWidth / window.innerHeight, 1, 1500);
      camera.position.z = 1;  
      camera.rotation.x = Math.PI/2;

      renderer = new THREE.WebGLRenderer({
        canvas,
        alpha:true,
      });
      
      renderer.setSize(window.innerWidth+12, window.innerHeight+30);
      document.body.appendChild(renderer.domElement);

      var planeGeometry1 = new THREE.PlaneGeometry(8,8,10);
      var planeMaterial1 = new THREE.MeshBasicMaterial({
          color:0xFAFAD2,
          side:THREE.DoubleSide,
      })
      plane1 = new THREE.Mesh(planeGeometry1,planeMaterial1)
      plane1.position.set(-85,95,43.5);
      plane1.rotation.x = -0.5*Math.PI;
      scene.add(plane1)
      

      window.addEventListener("resize", onWindowResize, true);
      
      function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
      }
      renderer.render(scene, camera);
    }

    setTimeout(() => {
      animate();

    }, 1000);
    function animate() {
      
      $('.hidden').removeClass("hidden");
      $('.postbox').addClass("hidden")
      $('#text-box1').addClass("hidden")

        if(plane1.position.y>10){
          plane1.position.x +=1
          plane1.position.y -=1
          plane1.position.z -=0.5
        } else {
          plane1.position.set(0,10,1);
        }
        requestID = requestAnimationFrame(animate)
		renderer.render(scene,camera)
        
        setInterval(() => {
            cancelAnimationFrame(requestID)
            $("#text-box1").removeClass('hidden')
           		    
          }, 1800);
		}

  function enterkey(e) {
    if (window.event.keyCode == 13) {
      console.log($('#test').val())
	}
}
	

  function click1() {
   document.getElementById('test').value = `당신의 코드는 ${'code1.codename'}#${'code1.postitcode'} 입니다.`;
   console.log(replace(document.getElementById('test').value),8,15);
   document.getElementById("test").classList.add('hidden')
   
    $.ajax({
        url : 'save',
        type : 'get',
        data : {code : code1.codename,
                postit : code1.postitname,
                content : code1.content},
        success : ()=>{
          alert('success');
		    code1.postitname = "00"+(a)
		    a++;
        },
        error : ()=>{
          alert("fail");
        }
      })
}
    </script>
</body>
</html>
