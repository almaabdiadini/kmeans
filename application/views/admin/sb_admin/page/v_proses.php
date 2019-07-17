<form action="<?php echo base_url('admin/Prosesdata/prosesInput') ?>" name="proses" method="post"  enctype="multipart/form-data" style="border: thin solid; width: 60%; padding: 15px 5px 15px 5px;" >
	<div class="row" >
		<div class="col-md-4">
			<label>Pilih File CSV</label>
		</div>
		<div class="col-md-6">
			<input type="file" name="filecsv" id="filecsv" class="form-control">			
		</div>
		<input type="submit" name="submit" value="Proses" class="btn btn-primary">
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-md-4">
			<label>Judul</label>
		</div>
		<div class="col-md-6">
			<input type="text" name="judul" id="judul" class="form-control">
		</div>
	</div>
	<div class="row" style="margin-top: 5px;">
		<div class="col-md-4">
			<label>Tanggal</label>
		</div>
		<div class="col-md-6">
			<input type="date" name="tgl_proses" id="tgl_proses" class="form-control">
		</div>
	</div>
</form>