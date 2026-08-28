-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Multiple concurrent signal assignments forming a combinational logic chain - statement part contains 4 concurrent_signal_assignments: wire_and(a AND b), wire_or(a OR b), wire_not(NOT wire_and), wire_xor(wire_and XOR wire_or), forming a pure combinational data path, verifying multiple concurrent signal assignments chain legally as concurrent_statements in the architecture statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_comb_ent is port(a,b:in bit; y_and,y_or,y_not,y_xor:out bit); end entity;
architecture bh of asp_comb_ent is
  signal w_and,w_or:bit;
begin
  w_and<=a and b;
  w_or<=a or b;
  y_and<=w_and;
  y_or<=w_or;
  y_not<=not w_and;
  y_xor<=w_and xor w_or;
end architecture bh;
