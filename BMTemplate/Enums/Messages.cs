using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BMTemplate
{
    internal static class Messages
    {
        public const string RECORD_INSERTED_SUCESSFULLY = "Record Saved successfully";
        public const string RECORD_UPDATED_SUCESSFULLY = "Record Updated successfully";
        public const string RECORD_ALREADY_EXISTS = "Record Already Exists";
        public const string RECORD_DELETED_SUCESSFULLY = "Record Deleted successfully";
        public const string YOU_CAN_NOT_REMOVE_ALL_RECORDS = "You can not remove all records";
        public const string CREDENTIALS = "Please Enter Correct User Credentials";
        public const string AVAILABILITY_VEH = "This Vehicle is available to be assigned to a trip";
        public const string NONAVAILABILITY_VEH = "This Vehicle is not available to be assigned to a trip";
        public const string RECORD_DOES_NOT_EXIST = "Record does not exist";
        public const string SELECT_SEARCH_CRITERIA = "Please select a search criteria";
        public const string RECORD_NOT_DELETED_SUCESSFULLY = "Record not deleted successfully";
        public const string PERSAL_ID_ALREADY_EXISTS = "Persal Number or ID Number already Exists";
        public const string PASSEGERS_MISSING_INFORMATION = "Name, Surname and Id Number for all passangers are required";
        public const string REPORT_SERVER_PATH_NOT_FOUND = "Report Server path was not found. Please contact helpdesk.";
        public const string TRIP_AUTHORITY_REPORT_PATH_NOT_FOUND = "Trip Authority Report path was not found. Please contact helpdesk.";
        public const string TRIP_PARAMETER_NO_FOUND = "Trip Parameter was not found in the report. Please contact helpdesk.";
        public const string UNEXPECTED_ERROR_OCCURRED = "An Unexpected Error Occurred. Please contact helpdesk.";
        public const string PASSENGERS_ADDED_SUCCESFULLY = "Passengers Added Succesfully";
        public const string RECORD_INSERTED_NOT_SUCESSFULLY = "Record add was not successful.";
        public const string RECORD_UPDATED_NOT_SUCESSFULLY = "Record update was not successful.";
        public const string TRIP_ACCIDENT_CANNOT_EARLIER_TRIP_DATE = "Accident date can not be earlier than trip date.";
        public const string REPORT_NAME_NOT_FOUND = "Report name not found. Please contact helpdesk.";
        public const string ODO_METER_INVALID = "Odo Meter must be a numeric value";
    }
}