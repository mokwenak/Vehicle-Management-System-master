﻿

//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------


namespace BMTemplate
{

using System;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;


public partial class Vehicle_ManagementEntities : DbContext
{
    public Vehicle_ManagementEntities()
        : base("name=Vehicle_ManagementEntities")
    {

    }

    protected override void OnModelCreating(DbModelBuilder modelBuilder)
    {
        throw new UnintentionalCodeFirstException();
    }


    public virtual DbSet<Accident> Accidents { get; set; }

    public virtual DbSet<AuditTrail> AuditTrails { get; set; }

    public virtual DbSet<Bank> Banks { get; set; }

    public virtual DbSet<Category> Categories { get; set; }

    public virtual DbSet<EngineCapicity> EngineCapicities { get; set; }

    public virtual DbSet<FuelType> FuelTypes { get; set; }

    public virtual DbSet<GarageCard> GarageCards { get; set; }

    public virtual DbSet<OffenceType> OffenceTypes { get; set; }

    public virtual DbSet<OfficeType> OfficeTypes { get; set; }

    public virtual DbSet<Passenger> Passengers { get; set; }

    public virtual DbSet<PeriodType> PeriodTypes { get; set; }

    public virtual DbSet<Province> Provinces { get; set; }

    public virtual DbSet<Report> Reports { get; set; }

    public virtual DbSet<Responsibility> Responsibilities { get; set; }

    public virtual DbSet<ServiceType> ServiceTypes { get; set; }

    public virtual DbSet<Status> Statuses { get; set; }

    public virtual DbSet<SupplyType> SupplyTypes { get; set; }

    public virtual DbSet<TripLog> TripLogs { get; set; }

    public virtual DbSet<VehicleMake> VehicleMakes { get; set; }

    public virtual DbSet<VehicleModel> VehicleModels { get; set; }

    public virtual DbSet<VehicleType> VehicleTypes { get; set; }

    public virtual DbSet<TripOffence> TripOffences { get; set; }

    public virtual DbSet<VehicleMaintenance> VehicleMaintenances { get; set; }

    public virtual DbSet<ApplicationSetting> ApplicationSettings { get; set; }

    public virtual DbSet<Trip> Trips { get; set; }

    public virtual DbSet<Workflow> Workflows { get; set; }

    public virtual DbSet<Driver> Drivers { get; set; }

    public virtual DbSet<User> Users { get; set; }

    public virtual DbSet<Office> Offices { get; set; }

    public virtual DbSet<Vehicle> Vehicles { get; set; }

}

}
