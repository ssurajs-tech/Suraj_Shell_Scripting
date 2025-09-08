#!/bin/bash
 
read -p "Enter a name of season [spring, summer, autumn, winter]: " season
read -p "Enter a number of month [1-3]: " month
 
case $season in
        "spring")
                case $month in
                        1)
                                echo "March"
                                ;;
                        2)
                                echo "April"
                                ;;
                        3)
                                echo "May"
                                ;;
                        *)
                                echo "Invalid month!"
                                ;;
                esac
                ;;
        "summer")
                case $month in
                        1)
                                echo "June"
                                ;;
                        2)
                                echo "July"
                                ;;
                        3)
                                echo "August"
                                ;;
                        *)
                                echo "Invalid month!"
                                ;;
                esac
                ;;
        "autumn")
                case $month in
                        1)
                                echo "September"
                                ;;
                        2)
                                echo "October"
                                ;;
                        3)
                                echo "November"
                                ;;
                        *)
                                echo "Invalid month!"
                                ;;
                esac
                ;;
        "winter")
                case $month in
                        1)
                                echo "December"
                                ;;
                        2)
                                echo "January"
                                ;;
                        3)
                                echo "February"
                                ;;
                        *)
                                echo "Invalid month!"
                                ;;
                esac
                ;;
        *)
                echo "Invalid season!"
                ;;
esac