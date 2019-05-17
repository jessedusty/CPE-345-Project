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
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.Source;


//
// TODO auto-generated type
//
network Scheduler
{
    @display("bgb=415,317");
    submodules:
        queue: Queue {
            @display("p=138,114");
        }
        source: Source {
            @display("p=47,114");
        }
        sink: Sink {
            @display("p=316,114");
        }
        registrar: Registrar {
            @display("p=233,114");
        }
    connections:
        queue.out --> registrar.in;
        registrar.registered --> sink.in++;
        source.out --> queue.in++;
        registrar.failedRegistration --> queue.in++;
}
