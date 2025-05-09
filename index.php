<html>
  <head>
    <title>PHP Test</title>
  </head>
  <body>
    <?php
    // Define o caminho do banco de dados como constante
    define('DATABASE', 'banco.sqlite');

    try {
        // Conecta ao banco usando a constante DATABASE
        $pdo = new PDO('sqlite:' . DATABASE);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        // Cria a tabela se não existir
        $pdo->exec("CREATE TABLE IF NOT EXISTS usuarios (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            email TEXT UNIQUE,
            senha TEXT
        )");

        // Dados fixos
        $email = 'mariaeduarda@websol.com';
        $senha = '123456';

        // Verifica se o e-mail já existe
        $stmt = $pdo->prepare("SELECT COUNT(*) FROM usuarios WHERE email = :email");
        $stmt->bindParam(':email', $email);
        $stmt->execute();
        $existe = $stmt->fetchColumn();

        if ($existe) {
            //echo "Usuário já existe!";
        } else {
            // Criptografa a senha
            $senhaHash = password_hash($senha, PASSWORD_DEFAULT);

            // Insere no banco
            $stmt = $pdo->prepare("INSERT INTO usuarios (email, senha) VALUES (:email, :senha)");
            $stmt->bindParam(':email', $email);
            $stmt->bindParam(':senha', $senhaHash);
            $stmt->execute();

            echo "Usuário inserido com sucesso!";
        }
    } catch (PDOException $e) {
        echo "Erro ao acessar o banco: " . $e->getMessage();
    }
    ?>
    <!DOCTYPE html>
    <html lang="pt-br">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>
        <link rel="stylesheet" href="teladelogin.css">
    </head>

    <body>
        <div class="login-container">
            <div class="login-form">
                <h2>Login</h2>
                <p>Sistema de RH Web Solutions</p>
                <form method="POST" action="sistema.html">
                    <div class="input-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Digite seu email corporativo" required>
                    </div>
                    <div class="input-group">
                        <label for="password">Senha</label>
                        <input type="password" id="password" name="password" placeholder="Digite sua senha" required>
                    </div>
                    <button type="submit">Enviar</button>
                </form>
                <p class="login-footer">Esqueceu a senha? <a href="#">Redefina</a></p>

            </div>
            <div class="login-image">
                <img src="./img/logoweb2.png" alt="Logo WS">
            </div>
        </div>
    </body>

    </html>

</html>
