using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ubus.BackEnd.Entity
{
    public class EmployeeEntity
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Function { get; set; }
        public DateTime BirthDate { get; set; }
        public DateTime AdmissionDate { get; set; }

    }
}
