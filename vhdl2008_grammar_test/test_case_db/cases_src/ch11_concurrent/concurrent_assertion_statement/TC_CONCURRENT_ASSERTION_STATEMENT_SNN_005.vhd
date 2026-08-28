-- =============================================================
-- Case ID: TC_CONCURRENT_ASSERTION_STATEMENT_SNN_005
-- Rule Type: Syntax
-- Related Rule ID: BNF_CONCURRENT_ASSERTION_STATEMENT
-- Standard Reference: IEEE 1076-2008 Section 11.5
-- Production: concurrent_assertion_statement ::= [ label : ] [ postponed ] assertion ;
-- Case Type: Negative
-- Test Focus: SNN: missing colon after label — in `chk_data assert ...` the label is followed directly by assert with no colon delimiter, verifying that there must be a colon between the label and the statement body of a labeled assertion
-- Expected Result: Triggers syntax error: missing ":" after concurrent assertion label
-- Dependencies: None
-- =============================================================
entity ca_snn5_ent is
  port(data : in bit_vector(3 downto 0));
end entity ca_snn5_ent;
architecture bh of ca_snn5_ent is
begin
  chk_data assert data /= "XXXX" report "unknown data" severity error;
end architecture bh;
