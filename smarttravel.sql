CREATE DATABASE smarttravel;

--@block
CREATE TABLE ville(
    nom_ville VARCHAR(255),
    PRIMARY KEY(nom_ville)

)

--@block
INSERT INTO ville (nom_ville) VALUES
('Casablanca'),
('Fez'),
('Tangier'),
('Marrakesh'),
('Salé'),
('Meknes'),
('Rabat'),
('Oujda'),
('Kenitra'),
('Agadir'),
('Tetouan'),
('Temara'),
('Safi'),
('Mohammedia'),
('Khouribga'),
('El Jadida'),
('Beni Mellal'),
('Aït Melloul'),
('Nador'),
('Dar Bouazza'),
('Settat'),
('Berrechid'),
('Khemisset'),
('Inezgane'),
('Ksar El Kebir'),
('Larache'),
('Guelmim'),
('Khenifra'),
('Berkane'),
('Taourirt'),
('Bouskoura'),
('Fquih Ben Salah'),
('Dcheira El Jihadia'),
('Oued Zem'),
('El Kelaa Des Sraghna'),
('Sidi Slimane'),
('Errachidia'),
('Guercif'),
('Oulad Teima'),
('Ben Guerir'),
('Tifelt'),
('Lqliaa'),
('Taroudant'),
('Sefrou'),
('Essaouira'),
('Fnideq'),
('Sidi Kacem'),
('Tiznit'),
('Tan-Tan'),
('Ouarzazate'),
('Souk El Arbaa'),
('Youssoufia'),
('Lahraouyine'),
('Martil'),
('Ain Harrouda'),
('Suq as-Sabt Awlad an-Nama'),
('Skhirat'),
('Ouazzane'),
('Benslimane'),
('Al Hoceima'),
('Beni Ansar'),
('Mdieq'),
('Sidi Bennour'),
('Midelt'),
('Azrou'),
('Drargua');

--@block

CREATE TABLE entreprise (
    short_name VARCHAR(255) NOT NULL,
    full_name VARCHAR(255) NOT NULL,
    img VARCHAR(255) NOT NULL,
    PRIMARY KEY (short_name, full_name)
);

--@block
INSERT INTO entreprise (id, short_name , full_name, img) VALUES 
(1, 'CTM','Compagnie de Transports au Maroc', LOAD_FILE('imgs/ctm.jpg')),
(2, 'TJV' ,'TajVoyage', LOAD_FILE('imgs/taj.jpg')),
(3,'BAS', 'Bismi Allah Salama', LOAD_FILE('imgs/bismilah.jpg')),
(4,'SF', 'SAT First', LOAD_FILE('imgs/SAT_First.jpg')),
(5,'Ghazala', 'Ghazala', LOAD_FILE('imgs/ghazala.jpg')),
(6, 'AWA','Al Wissam Addahabi', LOAD_FILE('imgs/AlWissamAddahabi.jpg'));


--@block
CREATE TABLE `bus`(
    num_bus INT NOT NULL AUTO_INCREMENT,
    matricule INT NOT NULL, 
    nom_entreprise VARCHAR(255) NOT NULL,
    capacite INT NOT NULL,
    PRIMARY KEY (num_bus),
    FOREIGN KEY (nom_entreprise) REFERENCES entreprise(short_name)
);
--@block
CREATE TABLE route(
    id INT NOT NULL AUTO_INCREMENT,
    v_depart VARCHAR(30),
    v_arrive VARCHAR(30),
    distance INT(5),
    duration time,
    UNIQUE (id),
    PRIMARY KEY(v_depart , v_arrive),
    FOREIGN KEY(v_depart) REFERENCES ville(nom_ville),
    FOREIGN KEY(v_arrive) REFERENCES ville(nom_ville)
);

--@block
INSERT INTO route (v_depart, v_arrive, distance, duration) VALUES
('Casablanca', 'Fez', 320, '04:30:00'),
('Fez', 'Marrakesh', 530, '07:15:00'),
('Tangier', 'Agadir', 680, '09:00:00'),
('Marrakesh', 'Rabat', 330, '04:45:00'),
('Oujda', 'Kenitra', 610, '08:30:00'),

('Rabat', 'Tetouan', 290, '04:00:00'),
('Agadir', 'Oujda', 850, '11:30:00'),
('Kenitra', 'Casablanca', 200, '03:00:00'),
('Tetouan', 'Essaouira', 540, '07:45:00'),
('Temara', 'Safi', 150, '02:15:00'),

('Safi', 'Meknes', 380, '05:30:00'),
('Mohammedia', 'Khouribga', 220, '03:15:00'),
('Khouribga', 'El Jadida', 270, '03:45:00'),
('El Jadida', 'Beni Mellal', 320, '04:30:00'),
('Beni Mellal', 'Aït Melloul', 590, '08:15:00'),

('Nador', 'Dar Bouazza', 760, '10:45:00'),
('Dar Bouazza', 'Settat', 210, '03:00:00'),
('Settat', 'Berrechid', 60, '01:00:00'),
('Berrechid', 'Khemisset', 150, '02:15:00'),
('Inezgane', 'Ksar El Kebir', 400, '05:45:00');

--@block
CREATE TABLE horaire(
    id INT NOT NULL AUTO_INCREMENT,
    s_time TIMESTAMP,
    arrive_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    d_date DATE,
    prix INT(3),
    numero_bus INT NOT NULL,
    route_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY(numero_bus) REFERENCES bus(num_bus),
    FOREIGN KEY(route_id) REFERENCES route(id)
);
