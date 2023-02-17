using api.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace api
{
    public class Team
    {

        public string teamName { get; }

       public List<TeamMember> teamMembers { get;  }


        public Team()
        {
            teamName = "New Jeans Lovers";

            teamMembers = new List<TeamMember>();

            teamMembers.Add(new TeamMember("Karen", "Beep boop bop bop, ttutturuuuuu"));
            teamMembers.Add(new TeamMember("Lauren", "BEEEEEEEEES"));
            teamMembers.Add(new TeamMember("Ryan", "Dr.Pepper is the drink of intellectuals"));

        }

    }
}
