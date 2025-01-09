/*
1. It is an inbuilt mechanism of sv used to exchange data between component of sv.
2. It may be hetrogeneous collection of data element (bit,byte,string).
3. It may behave like FIFO.
Types of Mailbox
1.Bounded type : size of mailbox is fixed ,if mailbox is full then no further data can be placed inside until any data element is fetched.
    syntax mailbox m_box=new[4];//it can hold only max 4 data element
2.Unbounded type: size of mailbox is unlimited, user can be place and retrive any number of data elements.
3.Parameterized mailbox: it can be used when data type is fixed ,it can deal with only particular data type.

Methods:
num()-It is a function which return the no of elements inside the mailbox.
new()-It is a function which return the mailbox handle ,an argument can be placed for bounded type else it will behaves as an unbounded mailbox.
put()-It is a task,blocking method,use to place data inside mailbox.
try_put()-It is function ,non-blocking method that store data in mailbox if it is not full and return 1 else 0.
get- It is a task,blocking method ,use to get the data from mailbox.
try_get()- It is function ,non-blocking method which return data  if it is non empty else return 1 else 0.
try_peek()-It is a task copies data from mailbox without removing the actual data.
*/
class packet;

	rand bit [7:0]addr;
	rand bit [7:0]data;

	function void post_randomize();
		$display("Packet Generated");
		$display("addr=%0d,Data=%0d",addr,data);
	endfunction

endclass

class generator;

	packet 	pkt;
	mailbox m_box;

	function new(mailbox m_box);
		this.m_box=m_box;
	endfunction

	task run();
	repeat(2)
	begin
	pkt=new();
	pkt.randomize();
	m_box.put(pkt);
	$display("-----------------------");
	$display("packet put into Mailbox");
	$display("addr=%0d,Data=%0d",pkt.addr,pkt.data);
	$display("-----------------------");

	#5;
	end
	endtask

endclass

class driver;

	packet pkt ;
	mailbox m_box;

	function new(mailbox m_box);
		this.m_box=m_box;
	endfunction

	task run();
	repeat(2)
	begin

	pkt =new();
	pkt.randomize();
	m_box.get(pkt);
	$display("-----------------------");
	$display("packet get into mailbox");
	$display("addr=%0d,Data=%0d",pkt.addr,pkt.data);
	$display("-----------------------");
	#5;
	end
	endtask
endclass

//`include "packet.sv"
//`include "generator.sv"
//`include "driver.sv"

	module mailbox_ex;
		generator gen;
		driver drv;
		mailbox m_box;

		initial
	          begin
		   m_box=new();
		   gen=new(m_box);
		   drv=new(m_box);
		   $display("*********************");
		   fork
		   gen.run();
		   drv.run();
		   join
		   $display("*********************");
		   end
	 endmodule

