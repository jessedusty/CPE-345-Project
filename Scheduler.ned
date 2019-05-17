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

import org.omnetpp.queueing.Classifier;
import org.omnetpp.queueing.Merge;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Router;
import org.omnetpp.queueing.Server;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO auto-generated type
//
network Scheduler
{
    parameters:
        int serverCount @display("bgb=525,317") = default(1);
    submodules:
        source: Source {
            @display("p=47,114");
        }
        sink: Sink {
            @display("p=458,114");
        }
        registrar: Registrar {
            @display("p=378,114");
        }
        passiveQueue: PassiveQueue {
            @display("p=133,114");
        }
        server[serverCount]: Server {
            @display("p=222,51");
        }

        merge: Merge {
            @display("p=309,51");
        }
    connections:
        registrar.registered --> sink.in++;
        for i=0..serverCount-1 {
            passiveQueue.out++ --> server[i].in++;
            server[i].out --> merge.in++;
        }
        source.out --> passiveQueue.in++;
        merge.out --> registrar.in;
        registrar.failedRegistration --> passiveQueue.in++;
}
