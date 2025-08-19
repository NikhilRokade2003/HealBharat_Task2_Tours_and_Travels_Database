-- ===========================================
-- creating TOUR & TRAVEL DATABASE 
-- ===========================================

CREATE database Tours_Travels_DB;
use Tours_Travels_DB;

-- ===========================================
-- CREATE TABLES
-- ===========================================

-- USERS
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('user','admin') DEFAULT 'user',
    registration_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    phone VARCHAR(15),
    country VARCHAR(50),
    last_login TIMESTAMP
);

-- DESTINATIONS
CREATE TABLE destinations (
    destination_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    city VARCHAR(100),
    country VARCHAR(100),
    category ENUM('Adventure','Beach','Cultural','Wildlife','Others'),
    image_url VARCHAR(255)
);

-- TOUR PACKAGES
CREATE TABLE tour_packages (
    package_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    duration_days INT NOT NULL,
    itinerary TEXT,
    destination_id INT NOT NULL,
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id) ON DELETE CASCADE
);

-- BOOKINGS
CREATE TABLE bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    package_id INT NOT NULL,
    travel_date DATE NOT NULL,
    num_travelers INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    status ENUM('pending','confirmed','canceled') DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (package_id) REFERENCES tour_packages(package_id) ON DELETE CASCADE
);

-- REVIEWS
CREATE TABLE reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    destination_id INT,
    package_id INT,
    rating INT NOT NULL,
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE,
    FOREIGN KEY (destination_id) REFERENCES destinations(destination_id) ON DELETE CASCADE,
    FOREIGN KEY (package_id) REFERENCES tour_packages(package_id) ON DELETE CASCADE
);

-- CONTACT INQUIRIES
CREATE TABLE contact_inquiries (
    inquiry_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL,
    message TEXT NOT NULL,
    inquiry_type ENUM('support','booking','general') DEFAULT 'general',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ===========================================
-- CONSTRAINTS
-- ===========================================

-- Unique user emails
ALTER TABLE users ADD CONSTRAINT unique_user_email UNIQUE (email);

-- Checks
ALTER TABLE tour_packages ADD CONSTRAINT chk_price CHECK (price >= 0);
ALTER TABLE tour_packages ADD CONSTRAINT chk_duration CHECK (duration_days > 0);
ALTER TABLE bookings ADD CONSTRAINT chk_travelers CHECK (num_travelers > 0);
ALTER TABLE bookings ADD CONSTRAINT chk_total_price CHECK (total_price >= 0);
ALTER TABLE reviews ADD CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5);

-- ===========================================
-- INDEXES
-- ===========================================

CREATE INDEX idx_user_email ON users(email);
CREATE INDEX idx_category ON destinations(category);
CREATE INDEX idx_package_price ON tour_packages(price);
CREATE INDEX idx_booking_user ON bookings(user_id);
CREATE INDEX idx_booking_package ON bookings(package_id);
CREATE INDEX idx_review_rating ON reviews(rating);

-- ===========================================
-- SEED DATA
-- ===========================================

-- USERS
INSERT INTO users (name, email, password_hash, role, phone, country) VALUES
('Nikhil Rokade','nikhil@example.com','hash1','user','9876543210','India'),
('Priya Sharma','priya@example.com','hash2','user','9876500011','India'),
('Amit Verma','amit@example.com','hash3','user','9876500022','India'),
('Sara Khan','sara@example.com','hash4','user','9876500033','UAE'),
('John Smith','john@example.com','hash5','user','9876500044','USA'),
('Emma Brown','emma@example.com','hash6','user','9876500055','UK'),
('David Lee','david@example.com','hash7','user','9876500066','Canada'),
('Ravi Patel','ravi@example.com','hash8','user','9876500077','India'),
('Meera Joshi','meera@example.com','hash9','user','9876500088','India'),
('Admin User','admin@example.com','hash10','admin','9876500099','India');

-- DESTINATIONS
INSERT INTO destinations (name, description, city, country, category, image_url) VALUES
('Goa Beaches','Beautiful beaches of Goa','Goa','India','Beach','goa.jpg'),
('Jaipur Forts','Historic forts of Jaipur','Jaipur','India','Cultural','jaipur.jpg'),
('Manali Hills','Snowy mountains of Manali','Manali','India','Adventure','manali.jpg'),
('Kerala Backwaters','Peaceful houseboats and rivers','Alleppey','India','Wildlife','kerala.jpg'),
('Dubai Desert','Desert safari experience','Dubai','UAE','Adventure','dubai.jpg'),
('London Eye','Iconic Ferris wheel in London','London','UK','Cultural','london.jpg'),
('Niagara Falls','World famous waterfall','Ontario','Canada','Adventure','niagara.jpg'),
('Bali Beaches','Scenic tropical beaches','Bali','Indonesia','Beach','bali.jpg'),
('Paris Eiffel','Romantic city with Eiffel Tower','Paris','France','Cultural','paris.jpg'),
('Jim Corbett','Famous Indian wildlife sanctuary','Nainital','India','Wildlife','corbett.jpg');

