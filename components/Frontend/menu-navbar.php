<?php
if (isset($_SESSION['valid'])) {
	$us_name = $_SESSION['us_name'];
	$us_isAdmin = $_SESSION['us_isAdmin'];
	$us_image = $_SESSION['us_image'];
}
?>
<style>
	.profile-img {
		background-image: url('./assets/images/user/<?= $us_image ?>');
		background-position: center;
		background-size: 100%;
		background-repeat: no-repeat;
		width: 5px;
		height: 5px;
	}

	.header-icons {
		align-items: center;
		display: flex;
		padding: 10px !important;
	}

	a.shopping-cart,
	a.search-bar-icon {
		padding: 0px !important;
		padding-right: 20px !important;
	}

	@media only screen and (max-width: 992px) {
		.header-icons {
			padding: 0px !important;
			align-items: center;
			display: block;
		}

		a.shopping-cart {
			padding: 1em 5% !important;
		}

		a.user-login {
			padding: 1em 5% !important;
		}
	}
</style>
<!--PreLoader-->
<div class="loader">
	<div class="loader-inner">
		<div class="circle"></div>
	</div>
</div>
<!--PreLoader Ends-->

<!-- header -->
<div class="top-header-area" id="sticker">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 col-sm-12 text-center">
				<div class="main-menu-wrap">
					<!-- logo -->
					<div class="site-logo">
						<?php
						$heading = "Company";
						$get_company_logo = new dbClass();
						$table = "tb_company";
						$field = "cp_miniLogo";
						$condition = "";
						$order = "";

						$logo = $get_company_logo->dbSelectOne($table, $field, $condition, $order);
						?>
						<a href="/"> <img src="../assets/images/<?= strtolower($heading) ?>/<?= $logo['cp_miniLogo'] ?>"
								height="50"> </a>
					</div>
					<!-- logo -->

					<!-- menu start -->
					<nav class="main-menu">
						<ul>
							<li class="<?= $uri == '/' ? 'current-list-item' : '' ?>"><a href="/">Home</a></li>
							<li class="<?= $uri == '/shop' ? 'current-list-item' : '' ?>"><a href="/shop">Shop</a></li>
							<li class="<?= $uri == '/contact-us' ? 'current-list-item' : '' ?>"><a
									href="/contact-us">Contact
									US</a></li>
							<li class="<?= $uri == '/about-us' ? 'current-list-item' : '' ?>"><a href="/about-us">About
									US</a>
							</li>
							<li class="<?= $uri == '/news' ? 'current-list-item' : '' ?>"><a href="/news">News</a></li>
							<li>
								<div class="header-icons">
									<?php if (isLogin()) { ?>
										<a class="shopping-cart" href="/shopping-cart"><i
												class="fas fa-shopping-cart"></i></a>
									<?php } ?>
									<a class="mobile-hide search-bar-icon" href="#"><i class="fas fa-search"></i></a>
									<?php if (!isLogin()) { ?><a><i
												class="fas fa-user"></i></a>
									<?php } else { ?>
										<a class="count-indicator rounded-circle profile-img d-none d-lg-inline-block"></a>
									<?php } ?>
									<ul class="sub-menu">
										<?php if (isLogin()) { ?>
											<?php if ($us_isAdmin) { ?>
												<li><a href="/admin_dashboard"><i class="mx-2 fa fa-desktop">
														</i>AdminDashboard
													</a></li>
											<?php } ?>
											<li><a href="/my-dashboard"><i class="mx-2 fas fa-home">
													</i>My Dashboard</a></li>
											<li><a href="/my-account"><i class="mx-2 fas fa-user">
													</i>My Account</a></li>
											<li><a href="../../DB/auth.php?clear=logout"><i class="mx-2 fas fa-door-open">
													</i>Logout</a></li>
										<?php } ?>
										<?php if (!isLogin()) { ?>
											<li><a href="/login"><i class="mx-2 fas fa-users"></i>Login</a>
											</li>
											<li><a href="/register"><i class="mx-2 fas fa-user"></i>Register</a>
											</li>
										<?php } ?>
									</ul>
								</div>
							</li>
						</ul>
					</nav>
					<a class="mobile-show search-bar-icon" href="#"><i class="fas fa-search"></i></a>
					<div class="mobile-menu"></div>
					<!-- menu end -->
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end header -->

<!-- search area -->
<div class="search-area">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<span class="close-btn"><i class="fas fa-window-close"
						style="font-size:30px; margin-right: 10px;"></i></span>
				<div class="search-bar">
					<div class="search-bar-tablecell">
						<h3>Search For:</h3>
						<input type="text" placeholder="Keywords">
						<button type="submit">Search <i class="fas fa-search"></i></button>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- end search area -->