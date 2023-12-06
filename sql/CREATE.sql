use hrport;

DECLARE @sql NVARCHAR(MAX)

-- Rimuovi i vincoli delle chiavi esterne
SELECT @sql = (
    SELECT 'ALTER TABLE ' + 
        OBJECT_SCHEMA_NAME(parent_object_id) + '.' + OBJECT_NAME(parent_object_id) + 
        ' DROP CONSTRAINT ' + name + ';' + CHAR(10)
    FROM sys.foreign_keys
    FOR XML PATH('')
)

-- Esegui la query per rimuovere i vincoli
EXEC sp_executesql @sql




DROP TABLE Utenti;
DROP TABLE Profilo;
DROP TABLE Istruzione;
DROP TABLE EspLavorativa;
DROP TABLE CategoriaSkills;
DROP TABLE Skill;
DROP TABLE Posizione;
DROP TABLE Quiz;
DROP TABLE Domanda;
DROP TABLE Risposta;
DROP TABLE posQuiz;
DROP TABLE RispostaData;
DROP TABLE Candidatura


CREATE TABLE "Skill"(
    "idCs" BIGINT NOT NULL,
    "nomeSkill" VARCHAR(255) NOT NULL,
	"idSkill" BIGINT IDENTITY(1,1) NOT NULL
);
ALTER TABLE
    "Skill" ADD CONSTRAINT "skill_idskill_primary" PRIMARY KEY("idSkill");
CREATE TABLE "Risposta"(
    "idDomanda" BIGINT NOT NULL,
    "idRisposta" BIGINT IDENTITY(1,1) NOT NULL,
    "testo" VARCHAR(255) NOT NULL,
    "giusta" BIT NOT NULL
);
ALTER TABLE
    "Risposta" ADD CONSTRAINT "risposta_idrisposta_primary" PRIMARY KEY("idRisposta");
CREATE TABLE "RispostaData"(
    "idUtente" BIGINT NOT NULL,
    "idRisposta" BIGINT NOT NULL
);
CREATE TABLE "Domanda"(
    "idQuiz" BIGINT NOT NULL,
    "idDomanda" BIGINT IDENTITY(1,1) NOT NULL,
    "testo" VARCHAR(1000) NOT NULL,
    "punteggio" BIGINT NOT NULL
);
ALTER TABLE
    "Domanda" ADD CONSTRAINT "domanda_iddomanda_primary" PRIMARY KEY("idDomanda");
