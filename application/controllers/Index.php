<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Index extends CI_Controller {


	function __construct(){
		parent::__construct();
	}

	public function index()
	{
		$this->db->limit(8);
		$this->db->order_by ('id_produk','desc');
		$this->db->join('kategori','produk.id_kategori=kategori.id_kategori');
		$data['pro']=$this->db->get('produk');
		$this -> load -> view ('user/home',$data);
	}
	
	

	public function product()
	{
		if($this->input->get('key')!= null ){
			$this->db->like('nama_produk',$this->input->get('key'));
		}
		
		$this->db->join('kategori','produk.id_kategori=kategori.id_kategori');
		$data['pro']=$this->db->get('produk');
		$data["kat"]=$this->db->get("kategori");
		$this->load->view ('user/produk', $data);
	}
	
	public function categories($id)
	{
		/*
		$this->db->join('produk','produk.id_kategori=kategori.id_kategori');
		$data['pro']=$this->db->get_where('kategori',array('id_kategori'=>$id));
		$this->load->view ('user/kategori', $data);
		*/
		$data ["kat"] = $this->db->get("kategori");
		$this->db->where('produk.id_kategori',$id);
		$this->db->join('kategori','produk.id_kategori=kategori.id_kategori');
		$data["pro"]=$this->db->get('produk');
		$this->load->view ('user/kategori', $data);
	}
	
	public function single($id)
	{
		$data ["kat"] = $this->db->get("kategori");
		$this->db->join('kategori','produk.id_kategori=kategori.id_kategori');
		$data ["detail"] = $this->db->get_where('produk',array ('id_produk'=>$id))-> row();
		$this->db->join('relasi_warna','relasi_warna.id_warna=warna.id_warna');
		$data['warna']=$this->db->get_where('warna',array('relasi_warna.id_produk'=>$data['detail']->id_produk));

		$this->load->view ('user/single',$data);
	}
	
	public function contactus ()
	{
		if ($_POST){
			$this->db->insert('komentar',$_POST);
			redirect (base_url('index/contactus/'));
		}
		else{
		$this->load->view("user/contactus");
		}
	}
	
	public function addcart ()
	{
		$row = $this->db->get_where("produk",array('id_produk'=>$this -> input -> post('id')))->row();
		//print_r($row);die();
		$data=array(
			'id'=>$this->input->post('id'),
			'qty'=>$this->input->post('jumlah'),
			'price'=>$row->harga,
			'name'=>$row->nama_produk,
			'options'=>array('keterangan'=>$this->input->post('keterangan'),
							'image'=>$row->gambar,
							'berat'=>$row->berat
							)
		);
		
		$this->cart->insert($data);
		redirect(base_url('index/order'));
		//print_r($this->cart->contents());die();
	}
	
	public function destroy() {
		$this->cart->destroy();
		redirect (base_url('index/product'));
	}
	
	public function order() {
		//print_r ($this->cart->contents());
		if($_POST){
			$this->db->insert('pembeli',$_POST);
			$this->db->insert('transaksi',array(
				'id_pembeli'=>$this->db->insert_id(),
				'id_kota'=>$this->input->post('id_kota')
			));
			
			//insert_id untuk mengambil id yang baru dilempar
			$id_transaksi=$this->db->insert_id();
			
			$berto=0; $harto=0;
			foreach ($this->cart->contents() as $items):
			$this->db->insert('transaksi_detail',array(
				//tanda -> menunjukkan OOP dan tanda => digunakan untuk memasukkan sebuah nilai ke OOP.
				'id_transaksi'=>$id_transaksi,
				'id_produk'=>$items['id'],
				'harga'=> $items['price'],
				'jumlah_produk'=> $items['qty'],
				'harga_total'=> ($items['price'] * $items['qty']),
				'berat_total'=> ($items['options']['berat'] * $items ['qty']),
				'keterangan'=> $items['options']['keterangan']
			));
			
				$berto=($berto + ($items['qty'] * $items['options']['berat']));
				$harto=($harto + ($items['qty'] * $items['price']));
				
			//hapus isi session ketika data masuk ke dalam database
			$data = array(
				'rowid' => $items['rowid'],
				'qty' => 0
				);
			$this->cart->update($data);
			endforeach;
			
			$row = $this->db->get_where("kota",array('id_kota'=>$this->input->post('id_kota')))->row();
			$this->db->where('id_transaksi',$id_transaksi);
			$this->db->update('transaksi',array(
				'total_bayar'=>$harto + ($row->harga * round($berto))));
				
			redirect('index/invoice/'.$id_transaksi);
		}
		else{
			$data['city']=$this->db->get('kota');
			$this->load->view('user/checkout',$data);
		}	
	}
		public function hapus(){
			$id=$this->input->post('id',true);
			$data = array(
					'rowid' => $id,
					'qty' => 0
					);
				$this->cart->update($data);
				redirect(base_url('index/order'));
	}
		public function invoice($id){
			$this->db->join('pembeli','transaksi.id_pembeli=pembeli.id_pembeli');
			$data['pembeli']=$this->db->get_where('transaksi',array('id_transaksi'=>$id))->row();
			$this->db->join('transaksi_detail','transaksi_detail.id_produk=produk.id_produk');
			$data['produk']=$this->db->get_where('produk',array('transaksi_detail.id_transaksi'=>$id));
			$this->db->join('transaksi','transaksi.id_kota=kota.id_kota');
			$data['kota']=$this->db->get_where('kota',array('transaksi.id_transaksi'=>$id))->row();
			$this->load->view("user/invoice",$data);
		}
	
		
}