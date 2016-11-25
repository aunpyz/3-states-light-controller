module counter(q, clk, reset);
	input clk, reset;
	output [1:0]q;
	wire q1, q0, nclk, nq1, t01;
	not n0(nq1, q[1]);
	xor x0(t01, q[1], q[0]);
	L_F l(nclk, clk);
	T_FF t0(q[0], nq1, nclk, reset);
	T_FF t1(q[1], t01, nclk, reset);
endmodule

module T_FF(q, t, clk, reset);
	output q;
	input t, clk, reset;
	wire d;
	xor x1(d, q, t);
	D_FF d1(q, d, clk, reset);
endmodule

module D_FF(q, d, clk, reset);
	output q;
	input d, clk, reset;
	reg q;
	
	always @(posedge reset or negedge clk)
		if(reset)
			q = 1'b0;
		else
			q = d;
endmodule

module L_F(q, clk);
	output q;
	input clk;
	wire [17:0]w;
	T_FF t0(w[0], 1'b1, clk, 1'b0);
	T_FF t1(w[1], 1'b1, w[0], 1'b0);
	T_FF t2(w[2], 1'b1, w[1], 1'b0);
	T_FF t3(w[3], 1'b1, w[2], 1'b0);
	T_FF t4(w[4], 1'b1, w[3], 1'b0);
	T_FF t5(w[5], 1'b1, w[4], 1'b0);
	T_FF t6(w[6], 1'b1, w[5], 1'b0);
	T_FF t7(w[7], 1'b1, w[6], 1'b0);
	T_FF t8(w[8], 1'b1, w[7], 1'b0);
	T_FF t9(w[9], 1'b1, w[8], 1'b0);
	T_FF t10(w[10], 1'b1, w[9], 1'b0);
	T_FF t11(w[11], 1'b1, w[10], 1'b0);
	T_FF t12(w[12], 1'b1, w[11], 1'b0);
	T_FF t13(w[13], 1'b1, w[12], 1'b0);
	T_FF t14(w[14], 1'b1, w[13], 1'b0);
	T_FF t15(w[15], 1'b1, w[14], 1'b0);
	T_FF t16(w[16], 1'b1, w[15], 1'b0);
	T_FF t17(w[17], 1'b1, w[16], 1'b0);
	T_FF t18(q, 1'b1, w[17], 1'b0);
endmodule
