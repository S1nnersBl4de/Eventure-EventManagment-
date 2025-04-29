using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace EventManagment.models;

public class Location
{
    [Key]  // Marks it as a primary key
    [DatabaseGenerated(DatabaseGeneratedOption.Identity)] 
    public int Id { get; set; }
    public string City { get; set; }
    public string Address { get; set; }
}
