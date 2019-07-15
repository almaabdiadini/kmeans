<?php $this->load->view ("user/header") ?>
<!--banner-->
<div class="banner">
<div class="container">
<section class="rw-wrapper">
				<h1 class="rw-sentence">
					<span>Fashion &amp; Beauty</span>
					<div class="rw-words rw-words-2">
						<span>Welcome to Our Website</span>
					</div>
				</h1>
			</section>
			</div>
</div>
	<!--content-->
		<div class="content">
			<div class="container">
			<!--products-->
			<div class="content-mid">
				<h3>Trending Items</h3>
				<label class="line"></label>
				<div class="mid-popular">
				<?php foreach($pro -> result () as $key): ?>
				<div class="col-md-3 item-grid simpleCart_shelfItem" style="margin-bottom:10px">
					<div class=" mid-pop">
					<div class="pro-img">
						<img src="<?php echo base_url("assets/uploads/files/".$key -> gambar) ?>" height="200" class="img-responsive" alt="">
						<div class="zoom-icon ">
						<a class="picture" href="<?php echo base_url("assets/uploads/files/".$key -> gambar) ?>" rel="title" class="b-link-stripe b-animate-go  thickbox"><i class="glyphicon glyphicon-search icon "></i></a>
						<a href="<?php echo base_url('index/single/'.$key -> id_produk) ?>"><i class="glyphicon glyphicon-menu-right icon"></i></a>
						</div>
						</div>
						<div class="mid-1">
						<div class="women">
						<div class="women-top">
							<span><?php echo $key->nama_kategori ?></span>
							<h6><a href="<?php echo base_url('index/single/'.$key -> id_produk) ?>"><?php echo $key -> nama_produk ?></a></h6>
							</div>
							<br><br><br>
							<div class="clearfix"></div>
							</div>
							<div class="mid-2">
								<p ><em class="item_price">Rp <?php echo number_format($key -> harga) ?></em></p>
								  <div class="block">
								</div>
								
								<div class="clearfix"></div>
							</div>
							
						</div>
					</div>
					</div>
				<?php endforeach; ?>

					<div class="clearfix"></div>
				</div>
			</div>
			<!--//products-->
			<!--brand-->
			<div class="brand">

			</div>
			<!--//brand-->
			</div>
			
		</div>
	<!--//content-->
	<!--//footer-->
<?php $this->load->view ("user/footer")?>