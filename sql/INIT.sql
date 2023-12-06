use hrport;


--ACCOUNT RECRUITER
INSERT INTO "Utenti" ("email", "password", "admin", "nome", "cognome")
VALUES ('admin@admin', 'admin', 1, 'Brambilla', 'Fumagalli');


--POSIZIONI
INSERT INTO "Posizione" ("nome", "aperta", "fotoUrl", "descrizione")
VALUES ('Web Developer - Frontend', 1, NULL, 'Web Developer Front-End con competenze in HTML, CSS, e JavaScript. Esperienza nella traduzione di mockup in codice funzionale e ottimizzazione delle prestazioni del front-end. Collaborazione efficace con team di design e sviluppatori.');
INSERT INTO "Posizione" ("nome", "aperta", "fotoUrl", "descrizione")
VALUES ('Web Developer - Backend', 1, NULL, 'Web Developer Backend con esperienza in  Java. Conoscenza di database relazionali e non relazionali. Capacità di progettare soluzioni back-end scalabili e sicure.');
INSERT INTO "Posizione" ("nome", "aperta", "fotoUrl", "descrizione")
VALUES ('Sistemista di rete', 1, NULL, 'Sistemista di Rete con competenze nella progettazione, implementazione e gestione di infrastrutture di rete. Esperienza nella risoluzione di problemi di rete e nella sicurezza informatica. Conoscenza approfondita dei protocolli di rete e delle tecnologie di routing/switching. Capacità di configurare e mantenere apparati di rete, firewall e dispositivi di sicurezza.');
INSERT INTO "Posizione" ("nome", "aperta", "fotoUrl", "descrizione")
VALUES ('Supporto tecnico', 1, NULL, 'Richieste competenze nella risoluzione di problemi hardware e software. Esperienza nella gestione di ticket di assistenza e nel fornire supporto remoto o on-site. Conoscenza di sistemi operativi e applicazioni comuni. Abilità nella comunicazione chiara con gli utenti e nel documentare le soluzioni. Capacità di diagnosticare e risolvere problemi tecnici in modo efficiente.');



--QUIZ

-- Quiz SQL 1
INSERT INTO "Quiz" ("nome")
VALUES ('SQL Quiz');

INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (1, 'Cos''è SQL?', 10),
  (1, 'Qual è la differenza tra SQL e MySQL?', 10),
  (1, 'Cosa significa SELECT * FROM table?', 10),
  (1, 'Descrivi la differenza tra INNER JOIN e LEFT JOIN.', 10),
  (1, 'Cosa sono le transazioni in SQL?', 10),
  (1, 'Qual è la clausola WHERE utilizzata per?', 10),
  (1, 'Spiega la differenza tra GROUP BY e HAVING.', 10),
  (1, 'Come si ordinano i risultati di una query SQL?', 10),
  (1, 'Qual è la funzione di AVG() in SQL?', 10),
  (1, 'Cosa sono le viste (views) in SQL?', 10);

-- Domanda 1
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (1, 'Structured Query Language', 1),
  (1, 'Simple Query Language', 0),
  (1, 'Sequential Query Language', 0),
  (1, 'Select Query Language', 0);

-- Domanda 2
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (2, 'Non c''è differenza, sono sinonimi', 0),
  (2, 'MySQL è il linguaggio, SQL è un sistema di gestione dei database', 0),
  (2, 'SQL e MySQL sono due linguaggi diversi per accedere ai database', 0),
  (2, 'SQL è il linguaggio, MySQL è un sistema di gestione dei database', 1);

-- Domanda 3
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (3, 'Restituisce solo le colonne specificate dalla tabella', 0),
  (3, 'Restituisce solo i dati distinti dalla tabella', 0),
  (3, 'Restituisce solo le prime n righe dalla tabella', 0),
  (3, 'Restituisce tutte le colonne dalla tabella', 1);

-- Domanda 4
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (4, 'INNER JOIN restituisce solo le righe che hanno corrispondenze in entrambe le tabelle', 1),
  (4, 'LEFT JOIN restituisce solo le righe da sinistra e le corrispondenze da destra', 0),
  (4, 'Non c''è differenza tra INNER JOIN e LEFT JOIN', 0),
  (4, 'LEFT JOIN restituisce solo le righe che hanno corrispondenze in entrambe le tabelle', 0);

