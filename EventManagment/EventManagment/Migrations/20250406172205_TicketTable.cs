using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace EventManagment.Migrations
{
    /// <inheritdoc />
    public partial class TicketTable : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "AvailableQuantity",
                table: "Tickets");

            migrationBuilder.RenameColumn(
                name: "Type",
                table: "Tickets",
                newName: "Category");

            migrationBuilder.AddColumn<string>(
                name: "BuyerEmail",
                table: "Tickets",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");

            migrationBuilder.AddColumn<bool>(
                name: "IsUsed",
                table: "Tickets",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<string>(
                name: "PromoCode",
                table: "Tickets",
                type: "nvarchar(max)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "QrCode",
                table: "Tickets",
                type: "nvarchar(max)",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "BuyerEmail",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "IsUsed",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "PromoCode",
                table: "Tickets");

            migrationBuilder.DropColumn(
                name: "QrCode",
                table: "Tickets");

            migrationBuilder.RenameColumn(
                name: "Category",
                table: "Tickets",
                newName: "Type");

            migrationBuilder.AddColumn<int>(
                name: "AvailableQuantity",
                table: "Tickets",
                type: "int",
                nullable: false,
                defaultValue: 0);
        }
    }
}