CREATE TABLE "EspLavorativa"(
	"idEL" BIGINT IDENTITY(1,1) NOT NULL,
    "idCv" BIGINT NOT NULL,
    "azienda" VARCHAR(255) NOT NULL,
    "dInizio" DATE NOT NULL,
    "dFine" DATE NOT NULL,
    "posizione" VARCHAR(255) NOT NULL,
    "funzione" VARCHAR(255) NOT NULL,
    "indirizzo" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "EspLavorativa" ADD CONSTRAINT "esplavorativa_idel_primary" PRIMARY KEY("idEL");
CREATE TABLE "Istruzione"(
	"idIst" BIGINT IDENTITY(1,1) NOT NULL,
    "idCv" BIGINT NOT NULL,
    "titoloIstruzione" VARCHAR(255) NOT NULL,
    "istituto" VARCHAR(255) NOT NULL,
    "indirizzo" VARCHAR(255) NOT NULL,
    "voto" BIGINT NOT NULL,
    "dInizio" DATE NOT NULL,
    "dFine" DATE NULL
);
ALTER TABLE
    "Istruzione" ADD CONSTRAINT "istruzione_idist_primary" PRIMARY KEY("idIst");
CREATE TABLE "Candidatura"(
    "idUtente" BIGINT NOT NULL,
    "idCand" BIGINT IDENTITY(1,1) NOT NULL,
    "idPos" BIGINT NOT NULL,
    "stato" BIGINT NOT NULL,
	"punteggioTot" BIGINT NULL
);
ALTER TABLE
    "Candidatura" ADD CONSTRAINT "candidatura_idcand_primary" PRIMARY KEY("idCand");
CREATE TABLE "Utenti"(
    "idUtente" BIGINT IDENTITY(1,1) NOT NULL,
    "email" VARCHAR(255) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "admin" BIT NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "cognome" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Utenti" ADD CONSTRAINT "utenti_idutente_primary" PRIMARY KEY("idUtente");
CREATE TABLE "Quiz"(
    "idQuiz" BIGINT IDENTITY(1,1) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
);
ALTER TABLE
    "Quiz" ADD CONSTRAINT "quiz_idquiz_primary" PRIMARY KEY("idQuiz");
CREATE TABLE "CategoriaSkills"(
    "idCv" BIGINT NOT NULL,
    "idCs" BIGINT IDENTITY(1,1) NOT NULL,
    "nomeCategoria" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "CategoriaSkills" ADD CONSTRAINT "categoriaskills_idcs_primary" PRIMARY KEY("idCs");
CREATE TABLE "Posizione"(
    "idPos" BIGINT IDENTITY(1,1) NOT NULL,
    "nome" VARCHAR(255) NOT NULL,
    "aperta" BIT NOT NULL,
    "fotoUrl" VARCHAR(255) NULL,
	"descrizione" VARCHAR(500) NOT NULL
);
ALTER TABLE
    "Posizione" ADD CONSTRAINT "posizione_idpos_primary" PRIMARY KEY("idPos");
CREATE TABLE "Profilo"(
    "idUtente" BIGINT NOT NULL,
    "idCv" BIGINT IDENTITY(1,1) NOT NULL,
    "fileUrl" VARCHAR(255) NULL,
    "fotoUrl" VARCHAR(255) NULL,
    "sesso" BIT NOT NULL,
    "dNascita" DATE NOT NULL,
    "indResidenza" VARCHAR(255) NOT NULL,
    "indDomicilio" VARCHAR(255) NOT NULL,
    "telefono" VARCHAR(255) NOT NULL,
    "codiceFiscale" VARCHAR(255) NOT NULL,
    "statoOrigine" VARCHAR(255) NOT NULL,
    "comNascita" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Profilo" ADD CONSTRAINT "profilo_idcv_primary" PRIMARY KEY("idCv");
CREATE TABLE "posQuiz"(
    "idPos" BIGINT NOT NULL,
    "idQuiz" BIGINT NOT NULL
);
ALTER TABLE
    "Candidatura" ADD CONSTRAINT "candidatura_idutente_foreign" FOREIGN KEY("idUtente") REFERENCES "Utenti"("idUtente");
ALTER TABLE
    "posQuiz" ADD CONSTRAINT "posquiz_idquiz_foreign" FOREIGN KEY("idQuiz") REFERENCES "Quiz"("idQuiz");
ALTER TABLE
    "RispostaData" ADD CONSTRAINT "rispostadata_idrisposta_foreign" FOREIGN KEY("idRisposta") REFERENCES "Risposta"("idRisposta");
ALTER TABLE
    "Skill" ADD CONSTRAINT "skill_idcs_foreign" FOREIGN KEY("idCs") REFERENCES "CategoriaSkills"("idCs") ON DELETE CASCADE;
ALTER TABLE
    "RispostaData" ADD CONSTRAINT "rispostadata_idutente_foreign" FOREIGN KEY("idUtente") REFERENCES "Utenti"("idUtente");
ALTER TABLE
    "posQuiz" ADD CONSTRAINT "posquiz_idpos_foreign" FOREIGN KEY("idPos") REFERENCES "Posizione"("idPos");
ALTER TABLE
    "Candidatura" ADD CONSTRAINT "candidatura_idpos_foreign" FOREIGN KEY("idPos") REFERENCES "Posizione"("idPos");
ALTER TABLE
    "EspLavorativa" ADD CONSTRAINT "esplavorativa_idcv_foreign" FOREIGN KEY("idCv") REFERENCES "Profilo"("idCv");
ALTER TABLE
    "Risposta" ADD CONSTRAINT "risposta_iddomanda_foreign" FOREIGN KEY("idDomanda") REFERENCES "Domanda"("idDomanda");
ALTER TABLE
    "CategoriaSkills" ADD CONSTRAINT "categoriaskills_idcv_foreign" FOREIGN KEY("idCv") REFERENCES "Profilo"("idCv");
ALTER TABLE
    "Domanda" ADD CONSTRAINT "domanda_idquiz_foreign" FOREIGN KEY("idQuiz") REFERENCES "Quiz"("idQuiz");
ALTER TABLE
    "Profilo" ADD CONSTRAINT "profilo_idutente_foreign" FOREIGN KEY("idUtente") REFERENCES "Utenti"("idUtente");
ALTER TABLE
    "Istruzione" ADD CONSTRAINT "istruzione_idcv_foreign" FOREIGN KEY("idCv") REFERENCES "Profilo"("idCv");
