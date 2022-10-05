CREATE TABLE Funcionario(
  SIAPE char(9) PRIMARY KEY,
  nome varchar(45),
  cpf char(11),
  sobrenome varchar(45)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Chefe_do_NAM(
  fk_funcionario_SIAPE char(9) PRIMARY KEY,
  FOREIGN KEY(fk_funcionario_SIAPE)
  REFERENCES Funcionario(SIAPE)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Dirigent(
  fk_funcionario_SIAPE char(9) PRIMARY KEY,
  unidade varchar(45),
  manifestacao MediumText,
  FOREIGN KEY(fk_funcionario_SIAPE)
  REFERENCES Funcionario(SIAPE)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Auditor(
  fk_funcionario_SIAPE char(9) PRIMARY KEY,
  Auditor_TIPO bool,
  FOREIGN KEY(fk_funcionario_SIAPE)
  REFERENCES Funcionario(SIAPE)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


CREATE TABLE Plano_de_Providencia(
  id_plano char(7) PRIMARY KEY,
  recomendacoes MediumText,
  aprovado bool
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Resposta(
  id_resposta char(7) PRIMARY KEY,
  prazo DateTime,
  decisao TinyInt,
  conteudo MediumText  
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Relatorio(
  numero_relatorio char(7) PRIMARY KEY,
  fk_Auditor_fk_Funcionario char(9),
  fk_Dirigente_fk_Funcionario char(9),
  acao Text, 
  dta DateTime,
  escopo MediumText, 
  introducao MediumText,
  exames MediumText,
  FOREIGN KEY(fk_Auditor_fk_Funcionario) REFERENCES Auditor(fk_funcionario_SIAPE),
  FOREIGN KEY(fk_Dirigente_fk_Funcionario) REFERENCES Dirigente(fk_funcionario_SIAPE)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Resp_Aud_CNAM(
  fk_Resposta_id char(7),
  fk_Auditor_fk_Funcionario char(9),
  fk_CNAM_fk_Funcionario char(9),
  FOREIGN KEY(fk_Resposta_id) REFERENCES Resposta(id_resposta),
  FOREIGN KEY(fk_Auditor_fk_Funcionario) REFERENCES Auditor(fk_funcionario_SIAPE),
  FOREIGN KEY(fk_CNAM_fk_Funcionario) REFERENCES Chefe_do_NAM(fk_funcionario_SIAPE)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Associa_Rel_Resp_PPP(
  fk_Resposta_id char(7),
  fk_Relatorio_numero char(7),
  fk_Plano_id char(7),
  FOREIGN KEY(fk_Resposta_id) REFERENCES Resposta(id_resposta),
  FOREIGN KEY(fk_Relatorio_numero) REFERENCES Auditor(numero_relatorio),
  FOREIGN KEY(fk_Plano_id) REFERENCES Plano_de_Providencia(id_plano)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE Altera_CNAM_Dir_PPP(
  fk_CNAM_fk_Funcionario char(9),
  fk_Dirigente_fk_Funcionario char(9),
  fk_Plano_id char(7),
  FOREIGN KEY(fk_CNAM_fk_Funcionario) REFERENCES Chefe_do_NAM(fk_Funcionario_SIAPE),
  FOREIGN KEY(fk_Dirigente_fk_Funcionario) REFERENCES Dirigente(fk_Funcionario_SIAPE),
  FOREIGN KEY(fk_Plano_id) REFERENCES Plano_de_Providencia(id_plano)
)ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;