-- Domanda 5
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (5, 'Le transazioni sono solo un tipo di query SQL', 0),
  (5, 'Le transazioni sono un insieme di istruzioni SQL eseguite come un singolo blocco', 1),
  (5, 'Le transazioni non sono supportate in SQL', 0),
  (5, 'Le transazioni sono un modo per visualizzare i dati di una tabella', 0);

-- Domanda 6
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (6, 'La clausola WHERE è utilizzata per filtrare i risultati di una query', 1),
  (6, 'La clausola WHERE è utilizzata per ordinare i risultati di una query', 0),
  (6, 'La clausola WHERE è utilizzata per raggruppare i risultati di una query', 0),
  (6, 'La clausola WHERE è utilizzata per unire tabelle in una query', 0);

-- Domanda 7
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (7, 'HAVING viene utilizzato per ordinare i risultati di una query', 0),
  (7, 'GROUP BY viene utilizzato per raggruppare i risultati in base a una colonna', 1),
  (7, 'GROUP BY e HAVING sono sinonimi', 0),
  (7, 'GROUP BY viene utilizzato per ordinare i risultati di una query', 0);

-- Domanda 8
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (8, 'HAVING viene utilizzato per filtrare i risultati di una query', 0),
  (8, 'GROUP BY viene utilizzato per ordinare i risultati di una query', 0),
  (8, 'ORDER BY e GROUP BY sono sinonimi', 0),
  (8, 'ORDER BY viene utilizzato per ordinare i risultati di una query', 1);

-- Domanda 9
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (9, 'Restituisce la media dei valori in una colonna', 1),
  (9, 'Restituisce il massimo valore in una colonna', 0),
  (9, 'Restituisce il minimo valore in una colonna', 0),
  (9, 'Restituisce la somma dei valori in una colonna', 0);

-- Domanda 10
INSERT INTO "Risposta" ("idDomanda","testo", "giusta")
VALUES
  (10, 'Le viste sono solo un altro nome per le tabelle in SQL', 0),
  (10, 'Le viste sono query salvate che possono essere utilizzate come tabelle virtuali', 1),
  (10, 'Le viste sono utilizzate solo per ordinare i risultati di una query', 0),
  (10, 'Le viste sono utilizzate solo per raggruppare i risultati di una query', 0);






  -- Quiz Java 2
INSERT INTO "Quiz" ("nome")
VALUES ('Java Quiz');

-- Domanda 1
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Qual è il risultato dell''espressione seguente in Java? int result = 5 + 7 * 2 / 3 - 1;', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (11, '4', 0),
  (11, '6', 0),
  (11, '7', 0),
  (11, '8', 1);

-- Domanda 2
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Cosa restituirà il metodo compareTo() per due stringhe identiche in Java?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (12, '"true"', 0),
  (12, '1', 0),
  (12, '-1', 0),
  (12, '0', 1);

-- Domanda 3
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Quale delle seguenti dichiarazioni riguardo all''interfaccia in Java è vera?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (13, 'Un''interfaccia può estendere una classe', 0),
  (13, 'Tutti i metodi di un''interfaccia devono essere dichiarati come statici', 0),
  (13, 'Una classe non può implementare più di un''interfaccia', 0),
  (13, 'Può contenere implementazioni di metodi', 1);

-- Domanda 4
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Cosa accade se si tenta di istanziare una classe astratta in Java?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (14, 'La classe viene istanziata normalmente', 0),
  (14, 'Il programma compila', 0),
  (14, 'Il programma non compila', 0),
  (14, 'Si ottiene un errore a runtime', 1);

-- Domanda 5
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Quale delle seguenti affermazioni sulle eccezioni controllate in Java è corretta?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (15, 'Può essere ignorata senza conseguenze', 0),
  (15, 'Si verifica solo durante la compilazione', 0),
  (15, 'Viene gestita automaticamente dal sistema', 0),
  (15, 'Deve essere gestita dal programmatore o dichiarata nel metodo', 1);

