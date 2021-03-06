<?php
	class Booking_model extends CI_Model{
		public function __construct(){
			$this->load->database();
		}

		public function get_bookings($id,$filter='VRS-2004391WR'){
			if(isset($id)){
				$this->db->join('status a', 'a.Id=clientbookings.statusId', 'inner');
				$this->db->join('cars b', 'b.Id=clientbookings.carId', 'inner');
				$this->db->join('clients c', 'c.Id=clientbookings.clientId', 'inner');
				$this->db->order_by("clientbookings.BookingId", "desc");
				$query=$this->db->get_where('clientbookings', array('clientbookings.BookingId' => $id));
        return $query->row_array();
      }else {
				$this->db->join('status a', 'a.Id=clientbookings.statusId', 'inner');
				$this->db->join('cars b', 'b.Id=clientbookings.carId', 'inner');
				$this->db->join('clients c', 'c.Id=clientbookings.clientId', 'inner');
				$this->db->where("clientbookings.reference_number LIKE '%".$filter."%' OR c.name LIKE '%".$filter."%'");
				$query=$this->db->get('clientbookings');
				$this->db->order_by("clientbookings.BookingId", "desc");
				//$query=$this->db->get('clientbookings');
  			return $query->result_array();
      }
		}

		public function get_bookings_report($start_date=null,$end_date=null,$carid=null){
			if($carid!=0){
				$query=$this->db->query("SELECT *,(SELECT SUM(clientbookings.rental_fee_current*clientbookings.number_of_days) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS Income,(SELECT SUM(clientbookings.number_of_days) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS TotalDays,(SELECT COUNT(*) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS NumberOfBooking FROM cars inner join clientbookings on clientbookings.carId=cars.Id WHERE clientbookings.carId=".$carid." AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."') GROUP by cars.Id ORDER BY cars.car_description");
			}else{
				$query=$this->db->query("SELECT *,(SELECT SUM(clientbookings.rental_fee_current*clientbookings.number_of_days) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS Income,(SELECT SUM(clientbookings.number_of_days) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS TotalDays,(SELECT COUNT(*) from clientbookings where clientbookings.carId=cars.Id AND (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."')) AS NumberOfBooking FROM cars inner join clientbookings on clientbookings.carId=cars.Id WHERE (clientbookings.start_date BETWEEN '".$start_date."' AND '".$end_date."') GROUP by cars.Id ORDER BY cars.car_description");
			}
			return $query->result_array();

		}

		public function create_booking($filesdata){
			$timestamp=time();
			$carid = $this->input->post('carId');
			$Date = $this->input->post('start_date');
			$startDate = date("Y-m-d", strtotime($Date));
			$NumberOfDays = $this->input->post('number_of_days');
			$remarks = $this->input->post('remarks');
			$selectedCar = $this->Car_model->get_cars($carid);
			$driverFee = $this->Setting_model->get_settings(null,'Driver_Per_Day');
			$data = array(
				'clientId' => $this->input->post('clientId'),
        'carId' => $carid,
        'start_date' => $startDate,
				'end_date' => date('Y-m-d', strtotime($startDate. ' + '.$NumberOfDays.' days')),
        'number_of_days' => $NumberOfDays,
				'add_driver' => (($this->input->post('add_driver')=='on') ? 1 : 0),
				'driver_name' => $this->input->post('driver_name'),
				'driver_fee_current' => $driverFee['value'],
				'rental_fee_current' => $selectedCar['RentPerDay'],
				'rental_discount' => $this->input->post('discount'),
				'created_by' => $this->session->userdata('user_id'),
				'reference_number' => 'VRS-'.date('ym',$timestamp).$this->generateRandomString(5),
        'statusId' => 1
			);
			$this->db->insert('clientbookings', $data);
			$BookingId=$this->db->insert_id();
			$this->BookingImage_model->create_booking_photos($BookingId,$filesdata);
			$this->BookingLogs_model->create_log($BookingId,'Created this booking',$this->session->userdata('user_id'));
			if(!empty($remarks)){
				$this->BookingLogs_model->create_log($BookingId,$remarks,$this->session->userdata('user_id'));
			}

			if(!empty($this->input->post('discount'))){
				$this->BookingLogs_model->create_log($BookingId,'applied a discount amount of '.$this->input->post('discount'),$this->session->userdata('user_id'));
			}

			if(!empty($this->input->post('downpayment'))){
				$this->BookingPayments_model->create_payment($BookingId,$this->input->post('downpayment'),$this->input->post('remarks'),$this->session->userdata('user_id'),'');
			}

			return $BookingId;
		}

    public function update_booking(){

			$startDate = $this->session->userdata('booking_start_date');
			$BookingId = $this->input->post('bookingid');

			$data = array(
				'carId' => $this->session->userdata('booking_car_id'),
				'start_date' => $this->session->userdata('booking_start_date'),
				'end_date' => date('Y-m-d', strtotime($startDate. ' + '.$this->session->userdata('booking_days').' days')),
				'number_of_days' => $this->session->userdata('booking_days'),
				'add_driver' => (($this->input->post('add_driver')=='on') ? 1 : 0),
				'driver_name' => $this->input->post('driver_name'),
				'driver_fee_current' => $this->input->post('driver_fee_current'),
				'rental_fee_current' => $this->session->userdata('booking_rental_fee_current'),
				'rental_discount' => $this->input->post('rental_discount'),
				'statusId' => $this->input->post('status_id')
			);

      $this->db->where('BookingId', $BookingId);
			$this->db->update('clientbookings', $data);
			$this->BookingLogs_model->create_log($BookingId,'updated this booking',$this->session->userdata('user_id'));
      return true;
    }

		public function delete_booking($id){
			$this->BookingImage_model->delete_booking_photo_by_booking_id($id);
			$this->BookingLogs_model->delete_logs_by_booking_id($id);
			$this->BookingPayments_model->delete_payments_by_booking_id($id);
			$this->db->where('bookingid', $id);
			$this->db->delete('clientbookings');
			return true;
		}

		function generateRandomString($length = 5) {
	    $characters = '123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ';
	    $charactersLength = strlen($characters);
	    $randomString = '';
	    for ($i = 0; $i < $length; $i++) {
	        $randomString .= $characters[rand(0, $charactersLength - 1)];
	    }
	    return $randomString;
		}
	}
