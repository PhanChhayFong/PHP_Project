<?php
date_default_timezone_set('Asia/Phnom_Penh');
$current_time = date('D d M Y, h:i A', time());

include_once "./DB/dbConnection.php";
include_once "./DB/dbClass.php";
$dbClass = new dbClass();

$table_transaction = "tb_transaction as ts";
$table_order = "tb_order as ord";

$field = "ts.id, ts.od_id, ts.tmode, ord.od_id, ord.totalPrice";
$condition = "";
$order = "";

$join_conditon = "ord.od_id = ts.od_id";
$table_join = $table_transaction . " INNER JOIN " . $table_order . " ON " . $join_conditon;
$transactions = $dbClass->dbSelect($table_join, $field, $condition, $order);

$total_paid_by_cash = 0;
$total_paid_by_card = 0;
$total_paid = 0;

if (!empty($transactions)) {
  foreach ($transactions as $transaction) {
    if ($transaction['tmode'] == "cash_on_delivery") {
      $total_paid_by_cash += $transaction['totalPrice'];
    } else if ($transaction['tmode'] == "card") {
      $total_paid_by_card += $transaction['totalPrice'];
    }
  }
}

$total_paid = $total_paid_by_cash + $total_paid_by_card;

$_SESSION['total_paid'] = $total_paid;
$_SESSION['total_paid_by_cash'] = $total_paid_by_cash;
$_SESSION['total_paid_by_card'] = $total_paid_by_card;


$heading_user = "User";
$heading_company = "Company";

// User
$table_user = "tb_user";

$field = "*";
$condition = "us_isAdmin != 0";

$users = $dbClass->dbSelect($table_user, $field, $condition);

// Company
$table_company = "tb_company";
$field = "*";
$condition = "cp_id = 1";

$company = $dbClass->dbSelectOne($table_company, $field, $condition);
?>

<div class="row">
  <div class="col-md-12 col-xl-4 grid-margin stretch-card">
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

  <div class="col-md-6 col-xl-4 grid-margin stretch-card">
    <div class="card">
      <div class="card-body">
        <h4 class="card-title">Transaction History</h4>
        <canvas id="transaction-history" class="transaction-chart"></canvas>
        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
          <div class="text-md-center text-xl-left">
            <h6 class="mb-1">Payment on Cash Delivery</h6>
            <p class="text-muted mb-0">
              <?= $current_time; ?>
            </p>
          </div>
          <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
            <h6 class="font-weight-bold mb-0">$
              <?= number_format($total_paid_by_cash, 2) ?>
            </h6>
          </div>
        </div>
        <div class="bg-gray-dark d-flex d-md-block d-xl-flex flex-row py-3 px-4 px-md-3 px-xl-4 rounded mt-3">
          <div class="text-md-center text-xl-left">
            <h6 class="mb-1">Tranfer to Stripe</h6>
            <p class="text-muted mb-0">
              <?= $current_time; ?>
            </p>
          </div>
          <div class="align-self-center flex-grow text-right text-md-center text-xl-right py-md-2 py-xl-0">
            <h6 class="font-weight-bold mb-0">$
              <?= number_format($total_paid_by_card, 2) ?>
            </h6>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="col-md-6 col-xl-4 grid-margin stretch-card">
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

<script>
  window.total_paid = <?php echo json_encode($_SESSION['total_paid']); ?>;
  window.total_paid_by_cash = <?php echo json_encode($_SESSION['total_paid_by_cash']); ?>;
  window.total_paid_by_card = <?php echo json_encode($_SESSION['total_paid_by_card']); ?>;
</script>