<title><?php echo $title ?></title>

<div class="row">
  <div class="col">
    <h2><i class="fa fa-money"></i> <?php echo $title ?></h2>
  </div>
  <div class="float-right pl-3">
    <a href="<?php echo base_url(); ?>cars/index" class="btn btn-info"><i class="fa fa-arrow-left"></i> Back to list</a>
  </div>
</div>

<div class="card">
  <div class="card-body">
    <div class="row ">
      <div class="col-12">
        <div class="row">
          <div class="col-lg-6 offset-lg-3">
            <div class="row text-center">
              <div class="col" id="hiDiv">
                <h1 id="computedText" class="text-center">₱<?php echo (isset($SelectedCar)? number_format($SelectedCar['RentPerDay']*1,2):'0.00');?></h1>
              </div>
            </div>
            <div class="row text-center">
              <div class="col">
                <small>Estimated rental cost in PHP. Fuel cost NOT included.</small>
              </div>
            </div>
            <div class="row pt-3">
              <div class="col">
                <label>Select vehicle</label>
                <select name="carId" id="carId" class="form-control">
                  <option value="0">-</option>
                <?php foreach ($cars as $car): ?>
                  <option <?php echo isset($SelectedCar)?(($car['Id']==$SelectedCar['Id'])?'selected="selected"':''):''; ?> value="<?php echo $car['Id'];?>"><?php echo $car['car_description'].' (₱'.number_format($car['RentPerDay'],2).' per day)';?></option>
                <?php endforeach; ?>
                </select>
              </div>
            </div>
            <div class="row pt-3">
              <div class="col">
                <label>Enter number of days</label>
                <input type="number" min="1" class="form-control col-lg-3 col-sm-12" name="NumberOfDays" id="NumberOfDays" value="1">
              </div>
            </div>
            <div class="row pt-3">
              <div class="col">
                <div class="checkbox">
                  <input id="driver_checkbox" name="driver_checkbox" type="checkbox"><label> Add driver? (+₱<?php echo number_format($driverpay['value'],2);?> per day)</label>
                </div>
              </div>
            </div>
            <div class="row mt-2">
              <div class="col">
                <button type="submit" name="btnCompute" id="btnCompute" class="btn btn-primary col-lg-3 col-sm-12">Compute</button>
                <p class="text-danger"><b>NOTE:</b> <i>The amount dispayed above is only an estimated figure and does not necessarily reflect the actual rental cost.</i></p>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Script -->
<script type='text/javascript'>
  $(document).ready(function() {
      $('#btnCompute').click(function(e) {
        var selectedCar = document.getElementById("carId");
          var driver=$('#driver_checkbox').is(":checked")
          e.preventDefault();
          $.ajax({
              method: "post",
              url: "<?php echo base_url(); ?>pages/computeEstimatedRent",
              data: {
                      no_of_days: document.getElementById('NumberOfDays').value,
                      car_id: selectedCar.options[selectedCar.selectedIndex].value,
                      add_driver: driver
                  },
              dataType: "html",
              context: document.body,
              success: function (response){
                var myhtml='<h1 id="computedText" class="text-center">₱'+response+'</h1>';
                  $('#hiDiv').html(myhtml);
              }
          });
      })
  });
</script>
