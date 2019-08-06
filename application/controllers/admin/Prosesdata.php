<?php
defined('BASEPATH') OR exit('No direct script access allowed');
include('Super.php');

class Prosesdata extends Super
{
    
    function __construct()
    {
        parent::__construct();
        $this->language       = 'english'; /** Indonesian / english **/
        $this->tema           = "flexigrid"; /** datatables / flexigrid **/
        $this->tabel          = "data_proses";
        $this->active_id_menu = "Proses Data";
        $this->nama_view      = "Proses Data";
        $this->status         = true; 
        $this->field_tambah   = array(); 
        $this->field_edit     = array(); 
        $this->field_tampil   = array(); 
        $this->folder_upload  = 'assets/uploads/files';
        $this->add            = true;
        $this->edit           = true;
        $this->delete         = true;
        $this->crud;
    }

    function index(){
            $data = [];
            if($this->crud->getState()=="add")
                redirect(base_url('admin/Prosesdata/proses'));

            if($this->crud->getState()=="read")
                redirect(base_url('admin/Prosesdata/tampil/'.$this->uri->segment(5)));
                // var_dump($this->crud->getState()); exit();
                
            /** Bagian GROCERY CRUD USER**/


            /** Relasi Antar Tabel 
            * @parameter (nama_field_ditabel_ini, tabel_relasi, field_dari_tabel_relasinya)
            **/
            //$this->crud->set_relation('parent_menu','tjm_menu','nama_menu');

            /** Upload **/
            // $this->crud->set_field_upload('nama_field_upload',$this->folder_upload);  
            
            /** Ubah Nama yang akan ditampilkan**/
            // $this->crud->display_as('nama','Nama Setelah di Edit')
            //     ->display_as('email','Email Setelah di Edit'); 
            
            /** Akhir Bagian GROCERY CRUD Edit Oleh User**/
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

    public function proses(){
        $data = [];
        $data = array_merge($data,$this->generateBreadcumbs());
        $data = array_merge($data,$this->generateData());
        $this->generate();
        $data['page'] = "v_proses";
        $data['output'] = $this->crud->render();
        $this->load->view('admin/'.$this->session->userdata('theme').'/v_index',$data);
    }

    public function prosesInput(){
        $fileName = $_FILES["filecsv"]["tmp_name"];
        if ($_FILES["filecsv"]["size"] > 0) {
        
            $file = fopen($fileName, "r");
            $csv = array_map('str_getcsv', file($fileName));
            array_shift($csv); # remove column header

            $total = count($csv);

            $tgl_proses = $this->input->post('tgl_proses');
            $judul = $this->input->post('judul');

            // var_dump($csv); exit();
            $this->db->set('judul',$judul);
            $this->db->set('tgl_proses',$tgl_proses);
            $this->db->insert('data_proses');

            $id_proses = $this->db->insert_id();

            for($i=0; $i < $total; $i++){
                $teks[$i]  = $csv[$i]; //mengambil baris array
                $baris[$i] = implode($teks[$i]);//merubah baris array menjadi string
                $pecah = explode(";", $baris[$i]);//untuk memecah baris menjadi array berdasarkan pemisah dengan tanda ;
                $this->db->set('id_proses', $id_proses);
                $this->db->set('tgl', $pecah[0]);
                $this->db->set('nama_team', $pecah[1]);
                $this->db->set('total_harga', $pecah[2]);
                $this->db->insert('data_rfm');
            }
           
            redirect(base_url('admin/Prosesdata'));


        }
    }
    public function tampil($id_proses){

       $getData =  $this->db->query("SELECT DISTINCT nama_team FROM data_rfm where id_proses='".$id_proses."'")->result();
        $this->db->where('id_proses',$id_proses);
       $getProses = $this->db->get('data_proses')->row();
       $tgl_proses = $getProses->tgl_proses;

       $totalM =[];
       $totalR = [];
       $totalF = [];
       $team = [];
       $no = 0;
       $data = [];
       foreach ($getData as $key) {
           $this->db->where('nama_team','SAMBA');
           $this->db->where('id_proses',$id_proses);
           $getTeam = $this->db->get('data_rfm');
           $rowTeam = $getTeam->result();

           $team[$no] = $key->nama_team;
            
            //total nilai M
           $total = 0;
           foreach ($rowTeam as $row) {
               $total = $total + $row->total_harga;
           }

           $totalM[$no] = $this->bobotM($total);
           //batas mencari total M

           //mencari F
           $rowTeam[$no] = $this->db->query("SELECT DISTINCT tgl FROM data_rfm WHERE nama_team = '".$team[$no]."' AND id_proses = '".$id_proses."'")->num_rows();
            $totalF[$no] = $this->bobotF($rowTeam[$no]);
           //Batas mencari F

            //mencari R

            $this->db->where('nama_team',$key->nama_team);
            $this->db->where('id_proses',$id_proses);
            $this->db->limit(1);
            $this->db->order_by('tgl','DESC');
            $getTanggal = $this->db->get('data_rfm')->row();

            $nilaiR[$no] = $getTanggal->tgl;

            $totalR[$no] = $this->bobotR($nilaiR[$no], $tgl_proses);
            //batas R
            $data[$no] = array(
                    'nama'=>$team[$no],
                    'r'=>$totalR[$no],
                    'f'=>$totalF[$no],
                    'm'=>$totalM[$no]
                    );
            $c[$no] = array(
                    'nama'=>$team[$no],
                    'r'=>$totalR[$no],
                    'f'=>$totalF[$no],
                    'm'=>$totalM[$no]
                    );

           // $data[$no] = "Nama :".$team[$no]." R:".$totalR[$no]." F:".$totalF[$no]." M:".$totalM[$no];
           // $data[$no] = "Nama :".$team[$no]." R:".$totalR[$no]." F:".$totalF[$no]." M:".$totalM[$no];
        $no++;
       }

       shuffle($c);
       $c1 = $c[1];
       $c2 = $c[2];

       $totalBaris = count($data);
       for ($i=0; $i < $totalBaris; $i++) { 
           $hasilC1[$i] = round(sqrt((($c[1]['r']-$data[$i]['r'])^2) + (($c[1]['f']-$data[$i]['f'])^2) + (($c[1]['m']-$data[$i]['m'])^2)),2);
           $hasilC2[$i] = round(sqrt((($c[2]['r']-$data[$i]['r'])^2) + (($c[2]['f']-$data[$i]['f'])^2) + (($c[2]['m']-$data[$i]['m'])^2)),2);
       }
    var_dump($hasilC2); exit();
    //baru
    }

    public function bobotM($bobotTeam){

        $getBobotM = $this->db->query('SELECT * FROM kriteria_m WHERE batas_awal <= "'.$bobotTeam.'" AND "'.$bobotTeam.'" <= batas_akhir')->row();

        $hasil = $getBobotM->bobot_m;

        // var_dump($hasil); exit();

        return $hasil;
    }

    public function bobotF($bobotTeam){

        $getBobotF = $this->db->query('SELECT * FROM kriteria_f WHERE batas_awal <= "'.$bobotTeam.'" AND "'.$bobotTeam.'" <= batas_akhir')->row();

        $hasil = $getBobotF->bobot_f;

        // var_dump($hasil); exit();

        return $hasil;
    }

    public function bobotR($bobotTeam, $tgl_proses){
        $tgl_awal = new DateTime($bobotTeam);
        $dateNow = new DateTime($tgl_proses);
        $lama = $dateNow->diff($tgl_awal)->format("%a");

        $getBobotR = $this->db->query('SELECT * FROM kriteria_r WHERE batas_awal <= "'.$lama.'" AND "'.$lama.'" <= batas_akhir')->row();

        $hasil = $getBobotR->bobot_r;
        return $hasil;
        // var_dump($lama); die();
    }
}