-- Domanda 6
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Cosa succede se provi ad accedere a un array con un indice negativo in Java?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (16, 'L''indice viene automaticamente convertito in positivo', 0),
  (16, 'Si ottiene un''eccezione ArrayIndexOutOfBoundsException', 1),
  (16, 'Si ottiene un valore casuale', 0),
  (16, 'Si ottiene un errore di compilazione', 0);

-- Domanda 7
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Quale delle seguenti affermazioni sulla keyword "final" in Java è falsa?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (17, 'Una variabile dichiarata come "final" può essere modificata', 1),
  (17, 'Una classe dichiarata come "final" può avere costruttori', 0),
  (17, 'Un metodo dichiarato come "final" non può essere sovrascritto', 0),
  (17, 'Una classe dichiarata come "final" non può essere estesa', 0);

-- Domanda 8
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Cosa restituisce il seguente codice Java? System.out.println(10 / 3);', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (18, '3', 1),
  (18, '3.0', 0),
  (18, '3.333', 0),
  (18, '3.5', 0);

-- Domanda 9
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Quale delle seguenti affermazioni sulla classe StringBuilder è vera?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (19, 'Può essere istanziata solo all''interno di un metodo statico', 0),
  (19, 'È deprecata a partire da Java 8', 0),
  (19, 'È immutabile', 0),
  (19, 'È mutabile e può essere modificata', 1);

