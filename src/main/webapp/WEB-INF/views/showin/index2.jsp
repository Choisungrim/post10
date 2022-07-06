<!DOCTYPE html>
<html>
  <head>
    <meta charset=UTF-8 />
    <link rel="stylesheet" type="text/css" href="resources/styles.css" />
    <link href="https://fonts.googleapis.com/css?family=Raleway&display=swap" rel="stylesheet"> 
    <style>
#post{
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  font-size: 18pt;
  color:red;
}
#c{
  background: url("resources/laptop-g9822c0f6b_1920.jpg") no-repeat center center;
  background-size: cover;
  object-fit:cover
}
  </style>
  </head>
  <body>
    <div id = "c">
    </div>
  <script src = "resources/jquery-3.2.1.min.js"></script>
  <script src="resources/three.min.js"></script>
  <script>    
    let scene, camera, renderer, plane1, controls, raycaster,mouse,textuer;
    let flag = false
    var objects = [];
    
 
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

      var planeGeometry1 = new THREE.PlaneGeometry(8,8,10);
      var planeMaterial1 = new THREE.MeshBasicMaterial({
        color:0xFAFAD2,
        side:THREE.DoubleSide,
      })
      plane1 = new THREE.Mesh(planeGeometry1,planeMaterial1)
      
      plane1.position.set(0,10,1);
      plane1.rotation.x = -0.5*Math.PI;
      
      scene.add(plane1)
      objects.push(plane1);

      raycaster = new THREE.Raycaster();
      renderer = new THREE.WebGLRenderer();
      mouse = new THREE.Vector2();

      mouse.x = mouse.y = -1;;
      renderer.setSize(window.innerWidth+12, window.innerHeight+30);
      document.getElementById('c').appendChild(renderer.domElement);
      document.addEventListener("click",onMouseDown,false)
    }
    

    function onMouseDown(e) {
      let gap1 = e.clientX - e.offsetX
      let gap2 = e.clientY - e.offsetY
      mouse.x = ( (e.clientX - gap1)/(window.innerWidth) )*2 -1;
      mouse.y =  -( (e.clientY-gap2)/(window.innerHeight) )*2 +1;
      console.log(mouse)
      raycaster.setFromCamera(mouse,camera);
    }
    window.addEventListener("resize", onWindowResize, true);

    function onWindowResize() {
      camera.aspect = window.innerWidth / window.innerHeight;
      camera.updateProjectionMatrix();
      renderer.setSize(window.innerWidth, window.innerHeight);
    }
    
    
    function animate() {
      
      if(!flag){
        if(plane1.position.y >= 10){
          plane1.position.x -=1
          plane1.position.y +=1
          plane1.position.z +=0.5
        } 
        if (plane1.position.y >95){
          plane1.position.set(-85,95,43.5);
          flag = true
        }
      }
      else {
          let intersects = raycaster.intersectObjects(scene.children);
          intersects.forEach(obj=>{
            if(obj.object.position.y > 10){
              obj.object.position.x +=1,
              obj.object.position.y -=1, 
              obj.object.position.z -=0.5
            }else {
              plane1.position.set(0,10,1);
            }
        });
      }
      
      requestAnimationFrame(animate);
      renderer.render(scene, camera);
    }
    
    init();
    animate();
    </script>
  </body>
</html>
