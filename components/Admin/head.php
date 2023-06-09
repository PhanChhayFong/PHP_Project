<?php
include("DB/dbConnection.php");
include("DB/dbClass.php");
$get_company_logo = new dbClass();
$logo = $get_company_logo->dbSelectOne("tb_company", "cp_name,cp_icon");
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title><?= $logo['cp_name'] ?></title>
  <!-- cdn font-awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
  <!-- plugins:css -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">

  <link rel="stylesheet" href="../../assets/admin/vendors/jvectormap/jquery-jvectormap.css">
  <!-- Layout styles -->
  <link rel="stylesheet" href="../assets/admin/css/style.css">
  <!-- End layout styles -->
  <link rel="shortcut icon" href="../../assets/images/company/<?= $logo['cp_icon'] ?>" />

</head>

<body>
  <div class="container-scroller">
    <!-- Sidebar Component -->
    <?php require 'components/Admin/sidebar.php'; ?>
    <div class="container-fluid page-body-wrapper">
      <?php require 'components/Admin/navbar.php'; ?>
      <div class="main-panel">
        <div class="content-wrapper">
          <div class="row">