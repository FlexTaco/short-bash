#!/bin/bash

# Database connection details
# DB_USER=""
# DB_NAME="salon_scheduler"

display_appointments() {
    echo "Upcoming Appointments:"
    psql -U $DB_USER -d $DB_NAME -c "SELECT * FROM appointments WHERE appointment_date >= NOW() ORDER BY appointment_date;"
}

schedule_appointment() {
    read -p "Enter customer name: " customer_name
    read -p "Enter appointment date (YYYY-MM-DD HH:MM): " appointment_date

    psql -U $DB_USER -d $DB_NAME -c "INSERT INTO appointments (customer_name, appointment_date) VALUES ('$customer_name', '$appointment_date');"
    
    echo "Appointment scheduled successfully!"
}

while true; do
    echo -e "\nSalon Appointment Scheduler"
    echo "1. Display Appointments"
    echo "2. Schedule Appointment"
    echo "3. Exit"
    
    read -p "Choose an option (1/2/3): " choice

    case $choice in
        1) display_appointments;;
        2) schedule_appointment;;
        3) echo "Exiting..."; exit;;
        *) echo "Invalid choice. Please enter 1, 2, or 3.";;
    esac
done
