<title><?= $title ;?></title>
<div>
  <div class="row">
    <div class="col-lg-8 col-sm-12">
      <h2><?= $title ;?></h2>
    </div>
    <div class="col">
      <a href="<?php echo base_url()?>cars/index" class="btn btn-info btn-md pull-right col-lg-auto col-sm-12"><i class="fa fa-arrow-left"></i> Back to list</a>
    </div>
  </div>
</div>
<?php echo form_open_multipart('cars/create'); ?>
  <div class="row">
  	<div class="col">
  		<label>Description</label>
  		<input type="text" class="form-control" name="car-name" placeholder="Enter description">
  	</div>
    <div class="col">
      <label>Code Name</label>
      <input type="text" class="form-control" name="car-code-name" placeholder="Enter code name">
    </div>
    <div class="col">
      <label>Car Model Name</label>
      <input type="text" class="form-control" name="car-model-name" placeholder="Ex. Vios">
    </div>
    <div class="col">
      <label>Manufacturer</label>
      <input type="text" class="form-control" name="car-manufacturer" placeholder="Ex. Toyota">
    </div>
  </div>
  <div class="row  pt-2">
    <div class="col-3">
      <label>Year</label>
      <input type="number" value="1990" min="1900" class="form-control" name="car-model-year">
    </div>
    <div class="col-3">
      <label>Plate Number</label>
      <input type="text" class="form-control" name="car-plate-number" placeholder="Type plate number">
    </div>
    <div class="col-3">
      <label>Rent Per Day</label>
      <input type="number" min="0" class="form-control" name="car-rent-per-day" placeholder="Amount per day">
    </div>
    <div class="col-3">
      <label>Capacity</label>
      <input type="number" min="0" class="form-control" name="car-capacity" value="4">
    </div>
  </div>
  <div class="row pt-2">
    <div class="col">
      <label>Upload Car Photo</label></br>
  	  <input type="file" name="userfile" >
    </div>
  </div>
<div class="pt-3">
	<button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o"></i> Submit</button>
  <a href="<?php echo base_url()?>cars/index" class="btn btn-danger"><i class="fa fa-ban"></i> Cancel</a>
</div>
</form>
