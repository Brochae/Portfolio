using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using CPUFramework;
using PortfolioBizObjects;
using System.Data;
using NUnit.Framework;
using System.Data.SqlClient;

namespace PortfolioUnitTest
{
    public class Tests
    {
        private static string connstring = "";
        int myprofileid;
        int totaldevsections;
        int mindevsectionid;
        string mindevsectionname = "";
        int mindevsubsectionid;
        string mindevsubsectionname = "";

        DataTable dt = new();

        [SetUp]
        public void Setup()
        {
            SetConnectionString();
            DataUtility.ConnectionString = connstring;
            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select * from Profile");
            myprofileid = (int)dt.Rows[0]["ProfileId"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select Total = Count(*) from DevSection");
            totaldevsections = (int)dt.Rows[0]["Total"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 * from DevSection order by DevSectionId");
            mindevsectionid = (int)dt.Rows[0]["DevSectionId"];
            mindevsectionname = (string)dt.Rows[0]["DevSectionName"];

            dt = SQLUtility.GetDataTable(DataUtility.ConnectionString, "select top 1 * from DevSubsection order by DevSubsectionId");
            mindevsubsectionid = (int)dt.Rows[0]["DevSubsectionId"];
            mindevsubsectionname = (string)dt.Rows[0]["DevSubsectionName"];
        }

        private bizProfile LoadProfile(int id)
        {
            bizProfile profileobj = bizProfile.Get(id);
            return profileobj;
        }
        private bizDevSection LoadDevSection(int id)
        {
            bizDevSection devsectionobj = bizDevSection.Get(id);
            return devsectionobj;
        }

        private bizDevSubsection LoadDevSubsection(int id)
        {
            bizDevSubsection devsubsectionobj = bizDevSubsection.Get(id);
            return devsubsectionobj;
        }
        private List<bizDevSection> LoadDevSectionList()
        {
            List<bizDevSection> lst = bizDevSection.GetAll();
            return lst;
        }
        public static string SetConnectionString()
        {
            connstring = "Server=.\\SQLExpress;Initial Catalog=PortfolioDB;Trusted_Connection=yes;";
            using (SqlConnection conn = new SqlConnection(connstring))
            {
                conn.Open();
            }
            return connstring;
        }

        [Test]
        public void TestLoadProfile()
        {
            bizProfile p = this.LoadProfile(myprofileid);
            TestContext.WriteLine("FirstName = " + p.FirstName);
            Assert.IsTrue(p.FirstName == "Brocha");
        }

        [Test]
        public void TestLoadDevSectionList()
        {
            List<bizDevSection> lst = this.LoadDevSectionList();
            TestContext.WriteLine("Total DevSections = " + lst.Count);
            Assert.IsTrue(lst.Count == totaldevsections);
        }
        [Test]
        public void TestLoadDevSection()
        {
            bizDevSection ds = this.LoadDevSection(mindevsectionid);
            TestContext.WriteLine(ds.DevSectionName + " " + ds.DevSectionOverview);
            Assert.IsTrue(ds.DevSectionName == mindevsectionname);
        }
        [Test]
        public void TestLoadDevSubsection()
        {
            bizDevSubsection dss = this.LoadDevSubsection(mindevsubsectionid);
            TestContext.WriteLine(dss.DevSubsectionName);
            Assert.IsTrue(dss.DevSubsectionName == mindevsubsectionname);
        }


    }
}