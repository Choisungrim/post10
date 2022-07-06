<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset= UTF-8/>
<link rel="stylesheet" type="text/css" href="resources/styles.css" />
<link
	href="https://fonts.googleapis.com/css?family=Raleway&display=swap"
	rel="stylesheet">
<style>
body {
	display: flex;
	flex-direction: column;
	align-content: center;
	justify-content: center;
	align-items: center;;
}

.hidden {
	display: none;
}
</style>
</head>
<body>
	<div class="text-box">
		<div class="heading">To infinity and Beyond</div>
		<div class="button-wrapper">
			<div class="button" onclick="change()">새로운 파일</div>
			<div class="button" onclick="load()">파일 불러오기</div>
			<div class="button"><a href = list>list</a></div>
		</div>
	</div>
	<div id=content class=hidden></div>

	<script src="resources/three.min.js"></script>
	<script src="resources/jquery-3.2.1.min.js"></script>
	<script>
    var scene, camera, renderer, stars, starGeo;

    function init() {

      scene = new THREE.Scene();

      camera = new THREE.PerspectiveCamera(60,window.innerWidth / window.innerHeight, 1, 1000);
      camera.position.z = 1;
      camera.rotation.x = Math.PI/2;

      renderer = new THREE.WebGLRenderer();
      renderer.setSize(window.innerWidth, window.innerHeight);
      document.body.appendChild(renderer.domElement);

      starGeo = new THREE.Geometry();
      for(let i=0;i<6000;i++) {
        star = new THREE.Vector3(
          Math.random() * 600 - 300,
          Math.random() * 600 - 300,
          Math.random() * 600 - 300
        );
        star.velocity = 0;
        star.acceleration = 0.02;
        starGeo.vertices.push(star);
      }

      let sprite = new THREE.TextureLoader().load( 'resources/star.png' );
      let starMaterial = new THREE.PointsMaterial({
        color: 0xaaaaaa,
        size: 0.7,
        map: sprite
      });

      stars = new THREE.Points(starGeo,starMaterial);
      scene.add(stars);

      window.addEventListener("resize", onWindowResize, false);

      animate(); 
    }
    function onWindowResize() {
        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();
        renderer.setSize(window.innerWidth, window.innerHeight);
      }

    function animate() {
      starGeo.vertices.forEach(p => {
        p.velocity += p.acceleration
        p.y -= p.velocity;
        
        if (p.y < -200) {
          p.y = 200;
          p.velocity = 0;
        }
      });
      starGeo.verticesNeedUpdate = true;
      stars.rotation.y +=0.002;
    
      renderer.render(scene, camera);
      requestAnimationFrame(animate);
    }

    function change() {
        document.querySelector('.text-box').classList.add('hidden');
        document.querySelector('#content').classList.remove('hidden');
        starGeo.vertices.forEach(p => {
            p.velocity += p.acceleration+1
            p.y -= p.velocity;
            
            if (p.y < -200) {
            p.y = 200;
            p.velocity = 0;
            }
        });
        setTimeout(() => {
        	$.ajax({
        		type:'Get',
        		url :'indexf',
        		success : (result)=>{
        			$('body').html(result,true);
        		},
        	})
        }, 2000);
       }

    function load(){
            setTimeout(() => {
                document.querySelector('.text-box').classList.add('hidden');
                document.querySelector('#content').classList.remove('hidden');
                document.getElementById("content").innerHTML=`<input type = text id = loadcode placeholder = "코드를 입력하세요." style= "width:682px; height:50px; text-align = center" onkeyup ="enterkey()">` 
            }, 1000);
        }   

    function enterkey() {
            let code = { codename : document.getElementById('loadcode').value}
            if (window.event.keyCode == 13) {
                // 엔터키가 눌렸을 때
                console.log(code)
                if(code.codename.length > 1){
                    starGeo.vertices.forEach(p => {
                        p.velocity += p.acceleration+1
                        p.y -= p.velocity;
                        
                        if (p.y < -200) {
                        p.y = 200;
                        p.velocity = 0;
                        }
                    });
                    document.getElementById("content").classList.add('hidden');
                    $.ajax({
                		type:'Get',
                		url :'login',
                		data : {code:code.codename},
                		success : (result,content)=>{
                			$('body').html(result,true);
                		},
                		error:()=>{
                			alert('11');
                		}
                	})
                }
            }
            event.stopPropagation();
        }
    init();
    </script>
</body>
</html>
