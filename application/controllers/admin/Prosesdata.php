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
        $this->edit           = false;
        $this->delete         = true;
        $this->crud;
    }

    function index(){
            $data = [];
            if($this->crud->getState()=="add")
                redirect(base_url('admin/Prosesdata/proses'));

            if($this->crud->getState()=="read")
                redirect(base_url('admin/Prosesdata/prosesHitung/'.$this->uri->segment(5)));
                // var_dump($this->crud->getState()); exit();
                
            /** Bagian GROCERY CRUD USER**/


            /** Relasi Antar Tabel 
            * @parameter (nama_field_ditabel_ini, tabel_relasi, field_dari_tabel_relasinya)
            **/
            //$this->crud->set_relation('parent_menu','tjm_menu','nama_menu');

            /** Upload **/
            // $this->crud->set_field_upload('nama_field_upload',$this->folder_upload);  
            
            /** Ubah Nama yang akan ditampilkan**/
            // ->display_as('nama','Nama Setelah di Edit')
            $this->crud->display_as('tgl_proses','Tanggal batas akhir'); 
            
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
            $dateNow = date('Y-m-d H:i:s');
            // var_dump($dateNow); die();
            $this->db->set('judul',$judul);
            $this->db->set('tgl_proses',$tgl_proses);
            $this->db->set('waktu_proses',$dateNow);
            $this->db->set('status_proses','Belum diproses');
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

            $this->dataRFM($id_proses); // untuk mengambil c1 dan c2
           
            redirect(base_url('admin/Prosesdata'));


        }
    }
    public function dataRFM($id_proses){
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
           $this->db->where('nama_team',$key->nama_team);
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

            $this->db->set('id_proses',$id_proses);
            $this->db->set('nama_team',$team[$no]);
            $this->db->set('nilai_r',$totalR[$no]);
            $this->db->set('nilai_f',$totalF[$no]);
            $this->db->set('nilai_m',$totalM[$no]);
            $this->db->insert('data_bobot_rfm');

           // $data[$no] = "Nama :".$team[$no]." R:".$totalR[$no]." F:".$totalF[$no]." M:".$totalM[$no];
           // $data[$no] = "Nama :".$team[$no]." R:".$totalR[$no]." F:".$totalF[$no]." M:".$totalM[$no];
        $no++;
       }

       shuffle($c);
       $c1 = $c[1];
       $c2 = $c[2];

       
       $this->db->set('id_proses',$id_proses);
       $this->db->set('tipe','C1');
       $this->db->set('r','3');
       $this->db->set('f','2');
       $this->db->set('m','5');
       $this->db->insert('centroid_data');

       $this->db->set('id_proses',$id_proses);
       $this->db->set('tipe','C2');
       $this->db->set('r','3');
       $this->db->set('f','1');
       $this->db->set('m','1');
       $this->db->insert('centroid_data');
       /*$this->db->set('id_proses',$id_proses);
       $this->db->set('tipe','C1');
       $this->db->set('r',$c[1]['r']);
       $this->db->set('f',$c[1]['f']);
       $this->db->set('m',$c[1]['m']);
       $this->db->insert('centroid_data');

       $this->db->set('id_proses',$id_proses);
       $this->db->set('tipe','C2');
       $this->db->set('r',$c[2]['r']);
       $this->db->set('f',$c[2]['f']);
       $this->db->set('m',$c[2]['m']);
       $this->db->insert('centroid_data');*/
    return true;
    //baru
    }

    public function bobotM($bobotTeam){
        // try {
        $getBobotM = $this->db->query('SELECT * FROM kriteria_m WHERE batas_awal <= "'.$bobotTeam.'" AND "'.$bobotTeam.'" <= batas_akhir')->row();

        if($getBobotM){
            // echo "{$getBobotM->bobot_m}\n";
            $hasil = $getBobotM->bobot_m;

            // var_dump($hasil); exit();

            return $hasil;        
        }
        // return 0;
        
        // } catch (Exception $e) {
        //     print_r($e->getMessage());
        // }
        
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

    public function prosesHitung($id_proses){

      $this->db->where('id_proses',$id_proses);
      $getDataProses = $this->db->get('data_proses')->row();
      $status_proses = $getDataProses->status_proses;

      if($status_proses == "Sudah diproses"){
            redirect(base_url('admin/KmeansHasil/index'."/".$id_proses));
      }else{

          //mengambil c1
            $C1 = $this->c1($id_proses);
          //mengambil c2
            $C2 = $this->c2($id_proses);

          $i=0;
          $totalC1 = 0;
          $totalR1 = 0;
          $totalF1 = 0;
          $totalM1 = 0;
          $totalC2 = 0;
          $totalR2 = 0;
          $totalF2 = 0;
          $totalM2 = 0;
          $this->db->where('id_proses',$id_proses);
          $getDataRFM = $this->db->get('data_bobot_rfm')->result();
          foreach ($getDataRFM as $key) {
              $hasilC1[$i] = $this->hitungC1($C1->r, $key->nilai_r, $C1->f, $key->nilai_f, $C1->m, $key->nilai_m);

              $hasilC2[$i] = $this->hitungC2($C2->r, $key->nilai_r, $C2->f, $key->nilai_f, $C2->m, $key->nilai_m);

              if($hasilC1[$i] < $hasilC2[$i]){
                $hasil = 1;
                $totalC1 = $totalC1 + 1;
                $totalR1 = $totalR1 + $key->nilai_r;
                $totalF1 = $totalF1 + $key->nilai_f;
                $totalM1 = $totalM1 + $key->nilai_m;
              }else{
                $hasil = 0;
                $totalC2 = $totalC2 + 1;
                $totalR2 = $totalR2 + $key->nilai_r;
                $totalF2 = $totalF2 + $key->nilai_f;
                $totalM2 = $totalM2 + $key->nilai_m;
              }

              $hasilIterasi[$i] = array(
                                      'nama_team'=>$key->nama_team,
                                      'c1'=>$hasilC1[$i],
                                      'c2'=>$hasilC2[$i],
                                      'hasil'=>$hasil
                                      );

              $this->db->set('nama_team',$key->nama_team);
              $this->db->set('id_proses',$id_proses);
              $this->db->set('c11',$hasilC1[$i]);
              $this->db->set('c21',$hasilC2[$i]);
              $this->db->set('hasil1',$hasil);
              $this->db->insert('hasil_rfm');
            
            $i++;
          }
          $newC1 = array('r'=>round($totalR1/$totalC1,2), 'f'=>round($totalF1/$totalC1,2), 'm'=>round($totalM1/$totalC1,2));
          $newC2 = array('r'=>round($totalR2/$totalC2,2), 'f'=>round($totalF2/$totalC2,2), 'm'=>round($totalM2/$totalC2,2));

          $newIterasi = $this->iterasi2($id_proses, $newC1, $newC2);

         // if($newIterasi==$hasilIterasi){
            $this->db->where('id_proses',$id_proses);
            $this->db->where('tipe','C1');
            $this->db->set('r2',$newC1['r']);
            $this->db->set('f2',$newC1['f']);
            $this->db->set('m2',$newC1['m']);
            $this->db->update('centroid_data');

            $this->db->where('id_proses',$id_proses);
            $this->db->where('tipe','C2');
            $this->db->set('r2',$newC2['r']);
            $this->db->set('f2',$newC2['f']);
            $this->db->set('m2',$newC2['m']);
            $this->db->update('centroid_data');

            

         /* }else{
            $this->db->where('id_proses',$id_proses);
            $this->db->where('tipe','C1');
            $this->db->set('r2',$newC1['r']);
            $this->db->set('f2',$newC1['f']);
            $this->db->set('m2',$newC1['m']);
            $this->db->update('centroid_data');

            $this->db->where('id_proses',$id_proses);
            $this->db->where('tipe','C2');
            $this->db->set('r2',$newC2['r']);
            $this->db->set('f2',$newC2['f']);
            $this->db->set('m2',$newC2['m']);
            $this->db->update('centroid_data');

            foreach ($newIterasi as $key) {
              $this->db->where('nama_team',$key->nama_team);
              $this->db->where('id_proses',$id_proses);
              $this->db->set('c12',$key['c1']);
              $this->db->set('c22',$key['c2']);
              $this->db->set('hasil',$key['hasil']);
              $this->db->update('hasil_rfm');
            }
          }*/
          foreach ($newIterasi as $key) {
              $this->db->where('nama_team',$key['nama_team']);
              $this->db->where('id_proses',$id_proses);
              $this->db->set('c12',$key['c1']);
              $this->db->set('c22',$key['c2']);
              $this->db->set('c22',$key['c2']);
              $this->db->set('hasil2',$key['hasil']);
              $this->db->update('hasil_rfm');
            }
          /*echo "C1 = ";
          print_r($C1);
          echo "<P>";
          echo "C2 = ";
          print_r($C2);
          echo "<P>";
          echo "cluster 1 = ";
          print_r($hasilIterasi);
          echo "<p>";
          echo "C1 = ";
          print_r($newC1);
          echo "<P>";
          echo "C2 = ";
          print_r($newC2);
          echo "<P>";
          echo "cluster baru = ";
          print_r($newIterasi); 
          die();*/
          $this->db->set('status_proses','Sudah diproses');
            $this->db->where('id_proses',$id_proses);
            $this->db->update('data_proses');
            redirect(base_url('admin/KmeansHasil/index'."/".$id_proses));
        }
    }

    public function iterasi2($id_proses, $C1, $C2){
          
          // var_dump($C1['r']); die();
          $i=0;
          $totalC1 = 0;
          $totalR1 = 0;
          $totalF1 = 0;
          $totalM1 = 0;
          $totalC2 = 0;
          $totalR2 = 0;
          $totalF2 = 0;
          $totalM2 = 0;
          
          $getDataRFM = $this->db->get('data_bobot_rfm')->result();
          foreach ($getDataRFM as $key) {
              $hasilC1[$i] = $this->hitungC1($C1['r'], $key->nilai_r, $C1['f'], $key->nilai_f, $C1['m'], $key->nilai_m);

              $hasilC2[$i] = $this->hitungC2($C2['r'], $key->nilai_r, $C2['f'], $key->nilai_f, $C2['m'], $key->nilai_m);

              if($hasilC1[$i] < $hasilC2[$i]){
                $hasil = 1;
                $totalC1 = $totalC1 + 1;
                $totalR1 = $totalR1 + $key->nilai_r;
                $totalF1 = $totalF1 + $key->nilai_f;
                $totalM1 = $totalM1 + $key->nilai_m;
              }else{
                $hasil = 0;
                $totalC2 = $totalC2 + 1;
                $totalR2 = $totalR2 + $key->nilai_r;
                $totalF2 = $totalF2 + $key->nilai_f;
                $totalM2 = $totalM2 + $key->nilai_m;
              }

              $hasilIterasi[$i] = array(
                                      'nama_team'=>$key->nama_team,
                                      'c1'=>$hasilC1[$i],
                                      'c2'=>$hasilC2[$i],
                                      'hasil'=>$hasil
                                      );
            $i++;
          }

          return $hasilIterasi;
    }

    public function c1($id_proses){
      $this->db->where('id_proses',$id_proses);
      $this->db->where('tipe',"C1");
      return $this->db->get('centroid_data')->row();
    }

    public function c2($id_proses){
      $this->db->where('id_proses',$id_proses);
      $this->db->where('tipe',"C2");
      return $this->db->get('centroid_data')->row();
    }

    public function hitungC1($bobot_r, $nilai_r, $bobot_f, $nilai_f, $bobot_m, $nilai_m){
      return round(sqrt((($bobot_r - $nilai_r)*($bobot_r - $nilai_r)) + (($bobot_f - $nilai_f)*($bobot_f - $nilai_f)) + (($bobot_m - $nilai_m)*($bobot_m - $nilai_m))),2);
    }

    public function hitungC2($bobot_r, $nilai_r, $bobot_f, $nilai_f, $bobot_m, $nilai_m){
      return round(sqrt((($bobot_r - $nilai_r)*($bobot_r - $nilai_r)) + (($bobot_f - $nilai_f)*($bobot_f - $nilai_f)) + (($bobot_m - $nilai_m)*($bobot_m - $nilai_m))),2);
    }

}