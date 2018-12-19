using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ubus.BackEnd.Entity
{
    public class TravelEntity: System.Attribute
    {
        public int Id { get; private set; }
        public VehicleEntity Vehicle { get; private set; }
        public EmployeeEntity Driver { get; private set; }
        public RouteEntity Route { get; private set; }
        public ItineraryEntity Itinerary { get; private set; }
        public float Value { get; private set; }
        public string VehiclePosition { get; private set; }
        public string Status { get; private set; }
        public DateTime ScheduleDate { get; private set; }

        public TravelEntity(int id, int idVehicle, string brand, string model, int idDriver, string name, string function, int idRoute,
            string description, int idItinerary, string startHour, string endHour, float value, string vehiclePosition, string status, DateTime scheduleDate)
        {
            Id = id;
            Vehicle = new VehicleEntity() { Id = idVehicle, Brand = brand, Model = model };
            Driver = new EmployeeEntity() { Id = idDriver, Name = name, Function = function };
            Route = new RouteEntity() { Id = idRoute, Description = description };
            Itinerary = new ItineraryEntity() { Id= idItinerary, StartHour = startHour, EndHour = endHour};
            Value = value;
            VehiclePosition = vehiclePosition;
            Status = status;
            ScheduleDate = scheduleDate;
            
        }

    }
}
