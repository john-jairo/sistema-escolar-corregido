<?php
if (!empty($_GET['curso']) || empty($_GET['contenido'])) {
    $curso = $_GET['curso'];
    $contenido = $_GET['contenido'];
} else {
    header("Location: alumno/");
}
require_once 'includes/header.php';
require_once '../includes/conexion.php';

$idalumno = $_SESSION['alumno_id'];

$sql = "SELECT *,date_format(fecha,'%d/%m/%Y') as fecha FROM evaluaciones WHERE contenido_id = $contenido";
$query = $pdo->prepare($sql);
$query->execute();
$row = $query->rowCount();
?>

<main class="app-content">
    <div class="app-title">
        <div>
            <h1><i class="fa fa-dashboard"></i>Ver Evaluación</h1>
        </div>
        <ul class="app-breadcrumb breadcrumb">
            <li class="breadcrumb-item"><i class="fa fa-home fa-lg"></i></li>
            <li class="breadcrumb-item"><a href="#">Ver Evaluación</a></li>
        </ul>
    </div>
    <div class="row">
        <?php if ($row > 0) {
            while ($data = $query->fetch()) {
        ?>
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-title-w-btn">
                            <h3 class="title"><?= $data['titulo']; ?></h3>
                            <p><a class="btn btn-warning icon-btn" href="entregas.php?curso=<?= $data['contenido_id']; ?>&contenido=<?= $data['contenido_id']; ?>&eva=<?= $data['evaluacion_id'] ?>"><i class="fa fa-edit"></i>Realizar Entrega</a></p>
                        </div>
                        <div class="tile-body">
                            <h4><b><?= $data['descripcion']; ?></b><br><br></h4>
                            <h5><b>Fecha de Entrega: <kbd class="bg-secondary"><?= $data['fecha']; ?></kbd></b><br><br></h5>
                            <H5><b>Valor: <?= $data['porcentaje']; ?></b></H5>
                        </div>
                    </div>
                </div>
        <?php }
        } ?>
    </div>
    <div class="row">
        <a href="contenido.php?curso=<?= $curso ?>" class="btn btn-info">
            << Volver Atrás</a>
    </div>
</main>

<?php
require_once 'includes/footer.php';
?>