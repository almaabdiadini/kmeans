<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include('Super.php');

class Diagram extends Super
{
    
    function __construct()
    {
        parent::__construct();
        $this->language       = 'english'; /** Indonesian / english **/
        $this->tema           = "flexigrid"; /** datatables / flexigrid **/
        $this->tabel          = "data_proses";
        $this->active_id_menu = "Diagram Kmeans";
        $this->nama_view      = "Diagram Kmeans";
        $this->status         = true; 
        $this->field_tambah   = array(); 
        $this->field_edit     = array(); 
        $this->field_tampil   = array(); 
        $this->folder_upload  = 'assets/uploads/files';
        $this->add            = false;
        $this->edit           = false;
        $this->delete         = false;
        $this->crud;
    }

    function index(){
            $data = [];

            if($this->crud->getState()=="read")
                redirect(base_url('admin/Diagram/tampilDiagram/'.$this->uri->segment(5)));
            /** Bagian GROCERY CRUD USER**/


            /** Relasi Antar Tabel 
            * @parameter (nama_field_ditabel_ini, tabel_relasi, field_dari_tabel_relasinya)
            **/
            // $this->crud->set_relation('id_proses','data_proses','tgl_proses');

            /** Upload **/
            // $this->crud->set_field_upload('nama_field_upload',$this->folder_upload);  
            
            /** Ubah Nama yang akan ditampilkan**/
            // ->display_as('nama','Nama Setelah di Edit')
            // $this->crud->display_as('id_proses','Tanggal'); 
            // $this->crud->display_as('c1','C1 (Cluster Satu)'); 
            // $this->crud->display_as('c2','C2 (Cluster Dua)'); 
            
            $this->crud->display_as('tgl_proses','Tanggal batas akhir'); 
            /** Akhir Bagian GROCERY CRUD Edit Oleh User**/
            // $id_proses = $this->uri->segment(4);
            // // print_r($id_proses); die();
            $this->crud->where('data_proses.status_proses','Sudah diproses');
            $data = array_merge($data,$this->generateBreadcumbs());
            $data = array_merge($data,$this->generateData());
            $this->generate();
            $data['output'] = $this->crud->render();
            $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }

    private function generateBreadcumbs(){
        $data['breadcumbs'] = array(
                array(
                    'nama'=>'Dashboard',
                    'icon'=>'fa fa-dashboard',
                    'url'=>'admin/dashboard'
                ),
                array(
                    'nama'=>'Admin',
                    'icon'=>'fa fa-users',
                    'url'=>'admin/useradmin'
                ),
            );
        return $data;
    }

    public function tampilDiagram($id_proses){
        $data = [];
        $data = array_merge($data,$this->generateBreadcumbs());
        $data = array_merge($data,$this->generateData());
        $this->generate();

        $this->db->where('hasil','1');
        $this->db->where('id_proses',$id_proses);
        $data['totalLoyal'] = $this->db->get('hasil_rfm')->num_rows();

        $this->db->where('hasil','0');
        $this->db->where('id_proses',$id_proses);
        $data['totalTidakLoyal'] = $this->db->get('hasil_rfm')->num_rows();

        $this->db->where('hasil','1');
        $this->db->order_by('c1','ASC');
        $this->db->where('id_proses',$id_proses);
        $data['dataTeamLoyal'] = $this->db->get('hasil_rfm')->result();

        $this->db->where('hasil','0');
        $this->db->order_by('c2','ASC');
        $this->db->where('id_proses',$id_proses);
        $data['dataTeamTidakLoyal'] = $this->db->get('hasil_rfm')->result();

        $data['page'] = "v_diagram";
        $data['output'] = $this->crud->render();
        $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }
}