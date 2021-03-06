<html>
<head>
  <!DOCTYPE html>
  <html lang="en">
  <head>
    <meta charset="UTF-8">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon -->
    <link rel="icon" href="<?php echo base_url();?>assets/images/system_images/vrslogo.png" type="image/gif" sizes="16x16">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

   <!-- script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script -->
   <!--link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" -->
   <link rel="stylesheet" type="text/css" href="<?php echo base_url(); ?>assets/bootstrap-4.4.1/css/bootstrap.min.css">
   <script src="<?php echo base_url(); ?>assets/bootstrap-4.4.1/js/jquery.min.js" ></script>
   <script src="<?php echo base_url(); ?>assets/bootstrap-4.4.1/js/bootstrap.min.js" ></script>
   <script src="<?php echo base_url(); ?>assets/bootstrap-4.4.1/js/popper.min.js" ></script>

</head>
<body class="pb-5">
  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
    <div class="container-fluid">
    <div class="navbar-header">
    <p class="my-0 mr-md-auto font-weight-normal">
      <a class="nav-link text-light" href="<?php echo base_url(); ?>"><img src="<?php echo base_url();?>assets/images/system_images/vrslogo.png">&nbsp;VRS</a>
    </p>
    </div>
    <ul class="navbar-nav">
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url(); ?>about"><i class="fa fa-user-secret"></i> About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url(); ?>contact"><i class="fa fa-phone"></i> Contact Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url(); ?>faq"><i class="fa fa-question-circle-o"></i> FAQs</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url(); ?>cars/index"><i class="fa fa-car"></i> Vehicles</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="<?php echo base_url(); ?>estimate"><i class="fa fa-money"></i> Estimate Rent</a>
      </li>
      <?php if($this->session->userdata('logged_in')): ?>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-book"></i> Booking
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<?php echo base_url(); ?>bookings/create"><i class="fa fa-plus-circle"></i> Add booking</a>
          <a class="dropdown-item" href="<?php echo base_url(); ?>bookings/index"><i class="fa fa-eye"></i> View bookings</a>
          <a class="dropdown-item" href="<?php echo base_url(); ?>bookings/report"><i class="fa fa-tachometer"></i> Reports</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-users"></i> Client
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="<?php echo base_url(); ?>clients/create"><i class="fa fa-plus-circle"></i> Add client</a>
          <a class="dropdown-item" href="<?php echo base_url(); ?>clients/index"><i class="fa fa-eye"></i> View clients</a>
        </div>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-lock"></i> Admin
        </a>
        <div class="dropdown-menu dropleft" aria-labelledby="navbarDropdown">
          <a class="dropdown-item <?php echo (($this->session->userdata('logged_in')) && ($this->session->userdata('is_admin')))?'':'disabled'?>" href="<?php echo base_url(); ?>users/index"><i class="fa fa-users"></i> Users Management</a>
          <a class="dropdown-item" href="<?php echo base_url(); ?>cars/index"><i class="fa fa-car"></i> Vehicle Management</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item <?php echo (($this->session->userdata('logged_in')) && ($this->session->userdata('is_admin')))?'':'disabled'?>" href="<?php echo base_url(); ?>status/index"><i class="fa fa-toggle-on"></i> Status Management</a>
            <a class="dropdown-item <?php echo (($this->session->userdata('logged_in')) && ($this->session->userdata('is_admin')))?'':'disabled'?>" href="<?php echo base_url(); ?>settings/index"><i class="fa fa-cog"></i> System Settings</a>
        </div>
      </li>
      <?php endif; ?>
      <li>
        <?php
        if(!$this->session->userdata('logged_in')){
          echo '<a class="btn btn-primary" href="'.base_url().'users/login"><i class="fa fa-power-off"></i> Login</a>';
        }else{
          echo '<a class="btn btn-danger" href="'.base_url().'users/logout"><i class="fa fa-power-off"></i> Logout</a>';
        }
        ?>
      </li>
    </ul>
  </div>
  </nav>
  <br>
<div class="container">
  <hr class="d-print-none">
</div>

<div class="container">
<!-- flash messages -->

<?php if($this->session->flashdata('global_error')): ?>
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('global_error'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('attachment_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('attachment_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('car_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('car_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('payment_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('payment_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('car_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('car_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('car_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('car_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('car_deleted_error')): ?>
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('car_deleted_error'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('setting_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('setting_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('setting_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('setting_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('settings_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('settings_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('user_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('user_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('user_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('user_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('user_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('user_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('status_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('status_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('status_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('status_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('status_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('status_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('client_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('client_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('client_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('client_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('client_deleted_error')): ?>
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('client_deleted_error'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('client_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('client_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('booking_created')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('booking_created'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('booking_deleted')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('booking_deleted'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('booking_updated')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('booking_updated'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('user_loggedin')): ?>
  <div class="alert alert-success alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('user_loggedin'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>

<?php if($this->session->flashdata('login_failed')): ?>
  <div class="alert alert-danger alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('login_failed'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>


<?php if($this->session->flashdata('user_loggedout')): ?>
  <div class="alert alert-info alert-dismissible fade show" role="alert">
  <?php echo $this->session->flashdata('user_loggedout'); ?>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
    <span aria-hidden="true">&times;</span>
  </button>
</div>
<?php endif; ?>
