//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

#include "Registrar.h"
#include "Job.h"

Define_Module(Registrar);

void Registrar::initialize()
{
    // TODO - Generated method body
}

void Registrar::handleMessage(cMessage *msg) {
    queueing::Job *job = check_and_cast<queueing::Job *>(msg);
    if (uniform(0, 1) < par("acceptenceRate").doubleValue()) {
        send(job, "registered");
    } else {
        send(job, "failedRegistration");
    }
}
