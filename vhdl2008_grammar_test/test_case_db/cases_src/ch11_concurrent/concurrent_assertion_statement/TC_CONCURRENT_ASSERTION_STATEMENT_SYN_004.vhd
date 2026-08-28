-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_004
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Positive
-- Test Focus: postponed concurrent assertion — `postponed assert ...` executes with delay at the end of the simulation cycle, verifying the syntax of a concurrent assertion modified by the postponed keyword
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ca_postponed_ent is
  port(clk : in bit; a, b : in integer; y : out integer);
end entity ca_postponed_ent;
architecture bh of ca_postponed_ent is
begin
  postponed assert y = a + b
    report "postponed: output mismatch after stabilization" severity warning;
  y <= a + b;
end architecture bh;
