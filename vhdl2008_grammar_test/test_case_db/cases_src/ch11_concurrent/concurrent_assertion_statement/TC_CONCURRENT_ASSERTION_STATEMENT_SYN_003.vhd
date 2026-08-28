-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SYN_003
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Positive
-- Test Focus: labeled concurrent assertion — `chk_setup : assert ...` checks the setup time on the rising clock edge, verifying the complete form of a labeled concurrent assertion
-- Expected Result: Compiles successfully
-- Dependencies: None
-- =============================================================
entity ca_label_ent is
  port(clk, data, enable : in bit);
end entity ca_label_ent;
architecture bh of ca_label_ent is
begin
  chk_setup : assert not (clk'event and clk = '1' and data /= enable)
    report "setup violation: data changed on clock edge" severity error;
end architecture bh;
