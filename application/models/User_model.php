<?php
	class User_model extends CI_Model{
		public function __construct(){
			$this->load->database();
		}

		public function get_users($id){
			if(isset($id)){
        $query=$this->db->get_where('users', array('id' => $id));
        return $query->row_array();
      }else {
				$query=$this->db->get_where('users', array('fullname LIKE' => '%'.$this->input->post('users_filter').'%'));
  			return $query->result_array();
      }
		}

		public function get_users_by_username($username){
				$query=$this->db->get_where('users', array('username' => $username));
				return $query->row_array();
		}

		public function user_is_admin($id){
			$query=$this->db->get_where('users', array('id' => $id));
			$userInfo = $query->row_array();
			if($userInfo['user_type']=='admin'){
				return true;
			}else{
				return false;
			}
		}

		public function create_user(){
			$data = array(
				'firstname' => $this->input->post('fname'),
        'lastname' => $this->input->post('lname'),
				'fullname' => $this->input->post('fname').' '.$this->input->post('lname'),
				'email' => $this->input->post('email'),
				'username' => $this->input->post('username'),
				'password' => md5($this->input->post('password')),
				'user_type' => $this->input->post('user_type'),
				'Is_Active' => 1
			);
			return $this->db->insert('users', $data);
		}

    public function update_user(){
      $data = array(
				'firstname' => $this->input->post('fname'),
        'lastname' => $this->input->post('lname'),
				'fullname' => $this->input->post('fname').' '.$this->input->post('lname'),
				'email' => $this->input->post('email'),
				'username' => $this->input->post('username'),
				'password' => md5($this->input->post('password')),
				'user_type' => $this->input->post('user_type'),
				'Is_Active' => 1
      );

      $this->db->where('id', $this->input->post('id'));
      return $this->db->update('users', $data);
    }

		public function login($username, $password){
			// Validate
			$this->db->where('username', $username);
			$this->db->where('password', md5($password));

			$result = $this->db->get('users');

			if($result->num_rows() == 1){
				return $result->row(0)->id;
			} else {
				return false;
			}
		}

		public function delete_user($id){
			$this->db->where('id', $id);
			$this->db->delete('users');
			return true;
		}
	}
