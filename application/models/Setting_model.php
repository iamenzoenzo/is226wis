<?php
	class Setting_model extends CI_Model{
		public function __construct(){
			$this->load->database();
		}

		public function create_setting(){
			$data = array(
				'name' => trim($this->input->post('name')),
        'value' => trim($this->input->post('value')),
				'type' => trim($this->input->post('type')),
				'Is_Active' => 1

			);
			return $this->db->insert('settings', $data);
		}

    public function update_setting(){
      $data = array(
        'name' => trim($this->input->post('name')),
        'value' => trim($this->input->post('value')),
				'type' => trim($this->input->post('type')),
        'Is_Active' => (($this->input->post('is_active_checkbox')=='on') ? 1 : 0)
      );

      $this->db->where('id', $this->input->post('id'));
      return $this->db->update('settings', $data);
    }

		public function get_settings($id,$name){
      if(isset($id)){
        $query=$this->db->get_where('settings', array('id' => $id));
        return $query->row_array();
      }else if(isset($name)){
				$query=$this->db->get_where('settings', array('name' => $name));
				return $query->row_array();
			}
			else {
				$query=$this->db->get_where('settings', array('name LIKE '=>'%'.$this->input->post('setting_filter').'%'));
        //$query = $this->db->get('settings');
  			return $query->result_array();
      }

		}

		public function get_settings_by_type($type){
				$query=$this->db->get_where('settings', array('type'=>$type));
				return $query->result_array();

		}

		public function delete_setting($id){
			$this->db->where('id', $id);
			$this->db->delete('settings');
			return true;
		}
	}
