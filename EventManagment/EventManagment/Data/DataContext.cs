using EventManagment.models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.EntityFrameworkCore.Metadata;

namespace EventManagment.Data;

public class DataContext : DbContext //creating tables
{

    public DataContext(DbContextOptions<DataContext> options)
        : base(options)
    {

    }
    public DbSet<Users> Users { get; set; }
    public DbSet<Event> Events { get; set; }
    public DbSet<Tickets> Tickets { get; set; }
    public DbSet<Order> Orders { get; set; }
    public DbSet<Location> Locations { get; set; }

    

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlServer(@"Data Source=(localdb)\MSSQLLocalDB;Initial Catalog=EventManagment;Integrated Security=True;Connect Timeout=30;Encrypt=False;Trust Server Certificate=False;Application Intent=ReadWrite;Multi Subnet Failover=False").LogTo(Console.WriteLine, LogLevel.Information); ;
    }
}