-- PACKAGES
INSERT INTO tour_packages (title, description, price, duration_days, itinerary, destination_id) VALUES
('Goa Party Tour','3 days in Goa with beach parties',15000,3,'Day1-Beach, Day2-Club, Day3-Cruise',1),
('Jaipur Heritage','2 days exploring forts',12000,2,'Day1-Amber Fort, Day2-City Palace',2),
('Manali Snow Fun','5 days skiing and trekking',25000,5,'Day1-Ski, Day2-Trek, Day3-Local',3),
('Kerala Houseboat','2 days in backwaters',18000,2,'Day1-Houseboat, Day2-Sightseeing',4),
('Dubai Desert Safari','3 days adventure in desert',35000,3,'Day1-Safari, Day2-Dunes, Day3-City',5),
('London Explorer','4 days city tour',60000,4,'Day1-Eye, Day2-Museum, Day3-City',6),
('Niagara Trip','2 days at Niagara Falls',40000,2,'Day1-Falls, Day2-Boat ride',7),
('Bali Relaxation','5 days beach holiday',45000,5,'Day1-Beach, Day2-Spa, Day3-Island',8),
('Paris Romance','3 days in Paris',55000,3,'Day1-Eiffel, Day2-Louvre, Day3-City',9),
('Corbett Safari','2 days wildlife safari',20000,2,'Day1-Safari, Day2-Trek',10);

-- BOOKINGS
INSERT INTO bookings (user_id, package_id, travel_date, num_travelers, total_price, status) VALUES
(1,1,'2025-09-01',2,30000,'pending'),
(2,2,'2025-09-10',1,12000,'confirmed'),
(3,3,'2025-09-15',4,100000,'pending'),
(4,4,'2025-09-20',2,36000,'canceled'),
(5,5,'2025-09-25',3,105000,'confirmed'),
(6,6,'2025-09-28',1,60000,'pending'),
(7,7,'2025-10-01',2,80000,'confirmed'),
(8,8,'2025-10-05',2,90000,'pending'),
(9,9,'2025-10-08',1,55000,'confirmed'),
(10,10,'2025-10-12',4,80000,'confirmed');

-- REVIEWS
INSERT INTO reviews (user_id, destination_id, package_id, rating, comment) VALUES
(1,1,1,5,'Amazing experience at Goa'),
(2,2,2,4,'Loved the forts of Jaipur'),
(3,3,3,5,'Snow adventure was great'),
(4,4,4,4,'Peaceful backwaters in Kerala'),
(5,5,5,5,'Best desert safari ever'),
(6,6,6,3,'London was good but costly'),
(7,7,7,5,'Niagara was breathtaking'),
(8,8,8,4,'Relaxing time in Bali'),
(9,9,9,5,'Paris was magical'),
(10,10,10,4,'Corbett safari was exciting');

-- CONTACT INQUIRIES
INSERT INTO contact_inquiries (name,email,message,inquiry_type) VALUES
('Raj Kumar','raj@example.com','Need help with booking','support'),
('Anita Mehta','anita@example.com','Looking for honeymoon packages','booking'),
('Vivek Rao','vivek@example.com','When is best season for Goa?','general'),
('Sunita Sharma','sunita@example.com','How to cancel a booking?','support'),
('Kiran Patel','kiran@example.com','Do you offer group discounts?','booking'),
('Alex Brown','alex@example.com','Need help resetting password','support'),
('Sophia Lee','sophia@example.com','Which tours include food?','general'),
('Rahul Gupta','rahul@example.com','Booking failed, payment issue','support'),
('Neha Jain','neha@example.com','Looking for cultural tours','booking'),
('Mohit Verma','mohit@example.com','Do you offer student discounts?','general');

-- ===========================================
-- SAMPLE QUERIES
-- ===========================================

-- 1. Insert a new user
INSERT INTO users (name,email,password_hash,role,country)
VALUES ('Test User','test@example.com','hash11','user','India');

-- 2. List all destinations by category
SELECT * FROM destinations WHERE category='Adventure';

-- 3. Filter packages by price range
SELECT * FROM tour_packages WHERE price BETWEEN 15000 AND 40000;

-- 4. Fetch user bookings with package details
SELECT b.booking_id, u.name, p.title, b.status, b.travel_date
FROM bookings b
JOIN users u ON b.user_id = u.user_id
JOIN tour_packages p ON b.package_id = p.package_id
WHERE u.user_id=1;

-- 5. Get reviews for a specific destination
SELECT r.rating, r.comment, u.name, r.created_at
FROM reviews r
JOIN users u ON r.user_id = u.user_id
WHERE r.destination_id=3;

-- 6. Update a booking status
UPDATE bookings SET status='confirmed' WHERE booking_id=1;

-- 7. Delete a review
DELETE FROM reviews WHERE review_id=6;

-- 8. Fetch top-rated destinations (average rating >=4.5)
SELECT d.name, AVG(r.rating) as avg_rating
FROM reviews r
JOIN destinations d ON r.destination_id = d.destination_id
GROUP BY d.name
HAVING avg_rating >=4.5;

-- 9. Count bookings per package
SELECT p.title, COUNT(b.booking_id) as total_bookings
FROM tour_packages p
LEFT JOIN bookings b ON p.package_id = b.package_id
GROUP BY p.title;

-- 10. Paginate destinations (first 5)
SELECT * FROM destinations LIMIT 5 OFFSET 0;
