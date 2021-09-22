using Microsoft.EntityFrameworkCore.Migrations;

namespace MoneyTrack.Data.Migrations
{
    public partial class UpdatedField : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IsAutomatedPament",
                table: "Order",
                newName: "IsAutomatedPayment");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IsAutomatedPayment",
                table: "Order",
                newName: "IsAutomatedPament");
        }
    }
}
