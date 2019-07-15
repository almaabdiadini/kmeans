<form action="<?php echo base_url('admin/Prosesdata/prosesInput') ?>" name="proses" method="post"  enctype="multipart/form-data">
	<div class="row" style="border: thin solid; width: 60%; padding: 15px 5px 15px 5px;" >
		<div class="col-md-4">
			<label>Pilih File CSV</label>
		</div>
		<div class="col-md-6">
			<input type="file" name="filecsv" id="filecsv" class="form-control">			
		</div>
		<input type="submit" name="submit" value="Proses" class="btn btn-primary">
	</div>
</form>