-- Domanda 10
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (2, 'Cosa succede se provi a compilare e eseguire una classe Java senza il metodo main?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (20, 'Il programma compila, ma non può essere eseguito senza il metodo main', 0),
  (20, 'Il programma compila ma non produce output', 0),
  (20, 'Si ottiene un errore di runtime', 0),
  (20, 'Tutte le precedenti', 1);





  -- Quiz JavaScript 3
INSERT INTO "Quiz" ("nome")
VALUES ('JavaScript Quiz');

-- Domanda 1
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Qual è il tipo di dati di null in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (21, 'Object', 1),
  (21, 'Null', 0),
  (21, 'Undefined', 0),
  (21, 'NaN', 0);

-- Domanda 2
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Come si crea un oggetto in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (22, 'let obj = [];', 0),
  (22, 'let obj = {};', 1),
  (22, 'let obj = ();', 0),
  (22, 'let obj = ::;', 0);

-- Domanda 3
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Quale operatore confronta il valore e il tipo in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (23, '==', 0),
  (23, '=', 0),
  (23, '===', 1),
  (23, '!=', 0);

-- Domanda 4
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Come si dichiara una variabile in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (24, 'let variabile;', 1),
  (24, 'variabile let;', 0),
  (24, 'var = variabile;', 0),
  (24, 'variabile = var;', 0);

-- Domanda 5
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Qual è il risultato di typeof NaN?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (25, '‘number’', 1),
  (25, '‘NaN’', 0),
  (25, '‘undefined’', 0),
  (25, '‘object’', 0);

-- Domanda 6
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Come si dichiara una funzione in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (26, 'miaFunzione.function() {}', 0),
  (26, 'function miaFunzione() {}', 1),
  (26, 'function = miaFunzione() {}', 0),
  (26, 'miaFunzione() = function {}', 0);

-- Domanda 7
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Quale metodo rimuove l’ultimo elemento di un array in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (27, 'pop()', 1),
  (27, 'push()', 0),
  (27, 'shift()', 0),
  (27, 'unshift()', 0);

-- Domanda 8
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Come si aggiunge un elemento all’inizio di un array in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (28, 'array.push(elemento);', 0),
  (28, 'array.pop(elemento);', 0),
  (28, 'array.shift(elemento);', 0),
  (28, 'array.unshift(elemento);', 1);

-- Domanda 9
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Quale metodo restituisce una stringa rappresentante l’array?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (29, 'toArray()', 0),
  (29, 'toValue()', 0),
  (29, 'toString()', 1),
  (29, 'toSource()', 0);

-- Domanda 10
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (3, 'Come si esegue un blocco di codice più volte in JavaScript?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (30, 'Con un condizionale, come if o switch.', 0),
  (30, 'Con un oggetto.', 0),
  (30, 'Con un array.', 0),
  (30, 'Con un ciclo, come for o while.', 1);




  --Quiz HTML/CSS 4
INSERT INTO "Quiz" ("nome")
VALUES ('HTML/CSS Quiz');

-- Domanda 1
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Qual è il doctype corretto per HTML5?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (31, '<!HTML>', 0),
  (31, '<!DOCTYPE html>', 1),
  (31, '<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 5.0//EN">', 0),
  (31, '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN">', 0);

-- Domanda 2
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale attributo HTML5 viene utilizzato per specificare un suggerimento di input predefinito prima che l’utente inserisca un valore?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (32, 'placeholder', 1),
  (32, 'suggestion', 0),
  (32, 'type', 0),
  (32, 'input', 0);

-- Domanda 3
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'In CSS, quale unità è indipendente dalla densità dei pixel dello schermo?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (33, 'rem', 1),
  (33, 'px', 0),
  (33, 'em', 0),
  (33, 'pt', 0);

-- Domanda 4
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale proprietà CSS viene utilizzata per creare spazio tra il bordo di un elemento e il contenuto all’interno?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (34, 'margin', 0),
  (34, 'border', 0),
  (34, 'space', 0),
  (34, 'padding', 1);

-- Domanda 5
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Come si applica uno stile CSS a un elemento HTML con un attributo data specifico?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (35, '.data-attribute', 0),
  (35, '#data-attribute', 0),
  (35, '[data-attribute]', 1),
  (35, '*data-attribute', 0);

-- Domanda 6
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale tag HTML5 viene utilizzato per rappresentare il contenuto principale di un documento o di un’applicazione?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (36, '<main>', 1),
  (36, '<content>', 0),
  (36, '<body>', 0),
  (36, '<section>', 0);

-- Domanda 7
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale attributo HTML5 viene utilizzato per specificare che un campo di input deve essere compilato prima di inviare il modulo?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES 
  (37, 'mandatory', 0),
  (37, 'validate', 0),
  (37, 'fill', 0),
  (37, 'required', 1);

-- Domanda 8
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale proprietà CSS viene utilizzata per specificare l’immagine di sfondo di un elemento?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (38, 'background', 0),
  (38, 'background-image', 1),
  (38, 'bg-image', 0),
  (38, 'image', 0);

-- Domanda 9
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'In CSS, come si seleziona ogni elemento <p> che è il primo figlio di un elemento <div>?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (39, 'div > p:first-child', 1),
  (39, 'div p:first', 0),
  (39, 'div + p', 0),
  (39, 'div . p', 0);

-- Domanda 10
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (4, 'Quale tag HTML5 viene utilizzato per rappresentare una barra di navigazione?', 10);

INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (40, '<navigation>', 0),
  (40, '<menu>', 0),
  (40, '<nav>', 1),
  (40, '<navbar>', 0);




  --Quiz 5 Sistemista di rete
  -- Inserimento del quiz "Sistemista Rete"
INSERT INTO "Quiz" ("nome") VALUES ('Sistemista Rete');

-- Domanda 1
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Durante un''ispezione di routine, un tecnico ha scoperto che il software installato su un computer stava segretamente raccogliendo dati sui siti web visitati dagli utenti del computer. Quale tipo di minaccia sta colpendo questo computer?', 10);

-- Risposte per la Domanda 1
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (41, 'Attacco DoS', 0),
       (41, 'Furto di identità', 0),
       (41, 'Spyware', 1),
       (41, 'Attacco zero-day', 0);

-- Domanda 2
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'A quale termine si riferisce una rete che fornisce un accesso sicuro agli uffici aziendali da parte di fornitori, clienti e collaboratori?', 10);

-- Risposte per la Domanda 2
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (42, 'Internet', 0),
       (42, 'Intranet', 0),
       (42, 'Extranet', 1),
       (42, 'Extendednet', 0);

-- Domanda 3
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Una grande azienda ha modificato la sua rete per consentire agli utenti di accedere alle risorse di rete dai loro laptop personali e smartphone. A quale tendenza di rete si riferisce ciò?', 10);

-- Risposte per la Domanda 3
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (43, 'Cloud computing', 0),
       (43, 'Collaborazione online', 0),
       (43, 'Bring your own device (BYOD)', 1),
       (43, 'Videoconferenza', 0);

-- Domanda 4
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Cos''è un ISP?', 10);

-- Risposte per la Domanda 4
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (44, 'È un organismo di standard che sviluppa norme per cavi e cablaggi per reti.', 0),
       (44, 'È un protocollo che stabilisce come i computer all''interno di una rete locale comunicano.', 0),
       (44, 'È un''organizzazione che consente a individui e aziende di connettersi a Internet.', 1),
       (44, 'È un dispositivo di rete che combina la funzionalità di diversi dispositivi di rete in uno.', 0);

-- Domanda 5

INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Un dipendente presso un''agenzia distaccata sta creando un preventivo per un cliente. Per fare ciò, il dipendente deve accedere alle informazioni sui prezzi riservate dai server interni della sede centrale. A quale tipo di rete accederebbe il dipendente?', 10);

-- Risposte per la Domanda 5
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (45, 'Un''intranet', 1),
       (45, 'Internet', 0),
       (45, 'Un''extranet', 0),
       (45, 'Una rete locale (LAN)', 0);

-- Domanda 6

INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Quale affermazione descrive l''uso della tecnologia di rete powerline?', 10);

-- Risposte per la Domanda 6
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (46, 'Nuovi cavi elettrici "intelligenti" vengono utilizzati per estendere una LAN domestica esistente.', 1),
       (46, 'Viene installata una LAN domestica senza l''uso di cablaggi fisici.', 0),
       (46, 'Un dispositivo si connette a una LAN domestica esistente tramite un adattatore e una presa elettrica esistente.', 0),
       (46, 'Gli access point wireless utilizzano adattatori powerline per distribuire dati attraverso la LAN domestica.', 0);

-- Domanda 7
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Un tecnico di rete sta lavorando sulla rete wireless di una clinica medica. Per errore, il tecnico configura la rete wireless in modo che i pazienti possano vedere i dati delle cartelle cliniche di altri pazienti. Quale delle quattro caratteristiche di rete è stata violata in questa situazione?', 10);

-- Risposte per la Domanda 7
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (47, 'Sicurezza', 1),
       (47, 'Tolleranza agli errori', 0),
       (47, 'Scalabilità', 0),
       (47, 'Affidabilità', 0);

-- Domanda 8
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Quale tipo di traffico di rete richiede la Qualità del Servizio (QoS)?', 10);

-- Risposte per la Domanda 8
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES 
       (48, 'Email', 0),
	   (48, 'Videoconferencing', 1),
       (48, 'Online purchasing', 0),
       (48, 'Wiki', 0);

-- Domanda 9
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Quale interfaccia consente la gestione remota di uno switch di livello 2?', 10);

-- Risposte per la Domanda 9
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES (49, 'The console port interface', 0),
       (49, 'The AUX interface', 0),
       (49, 'The switch virtual interface', 1),
       (49, 'The first Ethernet port interface', 0);

-- Domanda 10
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES (5, 'Cosa fa premere il tasto Tab quando si inserisce un comando in IOS?', 10);

-- Risposte per la Domanda 10
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES 
       (50, 'Annulla il comando attuale e torna alla modalità di configurazione.', 0),
       (50, 'Esce dalla modalità di configurazione e torna alla modalità EXEC utente.', 0),
	   (50, 'Completa il resto di una parola parzialmente digitata in un comando.', 1),
       (50, 'Sposta il cursore all''inizio della riga successiva.', 0);


-- Quiz 6 Informatica base
INSERT INTO "Quiz" ("nome")
VALUES ('Informatica Base');

-- Domanda 1
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa rappresenta l''acronimo RAM in un computer?', 10);

-- Risposte per la Domanda 1
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (51, 'Random Access Memory (RAM)', 1),
  (51, 'Read-Only Memory (ROM)', 0),
  (51, 'Real-Time Application Memory', 0),
  (51, 'Remote Access Module', 0);

-- Domanda 2
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Qual è la funzione principale di un router in una rete domestica?', 10);

-- Risposte per la Domanda 2
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (52, 'Fornire alimentazione ai dispositivi connessi.', 0),
  (52, 'Memorizzare dati temporanei.', 0),
  (52, 'Instradare il traffico tra dispositivi nella rete.', 1),
  (52, 'Proteggere dai virus informatici.', 0);

-- Domanda 3
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa indica l''errore "404 Not Found" durante la navigazione su Internet?', 10);

-- Risposte per la Domanda 3
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (53, 'La pagina richiesta non è stata trovata.', 1),
  (53, 'Problema di connessione Internet.', 0),
  (53, 'Il server è inattivo.', 0),
  (53, 'Il browser non è aggiornato.', 0);

-- Domanda 4
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Qual è lo scopo di un firewall?', 10);

-- Risposte per la Domanda 4
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (54, 'Aumentare la velocità di connessione.', 0),
  (54, 'Gestire le risorse del sistema.', 0),
  (54, 'Creare una connessione sicura tra due reti.', 0),
  (54, 'Proteggere la rete da accessi non autorizzati.', 1);

-- Domanda 5
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa rappresenta l''indirizzo IP 192.168.1.1?', 10);

-- Risposte per la Domanda 5
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (55, 'Un server DNS pubblico.', 0),
  (55, 'Un indirizzo IP di default per il router.', 1),
  (55, 'Un indirizzo IP dinamico.', 0),
  (55, 'Un indirizzo IP riservato per i dispositivi mobili.', 0);

-- Domanda 6
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Qual è lo scopo di un antivirus?', 10);

-- Risposte per la Domanda 6
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (56, 'Incrementare la velocità del computer.', 0),
  (56, 'Migliorare la qualità del display.', 0),
  (56, 'Proteggere da tempeste elettriche.', 0),
  (56, 'Rilevare e rimuovere software dannoso.', 1);

-- Domanda 7
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa significa "Backup" nel contesto informatico?', 10);

-- Risposte per la Domanda 7
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (57, 'Riavvio del sistema operativo.', 0),
  (57, 'Installazione di nuovi programmi.', 0),
  (57, 'Riparazione del disco rigido.', 0),
  (57, 'Copia di sicurezza dei dati.', 1);

-- Domanda 8
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Quale protocollo è comunemente utilizzato per inviare e-mail?', 10);

-- Risposte per la Domanda 8
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (58, 'SMTP (Simple Mail Transfer Protocol)', 1),
  (58, 'FTP (File Transfer Protocol)', 0),
  (58, 'HTTP (Hypertext Transfer Protocol)', 0),
  (58, 'TCP (Transmission Control Protocol)', 0);

-- Domanda 9
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa rappresenta l''acronimo CPU in un computer?', 10);

-- Risposte per la Domanda 9
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (59, 'Central Processing Unit (CPU)', 1),
  (59, 'Computer Processing Unit (CPU)', 0),
  (59, 'Central Program Unit (CPU)', 0),
  (59, 'Control Processing Unit (CPU)', 0);

-- Domanda 10
INSERT INTO "Domanda" ("idQuiz", "testo", "punteggio")
VALUES
  (6, 'Cosa significa "URL"?', 10);

-- Risposte per la Domanda 10
INSERT INTO "Risposta" ("idDomanda", "testo", "giusta")
VALUES
  (60, 'Universal Resource Locator', 0),
  (60, 'Uniform Resource Locator', 1),
  (60, 'Unique Resource Locator', 0),
  (60, 'Uniform Retrieval Locator', 0);

--FINE QUIZ




INSERT INTO "posQuiz" ("idPos", "idQuiz")
VALUES 
	(1, 4),
	(1, 3),
	(2, 1),
	(2, 2),
	(3, 5),
	(4, 6);



select * from Utenti;
select * from Profilo;
select * from Istruzione;
select * from EspLavorativa;
select * from CategoriaSkills;
select * from Skill;
select * from Candidatura;
select * from Posizione;
select * from Quiz;
select * from Domanda;
select * from Risposta;
select * from PosQuiz;
select * from RispostaData;
