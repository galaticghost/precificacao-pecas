<?php
require_once('conexaoModel.php');

class Usuario extends Conexao{
    private $id;
    private $nome;
    private $login;
    private $senha;
    private $email;
    private $estado;
    private $municipio;
    private $endereco;
    private $perfil;

    public function __construct($nome,$login,$senha,$email,$idEstado,$municipio,$endereco,$idPerfil){
        parent::__construct();
        $this->nome = $nome;
        $this->login = $login;
        $this->senha = $senha;
        $this->email = $email;
        $this->estado = array($idEstado);

		if($this->estado[0] != null){
        	$sql = "SELECT estado FROM estado WHERE id = $idEstado";
			$conexao = mysqli_connect('localhost','root','','app_precificacao');
			$estado = mysqli_query($conexao,$sql);
			$estado = mysqli_fetch_row($estado);
			$this->estado[] = $estado[0];
		}

		$this->municipio = $municipio;
        $this->endereco = $endereco;
        $this->perfil = array($idPerfil);

		if($this->perfil[0] != null){
			$sql = "SELECT nome_perfil FROM perfil WHERE id = $idPerfil";
			$conexao = mysqli_connect('localhost','root','','app_precificacao');
			$perfil = mysqli_query($conexao,$sql);
			$perfil = mysqli_fetch_row($perfil);
			$this->perfil[] = $perfil[0];
		}
    }

	public function getId() {
		return $this->id;
	}

	public function setId($value) {
		$this->id = $value;
	}

	public function getNome() {
		return $this->nome;
	}

	public function setNome($value) {
		$this->nome = $value;
	}

	public function getLogin() {
		return $this->login;
	}

	public function setLogin($value) {
		$this->login = $value;
	}

	public function getSenha() {
		return $this->senha;
	}

	public function setSenha($value) {
		$this->senha = $value;
	}

	public function getEmail() {
		return $this->email;
	}

	public function setEmail($value) {
		$this->email = $value;
	}

	public function getEstado() {
		return $this->estado;
	}

	public function setEstado($value) {
		$this->estado = $value;
	}

	public function getMunicipio() {
		return $this->municipio;
	}

	public function setMunicipio($value) {
		$this->municipio = $value;
	}

	public function getEndereco() {
		return $this->endereco;
	}

	public function setEndereco($value) {
		$this->endereco = $value;
	}

	public function getPerfil() {
		return $this->perfil;
	}

	public function setPerfil($value) {
		$this->perfil = $value;
	}

    public function cadastrarESetId(){
        $sql = "INSERT INTO usuario(id_estado,id_perfil,nome_usuario,login_usuario,senha_usuario,
        email_usuario,endereco,municipio) VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $this->conexao->prepare($sql);
        $stmt->bind_param('iissssss',$this->estado[0],$this->perfil[0],$this->nome,$this->login,
        $this->senha,$this->email,$this->endereco,$this->municipio);
        $stmt->execute() or die('Falha na inserção');
        $stmt->close();

        $sql = "SELECT id FROM usuario ORDER BY id DESC LIMIT 1";
        $id = $this->conexao->query($sql);
        $id = mysqli_fetch_row($id);
        $this->id = $id[0];
    }

	public function logar(){
		$sql = "SELECT id,nome_usuario,login_usuario,senha_usuario FROM usuario WHERE login_usuario = ? AND senha_usuario = ?";
		$stmt = $this->conexao->prepare($sql);
		$stmt->bind_param('ss',$this->login,$this->senha);
		$stmt->execute();
		$result = $stmt->get_result();
		$stmt->close();
		if(mysqli_num_rows($result) == 0){
			return null;
		}
		else {
			$result = mysqli_fetch_row($result);
			$this->id = $result[0];
			$this->nome = $result[1];
			return 1;
		}
	}
}