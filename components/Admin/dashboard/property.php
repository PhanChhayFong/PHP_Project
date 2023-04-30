<?php

include_once "./DB/dbConnection.php";
include_once "./DB/dbClass.php";
$dbClass = new dbClass();
$heading_user = "User";
$heading_company = "Company";

// User
$table_user = "tb_user";

$field = "*";
$condition = "us_isAdmin != 0";
$order = "";

$users = $dbClass->dbSelect($table_user, $field, $condition, $order);


// Company
$table_company = "tb_company";
$field = "*";
$condition = "cp_id = 1";


$company = $dbClass->dbSelectOne($table_company, $field, $condition, $order);
?>

<div class="row">
  <div class="col-md-12 col-xl-6 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <div class="d-flex flex-row justify-content-between">
          <h4 class="card-title">Company</h4>
        </div>
        <div class="preview-list text-center">

          <img src="../../../assets/images/<?= strtolower($heading_company) ?>/<?= $company['cp_logo']; ?>"
            class="card-img-top company-logo mb-4" width="25">
          <h3 class="card-title fw-bold">
            <?= $company['cp_name'] ?>
          </h3>
          <p class="card-text"><a href="mailto:<?= $company['cp_email'] ?>" class="text-decoration-none text-light"><?= $company['cp_email'] ?></a></p>
          <p class="card-text"><a href="tel:<?= $company['cp_phone'] ?>" class="text-decoration-none text-light"><?= $company['cp_phone'] ?></a></p>
          <p class="card-text">
            <?= $company['cp_address'] ?>
          </p>

        </div>
      </div>
    </div>
  </div>

  <div class="col-md-12 col-xl-6 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Team Members</h4>
        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
          <div class="carousel-inner">
            <?php
            if (!empty($users)) {
              $index = 1;
              foreach ($users as $user) {
                ?>
                <div class="carousel-item <?= $index == 1 ? "active" : "" ?>">
                  <div class="card card-carousel py-0 mx-auto">
                    <img src="../../../assets/images/<?= strtolower($heading_user) ?>/<?= $user['us_image']; ?>"
                      class="card-img-top" style="max-height:350px;">
                    <div class="card-body text-center py-0 mt-3">
                      <h5 class="card-title fw-bold">
                        <?= $user['us_name'] ?>
                      </h5>
                    </div>
                  </div>
                </div>
                <?php
                $index++;
              }
            }
            ?>
          </div>
          <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
          </a>
          <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
          </a>
        </div>
      </div>
    </div>
  </div>

</div>