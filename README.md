

---

# 🧳 Tours & Travels Database  

This project is a **MySQL relational database** designed for a **Tours & Travels Management System**.  
It provides a structured schema to manage **users, destinations, tour packages, bookings, reviews, and customer inquiries**.  

---

## 📂 Project Structure  

```

Tours\_Travels\_DB/
│
├── schema.sql            # Database creation and table definitions
├── constraints.sql       # Constraints and validations
├── indexes.sql           # Indexes for faster queries
├── seed\_data.sql         # Initial data population (sample users, packages, bookings, etc.)
├── sample\_queries.sql    # Example SQL queries to interact with the database
└── README.md             # Project documentation

````

---

## 📌 Features  

- 👤 **User Management**: Registration, login, roles (`user`, `admin`).  
- 🏝️ **Destinations**: Stores details of locations with categories like *Adventure, Beach, Cultural, Wildlife*.  
- 🎒 **Tour Packages**: Linked to destinations with pricing, itinerary, and duration.  
- 📅 **Bookings**: Users can book packages with traveler count, travel dates, and status tracking.  
- ⭐ **Reviews**: Users can rate and review destinations and packages.  
- 📧 **Contact Inquiries**: Handles customer messages (support, booking, general).  

---

## 🛠️ Database Schema  

### 🏗️ Entities  

1. **Users** → Travelers & admins.  
2. **Destinations** → Tourist spots (Goa, Paris, Dubai, etc.).  
3. **Tour Packages** → Package details tied to destinations.  
4. **Bookings** → Records of package bookings by users.  
5. **Reviews** → Ratings & feedback from users.  
6. **Contact Inquiries** → Support/booking queries.  

### 🔗 Relationships  

- A **user** can make multiple **bookings**.  
- A **destination** can have multiple **packages**.  
- A **package** can have multiple **reviews** and **bookings**.  
- A **user** can write multiple **reviews**.  

---

## ✅ Constraints  

- 📧 **Unique emails** for users.  
- 📊 **Check constraints**:  
  - Price ≥ 0  
  - Duration > 0  
  - Travelers > 0  
  - Ratings between 1–5  
- 🔐 **Foreign keys** with `ON DELETE CASCADE`.  

---

## ⚡ Indexes  

- `idx_user_email` → Quick user lookups by email.  
- `idx_category` → Retrieve destinations by category.  
- `idx_package_price` → Query optimization for price filters.  
- `idx_booking_user`, `idx_booking_package` → Faster booking queries.  
- `idx_review_rating` → Analyze top-rated destinations quickly.  

---

## 📊 Sample Data  

- 👥 **10 users** (including 1 admin).  
- 🌍 **10 destinations** (Goa, Paris, Bali, Dubai, etc.).  
- 🎟️ **10 packages** linked to destinations.  
- 📝 **10 bookings** with different statuses.  
- ⭐ **10 reviews** with ratings & comments.  
- 📧 **10 inquiries** for support/booking/general queries.  

---

## 🔍 Example Queries  

1. ➕ **Insert a new user**  
   ```sql
   INSERT INTO users (name,email,password_hash,role,country)
   VALUES ('Test User','test@example.com','hash11','user','India');
````

2. 🌍 **List destinations by category**

   ```sql
   SELECT * FROM destinations WHERE category='Adventure';
   ```

3. 📅 **Fetch user bookings with package details**

   ```sql
   SELECT b.booking_id, u.name, p.title, b.status, b.travel_date
   FROM bookings b
   JOIN users u ON b.user_id = u.user_id
   JOIN tour_packages p ON b.package_id = p.package_id
   WHERE u.user_id=1;
   ```

4. ⭐ **Get top-rated destinations**

   ```sql
   SELECT d.name, AVG(r.rating) as avg_rating
   FROM reviews r
   JOIN destinations d ON r.destination_id = d.destination_id
   GROUP BY d.name
   HAVING avg_rating >=4.5;
   ```

---

## 🚀 How to Run

1. Open **MySQL CLI or Workbench**.
2. Run the schema script to create database & tables:

   ```sql
   source schema.sql;
   ```
3. Apply constraints & indexes:

   ```sql
   source constraints.sql;
   source indexes.sql;
   ```
4. Load seed data:

   ```sql
   source seed_data.sql;
   ```
5. Test using sample queries:

   ```sql
   source sample_queries.sql;
   ```

---

## 📌 Future Enhancements

* 💳 Add **payment records** table.
* 🎁 Implement **loyalty rewards system**.
* 📊 Introduce **admin dashboards** for analytics.
* 🌐 Add **multi-language support** for destinations.

---

## 👨‍💻 Author

**Nikhil Rokade**


---

