-- =============================================================
-- Case ID: TC_ARCHITECTURE_STATEMENT_PART_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_ARCHITECTURE_STATEMENT_PART
-- Standard Reference: IEEE 1076-2008 Section 3.3.1
-- Production: architecture_statement_part ::= { concurrent_statement }
-- Case Type: Positive
-- Test Focus: Single kind, multiple instances - statement part contains only 3 component_instantiations (structural architecture) + 1 concurrent_signal_assignment connecting the output, verifying the same kind of concurrent_statement may appear any number of times in the statement part
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity asp_structural_ent is port(a,b:in bit; y_and,y_or,y_xor:out bit); end entity;
architecture structural of asp_structural_ent is
  component and2 is port(x1,x2:in bit; z:out bit); end component;
  component or2  is port(x1,x2:in bit; z:out bit); end component;
  component xor2 is port(x1,x2:in bit; z:out bit); end component;
  signal s_and,s_or,s_xor:bit;
begin
  u_and:and2 port map(x1=>a,x2=>b,z=>s_and);
  u_or:or2   port map(x1=>a,x2=>b,z=>s_or);
  u_xor:xor2 port map(x1=>a,x2=>b,z=>s_xor);
  y_and<=s_and; y_or<=s_or; y_xor<=s_xor;
end architecture structural;
