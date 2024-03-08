<?php

require 'config/config.php';
require 'config/database.php';
$db = new Database();
$con = $db->conectar();

$sql = $con->prepare("SELECT id, nombre, precio FROM productos WHERE activo=1"); /* con esto generamos consultas preparadas */
$sql->execute();
$resultado = $sql->fetchAll(PDO::FETCH_ASSOC);  /* con esto estamos consultando la tabla entera */

//session_destroy();

//print_r($_SESSION);

?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda Online</title>
    <!-- cdn servidores que almacenan bibliotecas  -->
    <!-- CDN busca el mas cercano al usuario que está solicitando la página dando el recurso, siendo mas veloz y consumiendo menos recursos -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link href="css/estilos.css" rel="stylesheet">
</head>
<body>

<header data-bs-theme="dark">
  
  <div class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a href="#" class="navbar-brand">
        <strong>WebTech Solutions</strong>
      </a>
      <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarHeader" aria-controls="navbarHeader" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class= "collapse navbar-collapse" id ="navbarHeader">
        <ul class ="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
                <a href="#" class="nav-link active">Catálogo</a>

            </li>

            <li class="nav-item">
                <a href="#" class="nav-link">Contacto</a>

            </li>
        </ul>
        
        <a href="checkout.php" class="btn btn-primary">
            Carrito <span id = "num_cart" class = "badge bg-secondary"><?php echo $num_cart; ?></span>
        </a>
        
      </div>


    </div>
  </div>
</header>
<!-- contenido -->
<main>
    <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">  <!-- Agrega una fila en la cual indicamos que cuando sea un tamaño pequeño tenga una sola columna, cuando sea mas grande tenga mas y cunado sea aun mas grande sea mucho mas grande -->
            <?php foreach($resultado as $row) { ?>
                <div class="col">
                    <div class="card shadow-sm">
                        <?php 

                        $id = $row['id'];
                        $imagen = "images/productos/$id/principal.jpg";

                        if(!file_exists($imagen)){
                            $imagen = "images/no_photo.jpg";

                        }
                        ?>
                        <img src="<?php echo $imagen; ?>">
                        <div class="card-body">
                            <h5 class="card-title"><?php echo $row['nombre']; ?></h5> <!-- h5 para el titulo del producto -->
                            <p class="card-text"> $ <?php echo number_format($row['precio'], 2, '.',','); ?></p>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="btn-group">
                                    <a href="details.php?id=<?php echo $row['id']; ?>&token=<?php echo hash_hmac('sha1' , $row['id'], KEY_TOKEN); ?>" class="btn btn-primary">Detalles</a>
                                </div>
                                <button class ="btn btn-outline-success" type="button" onclick="addProducto(<?php echo $row['id']; ?>, '<?php echo hash_hmac('sha1' , $row['id'], KEY_TOKEN); ?>')">Agregar al carrito</button>
                            </div>
                        </div>
                    </div>
                </div>
            <?php } ?>
</main>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>

<script>
    function addProducto(id, token){  /* enviamos mediante ajax para actualizar en tiempo real los datos del carrito de compras */
        let url = 'clases/carrito.php'
        let formData = new FormData()
        formData.append('id' , id)
        formData.append('token' , token)  

        fetch(url, {
            method: 'POST',
            body: formData,
            mode: 'cors'
        }).then(response=> response.json())
        .then(data => {
            if(data.ok){
                let elemento = document.getElementById("num_cart")
                elemento.innerHTML = data.numero 
            }
        })
    }
</script>

</body>
</html>